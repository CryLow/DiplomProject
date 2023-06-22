package com.example.Project.controllers;

import com.example.Project.models.Cart;
import com.example.Project.models.Document;
import com.example.Project.repo.CartRepository;
import com.example.Project.repo.DocumentRepository;
import com.example.Project.repo.UserRepository;
import com.example.Project.services.CartService;
import com.example.Project.services.UserService;
import com.example.Project.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;
    private final CartService cartService;
    private final CartRepository cartRepository;
    private final DocumentRepository documentRepository;
    private final UserRepository userRepository;

    @GetMapping("/login")
    public String login(){
        return "login";
    }
    @GetMapping("/about")
    public String about(Authentication authentication, Model model,Principal principal){
        boolean isAuthentic = false;
        if (authentication != null && authentication.isAuthenticated()) {
            isAuthentic = true;
            model.addAttribute("user",userService.findByUser(principal.getName()));
        }
        model.addAttribute("isAuthentic", isAuthentic);
        return "about";
    }
    @GetMapping("/carts/{id}")
    public String cartsByUser(@PathVariable Long id,Model model, Principal principal,@RequestParam(value = "arch",defaultValue = "false") Boolean arch,@RequestParam(value = "profile",defaultValue = "false") Boolean profile){
        model.addAttribute("profile",true);
        model.addAttribute("carts",userRepository.findById(id).orElse(null).getCarts());
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("arch",arch);
        return "main";
    }
    @GetMapping("/schedule")
    public String schedule(Authentication authentication, Model model,Principal principal) {
        boolean isAuthentic = false;
        if (authentication != null && authentication.isAuthenticated()) {
            isAuthentic = true;
            model.addAttribute("user",userService.findByUser(principal.getName()));
        }
        model.addAttribute("isAuthentic", isAuthentic);
        return "schedule";
    }


    @GetMapping("/main")
    public String main(@RequestParam(name = "title",required = false) String title,@RequestParam(value = "profile",defaultValue = "false") boolean profile, @RequestParam(value = "arch",defaultValue = "false") Boolean arch, Principal principal, Model model){
        model.addAttribute("profile",profile);
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("arch",arch);
        model.addAttribute("carts",cartRepository.findByArchivedFalseOrArchivedIsNull());
        return "main";
    }
    @GetMapping("/archive")
    public String archive(@RequestParam(name = "title",required = false) String title, @RequestParam(value = "arch",defaultValue = "true") Boolean arch, Principal principal, Model model){
        List<Cart> carts = cartRepository.findByArchivedIsTrue();
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("carts",carts);
        model.addAttribute("arch",arch);
        return "main";
    }
    @GetMapping("/open/{id}")
    public ResponseEntity<byte[]> openFile(@PathVariable Long id) {
        Document document = documentRepository.findById(id).orElse(null);
        if (document != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDisposition(ContentDisposition.builder("inline").filename(document.getOriginalFileName()).build());
            return new ResponseEntity<>(document.getBytes(), headers, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    @GetMapping("/")
    public String home() {return "/main";}
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login?logout"; // Перенаправление на страницу входа с параметром logout
    }

     @GetMapping("/registration")
    public String registration(){
        logger.info("Открыто");
    return "registration";
    }
    @GetMapping("/profile/{id}")
    public String profile(@PathVariable Long id, Principal principal,Model model){
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("userProfile",userRepository.findById(id).orElse(null));
        return "profile";
    }
    @GetMapping("/editprofile/{id}")
    public String editprofile (Principal principal, Model model, @PathVariable String id){
        model.addAttribute("user",userService.findByUser(principal.getName()));
        return "editprofile";
    }
    @GetMapping("/created")
    public String created(Principal principal, Model model){
        model.addAttribute("user",userService.findByUser(principal.getName()));
        return "created";
    }
    @GetMapping("/editfile/{id}")
    public String editfile(@PathVariable Long id, Model model,Principal principal){
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("cart", cartService.getCartById(id));
        return "editfile";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        logger.info("Создать?");
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        logger.info("Создан");
        return "redirect:/login";
    }
    @PostMapping("/cart/create")
    public String createCart(@RequestParam("file") MultipartFile file, Cart cart, Principal principal) throws IOException {
        cartService.saveCart(cart,file,cartService.getUserByPrincipal(principal));
        return "redirect:/main";
    }
    @GetMapping("/search-active")
    public String searchA(@RequestParam("searching") String sortParam, @RequestParam("keyword") String keyword,Model model, Principal principal) {
        List<Cart> carts = null;
        if(sortParam.equals("none")){
             carts = cartRepository.findByTitleContainingIgnoreCaseAndArchivedIsNull(keyword);
        }
       else if(sortParam.equals("categoryF")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedIsNull("Федеральные документы",keyword);
        }
       else if(sortParam.equals("categoryD")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedIsNull("Дополнительно-образовательные документы",keyword);
        }
        else if(sortParam.equals("categoryN")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedIsNull("Нормативные документы",keyword);
        }
        else if(sortParam.equals("categoryO")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedIsNull("Организационные документы",keyword);
        }
        else if(sortParam.equals("userS")){
            carts = cartRepository.findByArchivedFalseOrArchivedIsNull();
            Collections.sort(carts,Comparator.comparing(cart -> cart.getUser().getId()));
        }
        else if(sortParam.equals("dateS")){
            carts = cartRepository.findByArchivedFalseOrArchivedIsNull();
            Collections.sort(carts,Comparator.comparing(Cart::getDateOfCreated));
        }
        model.addAttribute("carts", carts);
        model.addAttribute("user",userService.findByUser(principal.getName()));
        return "main";
    }
    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, @RequestParam("searching") String sortParam, @RequestParam(value = "arch",defaultValue = "true") Boolean arch, Model model, Principal principal) {
        List<Cart> carts = null;
        if(sortParam.equals("none")){
            carts = cartRepository.findByTitleContainingIgnoreCaseAndArchivedTrue(keyword);
        }
        else if(sortParam.equals("categoryF")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedTrue("Федеральные документы",keyword);
        }
        else if(sortParam.equals("categoryD")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedTrue("Дополнительно-образовательные документы",keyword);
        }
        else if(sortParam.equals("categoryN")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedTrue("Нормативные документы",keyword);
        }
        else if(sortParam.equals("categoryO")){
            carts = cartRepository.findByCategoryAndTitleContainingIgnoreCaseAndArchivedTrue("Организационные документы",keyword);
        }
        else if(sortParam.equals("userS")){
            carts = cartRepository.findByArchivedIsTrue();
            Collections.sort(carts,Comparator.comparing(cart -> cart.getUser().getId()));
        }
        else if(sortParam.equals("dateS")){
            carts = cartRepository.findByArchivedIsTrue();
            Collections.sort(carts,Comparator.comparing(Cart::getDateOfCreated));
        }
        model.addAttribute("arch",arch);
        model.addAttribute("carts", carts);
        model.addAttribute("user",userService.findByUser(principal.getName()));
        return "main";
    }

    @GetMapping("/searchBy/{id}")
    public String searchBy(@PathVariable Long id,@RequestParam(value = "profile", defaultValue = "true") boolean profile , @RequestParam("keyword") String keyword, @RequestParam("searching") String sortParam, Model model, Principal principal) {
        List<Cart> tempCarts = userRepository.findById(id).orElse(null).getCarts();
        List<Cart> carts = null;
        if(sortParam.equals("none")){
            carts = cartService.findByTitleContainingIgnoreCaseIn(keyword,tempCarts);
        }
        else if(sortParam.equals("categoryF")){
            carts = cartService.findByCategoryAndTitleContainingIgnoreCaseIn(keyword,"Федеральные документы",tempCarts);
        }
        else if(sortParam.equals("categoryD")){
            carts = cartService.findByCategoryAndTitleContainingIgnoreCaseIn(keyword,"Дополнительно-образовательные документы",tempCarts);
        }
        else if(sortParam.equals("categoryN")){
            carts = cartService.findByCategoryAndTitleContainingIgnoreCaseIn(keyword,"Нормативные документы",tempCarts);
        }
        else if(sortParam.equals("categoryO")){
            carts = cartService.findByCategoryAndTitleContainingIgnoreCaseIn(keyword,"Организационные документы",tempCarts);
        }
        else if(sortParam.equals("userS")){
            carts = tempCarts;
            Collections.sort(carts,Comparator.comparing(cart -> cart.getUser().getId()));
        }
        else if(sortParam.equals("dateS")){
            carts = tempCarts;
            Collections.sort(carts,Comparator.comparing(Cart::getDateOfCreated));
        }
        model.addAttribute("profile", profile);
        model.addAttribute("carts", carts);
        model.addAttribute("user",userService.findByUser(principal.getName()));
        return "main";
    }
    @PostMapping("/editprofile/{id}/edit")
    public String editProfileById(@PathVariable Long id, User user){
        userService.editProfile(id,user);
        return "redirect:/profile/{id}";
    }
    @PostMapping("/editfile/{id}/edit")
    public String editFileById(@PathVariable Long id,@RequestParam("file") MultipartFile file, Cart cart, Principal principal,
                               @RequestParam(value = "editButton", required = false) String editButton,
                               @RequestParam(value = "removeButton", required = false) String removeButton,
                               @RequestParam(value = "archButton", required = false) String archButton) throws IOException {
        Cart thisCart = cartRepository.findById(id).orElseThrow();
        if(editButton!= null){
            thisCart.setTitle(cart.getTitle());
            thisCart.setCategory(cart.getCategory());
            thisCart.setStartDate(cart.getStartDate());
            thisCart.setEndDate(cart.getEndDate());
            cartService.editCart(thisCart,file);
            }
        if(removeButton!=null){
            cartRepository.delete(thisCart);
        }
        if(archButton!=null){
            thisCart.setArchived(true);
            cartRepository.save(thisCart);
        }
        return "redirect:/main";
    }

    @GetMapping("/hello")
    public String securityUrl(){
        return "hello";
    }
}
