package com.example.Project.services;

import com.example.Project.models.User;
import com.example.Project.repo.UserRepository;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class UserLoginEventListener {
    private final UserRepository userRepository;

    public UserLoginEventListener(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @EventListener
    public void onUserLogin(AuthenticationSuccessEvent event) {
        // Получаем аутентифицированного пользователя
        User authenticatedUser = (User) event.getAuthentication().getPrincipal();

        // Обновляем поле lastLogin
        authenticatedUser.setLastLogin(LocalDateTime.now());

        // Сохраняем изменения в базе данных
        userRepository.save(authenticatedUser);
    }
}