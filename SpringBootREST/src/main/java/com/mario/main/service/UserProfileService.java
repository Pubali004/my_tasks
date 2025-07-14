package com.mario.main.service;

import com.mario.main.entity.UserProfile;
import com.mario.main.repository.UserProfileRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserProfileService {

    private final UserProfileRepository userProfileRepository;

    public UserProfileService(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    public List<UserProfile> getAllUsers() {
        return userProfileRepository.findAll();
    }

    public Optional<UserProfile> getUserById(Long id) {
        return userProfileRepository.findById(id);
    }

    public UserProfile createUser(UserProfile userProfile) {
        return userProfileRepository.save(userProfile);
    }

    public UserProfile updateUser(Long id, UserProfile updatedUserProfile) {
        Optional<UserProfile> userOptional = userProfileRepository.findById(id);
        if (userOptional.isPresent()) {
            UserProfile user = userOptional.get();
            user.setName(updatedUserProfile.getName());
            user.setEmail(updatedUserProfile.getEmail());
            user.setPhone(updatedUserProfile.getPhone());
            return userProfileRepository.save(user);
        }
        return null;
    }

    public boolean deleteUser(Long id) {
        if (userProfileRepository.existsById(id)) {
            userProfileRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
