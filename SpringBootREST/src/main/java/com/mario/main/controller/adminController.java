package com.mario.main.controller;

import com.mario.main.entity.admin;
import com.mario.main.service.adminService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/admins")
@CrossOrigin(origins = "*") 
public class adminController {

    private final adminService adminService;

    public adminController(adminService adminService) {
        this.adminService = adminService;
    }

    
    @GetMapping
    public List<admin> getAllAdmins() {
        return adminService.getAllAdmins();
    }

    // GET admin by ID
    @GetMapping("/{id}")
    public ResponseEntity<admin> getAdminById(@PathVariable Long id) {
        Optional<admin> admin = adminService.getAdminById(id);
        return admin.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // POST create new admin
    @PostMapping
    public ResponseEntity<admin> createAdmin(@RequestBody admin admin) {
        admin savedAdmin = adminService.createAdmin(admin);
        return ResponseEntity.ok(savedAdmin);
    }

    // PUT update existing admin
    @PutMapping("/{id}")
    public ResponseEntity<admin> updateAdmin(@PathVariable Long id, @RequestBody admin updatedAdmin) {
        admin admin = adminService.updateAdmin(id, updatedAdmin);
        if (admin != null) {
            return ResponseEntity.ok(admin);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // DELETE admin by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAdmin(@PathVariable Long id) {
        boolean deleted = adminService.deleteAdmin(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
