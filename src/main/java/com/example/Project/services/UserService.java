package com.example.Project.services;

import com.example.Project.models.User;
import com.example.Project.models.enums.Role;
import com.example.Project.repo.UserRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Slf4j
@Data
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    public boolean createUser(User user){
        String email = user.getEmail();
        if(userRepository.findByEmail(user.getEmail())!=null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true ;
    }
    public User findByUser(String name){
        return userRepository.findByEmail(name);
    }
       public List<User> list(){
        return userRepository.findAll();
    }

    public void access(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void editProfile(Long id, User user) {
        User thisUser  = userRepository.findById(id).orElse(null);
        thisUser.setSecondname(user.getSecondname());
        thisUser.setFirstname(user.getFirstname());
        thisUser.setMiddlename(user.getMiddlename());
        thisUser.setEmail(user.getEmail());
        thisUser.setPost(user.getPost());
        thisUser.setExperience(user.getExperience());
        userRepository.save(thisUser);
    }
}
