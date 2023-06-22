package com.example.Project.services;

import com.example.Project.models.Cart;
import com.example.Project.repo.CartRepository;
import com.example.Project.repo.DocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Component
public class DocumentArchiver {

    @Autowired
    private DocumentRepository documentRepository;
    @Autowired
    private CartRepository cartRepository;

    @Scheduled(cron = "0 0 0 * * *") // Запускать каждый день в полночь
    public void archiveDocuments() {
        LocalDate now = LocalDate.now();
        List<Cart> outdatedCart = cartRepository.findByEndDateBeforeAndArchivedFalse(now);
        for (Cart cart : outdatedCart) {
            cart.setArchived(true);
            cartRepository.save(cart);
        }
    }
}
