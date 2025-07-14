package com.mario.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mario.main.entity.admin;

public interface adminRepository extends JpaRepository<admin, Long> {
    
}