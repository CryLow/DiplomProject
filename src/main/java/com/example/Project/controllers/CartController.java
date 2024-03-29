package com.example.Project.controllers;

import com.example.Project.models.Cart;
import com.example.Project.services.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;
    @GetMapping("/cart")
    public String carts(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("carts",cartService.listCarts(title));
        return "cart";
    }

    @PostMapping("/cart/delete/{id}")
    public String deleteCart(@PathVariable Long id){
        cartService.deleteCart(id);
        return "redirect:/cart";
    }
}
