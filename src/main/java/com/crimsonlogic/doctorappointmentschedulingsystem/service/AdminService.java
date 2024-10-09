package com.crimsonlogic.doctorappointmentschedulingsystem.service;

public interface AdminService {
	
	// validate the users based on credentials
	boolean validateCredentials(String email, String password);
}
