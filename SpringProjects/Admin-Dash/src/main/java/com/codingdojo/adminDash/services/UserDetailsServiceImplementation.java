package com.codingdojo.adminDash.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.adminDash.models.Role;
import com.codingdojo.adminDash.models.User;
import com.codingdojo.adminDash.repositories.UserRepository;
@Service
public class UserDetailsServiceImplementation implements UserDetailsService{
	private UserRepository userRepository;
    
    public UserDetailsServiceImplementation(UserRepository userRepository){ // so here were going to initialize the class
        this.userRepository = userRepository;// and set it
    }
    // 1
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);// finds the user by username
        // if user is found, it returns it with the correct authorities. 
        
        
        if(user == null) {  //if the username does not exist, the method throws an error
            throw new UsernameNotFoundException("User not found");
        }
        
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), getAuthorities(user));
    }
    
    // 2
    private List<GrantedAuthority> getAuthorities(User user){ // returns a list of authorities/permissions for a specific user.
    	// for ex, our clients can be 'user', 'admin', or both. For spring security to use authorization, we must get the
    	// name of the possible roles for current user from our database and create a new `SimpleGrantedAuthority` obj 
    	// with those roles.
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Role role : user.getRoles()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getName());
            authorities.add(grantedAuthority);
        }
        return authorities;
    }
}
