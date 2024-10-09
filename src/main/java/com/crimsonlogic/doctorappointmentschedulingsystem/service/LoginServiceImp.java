package com.crimsonlogic.doctorappointmentschedulingsystem.service;



import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.doctorappointmentschedulingsystem.exception.UserTypeNotFoundException;


@Service
public class LoginServiceImp implements LoginService {

	@Autowired
	PatientServiceImp patientServiceImp;
	
	@Autowired
	DoctorServiceImp doctorServiceImp;
	
	@Autowired
	AdminServiceImp adminServiceImp;
	
	/**
	 * Secure the password by using encryption
	 */
	
	@Override
	public String securePassword(String password) {
		String encodedPassword=Base64.getEncoder().encodeToString(password.getBytes());	
		return encodedPassword;
	}
	
	/**
	 * Validate the user based on their credentials 
	 */
	
	@Override
	public String validateUserType(String userEmail, String userPassword) {
		try {
			if(patientServiceImp.validateCredentials(userEmail, userPassword)) {
				return "patient";
			}
			else if(doctorServiceImp.ValidateEmailandPassword(userEmail, userPassword)) {
				return "doctor";
			}
			else if(adminServiceImp.validateCredentials(userEmail, userPassword)) {
				return "admin";
			}
			else {
				throw new UserTypeNotFoundException("USER NOT FOUND INVALID EMAIL OR PASSWORD");
			}
		
		}catch(UserTypeNotFoundException e) {
			System.out.println(e);
		}
		return "DATA NOT FOUND";
	}
	 	
}
