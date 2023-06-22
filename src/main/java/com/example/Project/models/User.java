package com.example.Project.models;

import com.example.Project.models.enums.Role;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Entity
@Table(name = "users")
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;
    @Column(name = "email")
    private String email;
    @Column(name = "name")
    private String firstname;
    @Column(name = "second_name")
    private String secondname;
    @Column(name = "middle_name")
    private String middlename;
    @Column(name = "post")
    private String post = "Сотрудник";
    @Column(name = "experience")
    private Integer experience = 0;

    @Column(name = "active")
    private boolean active;
    @Column(name = "last_login")
    private LocalDateTime lastLogin;
    @Column(name = "password", length = 1000)
    private String password;
@ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
@CollectionTable(name = "user_role",
joinColumns = @JoinColumn(name = "user_id"))
@Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();
@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
private List<Cart> carts = new ArrayList<>();

    public boolean isAdmin(){ return roles.contains(Role.ROLE_ADMIN);}
    public boolean isEmployee() {return roles.contains(Role.ROLE_EMPLOYEE);}
    public boolean isGuest() {return roles.contains(Role.ROLE_USER);}

    public String getDateFormat(LocalDateTime dateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy", new Locale("ru","RU"));
        return dateTime.format(formatter);
    }
    public String getTimeFormat(LocalDateTime dateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm a");
        return dateTime.format(formatter);
    }
//security
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
