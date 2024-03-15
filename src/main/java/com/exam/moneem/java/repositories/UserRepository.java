package com.exam.moneem.java.repositories;




import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.exam.moneem.java.models.User;

@Repository
public interface UserRepository extends JpaRepository<User,Long>{
	// we just need find user by email to check the user email when user login 
	Optional<User> findByEmail(String email);
}
