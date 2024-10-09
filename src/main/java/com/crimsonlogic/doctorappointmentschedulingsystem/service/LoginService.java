package com.crimsonlogic.doctorappointmentschedulingsystem.service;

public interface LoginService {
	
	String validateUserType(String userName, String userPassword);
	
	String securePassword(String Password);
	 
}
