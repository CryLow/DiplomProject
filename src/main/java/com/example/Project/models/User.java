package com.example.Project.models;

import com.example.Project.models.enums.Role;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
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
    @Column(name = "active")
    private boolean active;
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
