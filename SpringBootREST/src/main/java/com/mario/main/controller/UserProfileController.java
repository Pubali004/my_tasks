package com.mario.main.controller;

import com.mario.main.entity.UserProfile;
import com.mario.main.service.UserProfileService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/users")
@CrossOrigin("*")  // Allows cross-origin requests for frontend testing
public class UserProfileController {

    private final UserProfileService userProfileService;

    public UserProfileController(UserProfileService userProfileService) {
        this.userProfileService = userProfileService;
    }

    // Get all users
    @GetMapping
    public List<UserProfile> getAllUsers() {
        return userProfileService.getAllUsers();
    }

    // Get user by ID
    @GetMapping("/{id}")
    public ResponseEntity<UserProfile> getUserById(@PathVariable Long id) {
        Optional<UserProfile> user = userProfileService.getUserById(id);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Create a new user
    @PostMapping
    public ResponseEntity<UserProfile> createUser(@RequestBody UserProfile userProfile) {
        return ResponseEntity.ok(userProfileService.createUser(userProfile));
    }

    // Update an existing user
    @PutMapping("/{id}")
    public ResponseEntity<UserProfile> updateUser(@PathVariable Long id, @RequestBody UserProfile userProfile) {
        UserProfile updatedUser = userProfileService.updateUser(id, userProfile);
        return updatedUser != null ? ResponseEntity.ok(updatedUser) : ResponseEntity.notFound().build();
    }

    // Delete a user
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        return userProfileService.deleteUser(id) ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }
}
