package com.codingdojo.adminDash.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.adminDash.models.Role;

@Repository
public interface RoleRepository extends CrudRepository <Role, Long>{

}
