package com.codingdojo.adminDash.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.adminDash.models.User;
import com.codingdojo.adminDash.services.UserService;
import com.codingdojo.adminDash.validator.UserValidator;

@Controller
public class Users {
	 private UserService userService;
	    
	// NEW
	    private UserValidator userValidator;
	    
	    // NEW
	    public Users(UserService userService, UserValidator userValidator) {
	        this.userService = userService;
	        this.userValidator = userValidator;
	    }
	
	    
	    // spring security handles our post request automatically, so we dont need to put one into our controller  
	    
	@RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
	
	@PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        
		// NEW
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
        userService.saveWithUserRole(user);
        return "redirect:/login";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {    // if you have an error from logging in
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again."); // flash an error message
        }
        // if we dont do this, well just end up at an empty login page
        
        if(logout != null) { //if you have logged out successfully 
            model.addAttribute("logoutMessage", "Logout Successful!"); // flash a successful message!
        }
        return "login.jsp";
    }
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) { // principal represents the current user logged in
        // 1
    	//Our home method accepts GET requests for "/" and "/home" urls. After a successful authentication, we are able to get 
    	//the name of our principal (current user) via the .getName() method. This process of getting the current user has been
    	// available since Spring 3+.
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username)); // on a successful login, spring security
        // will automatically call the loadUserByUsername(String) in the UserDetailsServiceImplementation class
        return "homePage.jsp";
    }
}
