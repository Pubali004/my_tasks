package com.mario.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mario.main.entity.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
    
}
