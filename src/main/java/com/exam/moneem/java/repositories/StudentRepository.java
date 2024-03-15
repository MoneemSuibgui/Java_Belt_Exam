package com.exam.moneem.java.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.exam.moneem.java.models.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student,Long> {

	List<Student> findAll();
}
