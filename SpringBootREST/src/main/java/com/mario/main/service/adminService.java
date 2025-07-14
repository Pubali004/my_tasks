package com.mario.main.service;

import com.mario.main.entity.admin;
import com.mario.main.repository.adminRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class adminService {

    private final adminRepository adminRepository;

    public adminService(adminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public List<admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    public Optional<admin> getAdminById(Long id) {
        return adminRepository.findById(id);
    }

    public admin createAdmin(admin admin) {
        return adminRepository.save(admin);
    }

    public admin updateAdmin(Long id, admin updatedAdmin) {
        Optional<admin> adminOptional = adminRepository.findById(id);
        if (adminOptional.isPresent()) {
            admin admin = adminOptional.get();
            admin.setName(updatedAdmin.getName());
            admin.setEmail(updatedAdmin.getEmail());
            admin.setPhone(updatedAdmin.getPhone());
            return adminRepository.save(admin);
        }
        return null;
    }

    public boolean deleteAdmin(Long id) {
        if (adminRepository.existsById(id)) {
            adminRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
