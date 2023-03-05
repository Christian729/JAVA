package com.codingdojo.adminDash.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.adminDash.models.User;

@Repository
public interface UserRepository extends CrudRepository <User, Long>{
	User findByUsername(String username);
}
