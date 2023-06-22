package com.example.Project.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class   Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "title", columnDefinition = "text")
    private String title;
    @Column(name = "category", columnDefinition = "text")
    private String category;
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
    @Column(name = "start_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;
    @Column(name = "end_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;
    @Column(name = "archived")
    private Boolean archived;
    @PreUpdate
    public void preUpdate() {
        LocalDate now = LocalDate.now();
        if (endDate != null && endDate.isBefore(now)) {
            archived = true;
        }
    }
    public String getDate(){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        return dateOfCreated.format(formatter);
    }
    public String getFormatDate(LocalDate date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        return date.format(formatter);
    }
    public String getFormatDateForValue(LocalDate date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return date.format(formatter);
    }
    public String getYear(){
        int temp = dateOfCreated.getYear();
        return String.valueOf(temp);
    }
    public String getDay(){
        int temp = dateOfCreated.getDayOfMonth();
        if(temp<10) return String.valueOf("0" + temp);
        else return String.valueOf(temp);
    }
    public String getMouth(){
        int temp = dateOfCreated.getMonthValue();
        if(temp<10) return String.valueOf("0" + temp);
        else return String.valueOf(temp);
    }
    public String getYearPlus(){
        LocalDateTime temp = dateOfCreated.plusYears(5);
        return String.valueOf(temp.getYear());
    }
    public String getDatePlus(){
        LocalDateTime temp = dateOfCreated.plusYears(5);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        return temp.format(formatter);
    }
    public void addDocumentToProduct(Document file) {
        file.setCart(this);
        document = file;
    }
    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", title='" + title + '\'' +
                // добавьте другие нужные поля
                '}';
    }

}
