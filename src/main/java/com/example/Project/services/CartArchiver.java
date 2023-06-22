package com.example.Project.services;

import com.example.Project.repo.CartRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

import com.example.Project.models.Cart;
@Component
public class CartArchiver {
    private final CartRepository cartRepository;

    public CartArchiver(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    @Scheduled(cron = "0 0 0 * * *") // Запускать каждый день в 00:00
    public void archiveExpiredCards() {
        LocalDate currentDate = LocalDate.now();
        List<Cart> cards = cartRepository.findAll();

        for (Cart cart : cards) {
            if (cart.getEndDate() != null && cart.getEndDate().isBefore(currentDate)) {
                cart.setArchived(true);
                cartRepository.save(cart);
            }
        }
    }
}
