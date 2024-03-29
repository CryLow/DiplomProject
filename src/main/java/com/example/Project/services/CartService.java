package com.example.Project.services;
import com.example.Project.models.Cart;
import com.example.Project.models.Document;
import com.example.Project.models.User;
import com.example.Project.repo.CartRepository;
import com.example.Project.repo.DocumentRepository;
import com.example.Project.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CartService {
    private final DocumentRepository documentRepository;
    private final CartRepository cartRepository;
    private final UserRepository userRepository;

    public List<Cart> listCarts(String title){
    if(title!=null) return cartRepository.findByTitle(title);
    return cartRepository.findAll();
    }
    public void saveCart(Cart cart, MultipartFile file, User user) throws IOException {
        Document document;
        if(file.getSize()!=0){
            document = toDocumentEntity(file);
            cart.addDocumentToProduct(document);
            cart.setUser(user);
        }
        log.info("Saving new cart. Title: {}; User: {}",cart.getTitle(),cart.getUser());
        cartRepository.save(cart);
    }
    public void editCart(Cart cart, MultipartFile file) throws IOException {
        Document document = cart.getDocument();
        if(file.getSize()!=0){
            document.setSize(file.getSize());
            document.setBytes(file.getBytes());
            document.setOriginalFileName(file.getOriginalFilename());
            document.setContentType(file.getContentType());
            documentRepository.save(document);
        }
        log.info("Update cart. Title: {}; User: {}; Document: {}",cart.getTitle(),cart.getUser().getUsername(),cart.getDocument().getOriginalFileName());
        cartRepository.save(cart);
    }
    public List<Cart> findByTitleContainingIgnoreCaseIn(String keyword, List<Cart> carts){
        List<Cart> result = new ArrayList<>();
        for(Cart cart : carts){
            if(cart.getTitle().toLowerCase().contains(keyword.toLowerCase())){
                result.add(cart);
            }
        }
        return result;
    }
    public List<Cart> findByCategoryAndTitleContainingIgnoreCaseIn(String keyword, String category , List<Cart> carts){
        List<Cart> result = new ArrayList<>();
        for(Cart cart : carts){
            if(cart.getTitle().toLowerCase().contains(keyword.toLowerCase()) && cart.getCategory().equals(category)){
                result.add(cart);
            }
        }
        return result;
    }
    public User getUserByPrincipal(Principal principal){
        if(principal==null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    private Document toDocumentEntity(MultipartFile file)  throws IOException {
        Document document = new Document();
        document.setSize(file.getSize());
        document.setBytes(file.getBytes());
        document.setOriginalFileName(file.getOriginalFilename());
        document.setContentType(file.getContentType());
        return document;
    }

    public void deleteCart(Long id){
        cartRepository.deleteById(id);
     }

    public Cart getCartById(Long id) {
        return cartRepository.findById(id).orElse(null);
    }

}
