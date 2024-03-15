package com.exam.moneem.java.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.moneem.java.models.Course;
import com.exam.moneem.java.repositories.CourseRepository;

@Service
public class CourseService {

	// inject CourseRepository
	@Autowired
	private CourseRepository courseRepo;
	
	// create course
	public Course add(Course course) {
		return courseRepo.save(course);
	}
	
	// update course
		public Course update(Course course) {
			return courseRepo.save(course);
		}
	
	// get one course
		public Course getOne(Long id) {
			Optional<Course> course=courseRepo.findById(id);
			if(course.isPresent()) {
				return course.get();
			}return null;
		}
		
		// get all courses
		public List<Course> all() {
			return courseRepo.findAll();
		}
		
		// delete student
		public void deleteCourse(Long id) {
			courseRepo.deleteById(id);
		}
	
	
}
