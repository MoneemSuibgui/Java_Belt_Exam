package com.exam.moneem.java.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.exam.moneem.java.models.LoginUser;
import com.exam.moneem.java.models.User;
import com.exam.moneem.java.repositories.UserRepository;

@Service
public class UserService {
	
	// inject UserRepository into our service
	@Autowired
	private UserRepository userRepo;
	
	
	// create user
	public User saveUser(User user) {
		return userRepo.save(user);
	}
	
	
	
	// Putting our business logic here(validations for register)
	public void registerUser(User user,BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(user.getEmail());
		// check if the password and confirm password dosen't match
		if(!user.getPassword().equals(user.getConfirmPass())){
			// adding validation errors to the result
			result.rejectValue("password", "matches","Password & Confirm PW doesn't match !!!!");
		}if(potentialUser.isPresent()){
			result.rejectValue("email", "exist", "Email alraedy token ");
		}
		else{
			// hashing password and saved user to the database
			user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
		}
	}
	
	// login method return User object
	public User login(LoginUser LoggedUser,BindingResult result) {	
		Optional<User> potentialUser = userRepo.findByEmail(LoggedUser.getEmail());
		// check the email of logged user by findByEmail() if is exist in db & check if the password match or not of the LoggedUser
		if(!(potentialUser.isPresent() && BCrypt.checkpw(LoggedUser.getPassword(),potentialUser.get().getPassword()))) {
			result.rejectValue("email", "IVcredentials", "Invalid Credentials !");
			return null;
		} return potentialUser.get();
	}
	
	
	// find user by id
	public User findUserById(Long id) {
		Optional<User> user=userRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		}return null;
	}
}
