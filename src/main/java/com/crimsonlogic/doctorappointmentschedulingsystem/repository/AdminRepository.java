package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>{
	
	@Query("SELECT p FROM Admin p WHERE p.adminEmail = :email AND p.adminPassword = :password")
    Optional<Admin> findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
