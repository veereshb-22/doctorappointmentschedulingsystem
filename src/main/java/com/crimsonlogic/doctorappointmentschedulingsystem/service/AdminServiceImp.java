package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.doctorappointmentschedulingsystem.repository.AdminRepository;

/**
 * Admin Service Logic
 */

@Service
public class AdminServiceImp implements AdminService {

	@Autowired
	AdminRepository adminRepository;  //autowired admin Repository
	
	// validate the admin
	
	@Override
	public boolean validateCredentials(String email, String password) {
		
		// checking admin credential
		return adminRepository.findByEmailAndPassword(email, password).isPresent();
	}

}
