package com.mario.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mario.main.entity.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {
}
