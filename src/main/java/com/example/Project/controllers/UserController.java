package com.example.Project.controllers;

import com.example.Project.models.Cart;
import com.example.Project.services.CartService;
import com.example.Project.services.UserService;
import com.example.Project.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final CartService cartService;
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/main")
    public String main(@RequestParam(name = "title",required = false) String title,Principal principal, Model model){
        model.addAttribute("user",userService.findByUser(principal.getName()));
        model.addAttribute("carts",cartService.listCarts(title));
        return "main";
    }
    @GetMapping("/")
    public String home() {return "/main";}
    @GetMapping("/logout")
    public String logout(){return "login";}
    @GetMapping("/registration")
    public String registration(){
    return "registration";
    }
    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }
    @PostMapping("/cart/create")
    public String createCart(@RequestParam("file") MultipartFile file, Cart cart, Principal principal) throws IOException {
        cartService.saveCart(cart,file,cartService.getUserByPrincipal(principal));
        return "main";
    }

    @GetMapping("/hello")
    public String securityUrl(){
        return "hello";
    }
}
