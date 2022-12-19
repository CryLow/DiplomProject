package com.example.Project.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
@Entity
@Table(name = "cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "title", columnDefinition = "text")
    private String title;
    private LocalDateTime dateOfCreated;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER, mappedBy = "cart")
    @JoinColumn(name = "document_id")
    private Document document;
    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    public void addDocumentToProduct(Document file) {
        file.setCart(this);
        document = file;
    }
}
