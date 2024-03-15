package com.exam.moneem.java.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.exam.moneem.java.models.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course,Long>{

	// find all courses
	List<Course> findAll();
}
