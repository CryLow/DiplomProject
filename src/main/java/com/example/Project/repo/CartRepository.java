package com.example.Project.repo;

import com.example.Project.models.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart,Long> {
    List<Cart> findByTitle(String title);
    List<Cart> findByArchivedIsTrue();
    List<Cart> findByArchivedFalseOrArchivedIsNull();
    List<Cart> findByEndDateBeforeAndArchivedFalse(LocalDate endDate);
    List<Cart> findByTitleContainingIgnoreCaseAndArchivedTrue(String keyword);
    List<Cart> findByTitleContainingIgnoreCaseAndArchivedIsNull(String keyword);
    List<Cart> findByCategoryAndTitleContainingIgnoreCaseAndArchivedIsNull(String category, String keyword);
    List<Cart> findByCategoryAndTitleContainingIgnoreCaseAndArchivedTrue(String category, String keyword);
    List<Cart> findByUser(Long id);
    List<Cart> findByCategoryAndTitle(@Param("category") String category, @Param("keyword") String keyword);
}
