package com.crimsonlogic.doctorappointmentschedulingsystem.entity;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Login Class
 * 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Login {
	 
	 // user name
	 private String userEmail;
	 
	 //user passowrd
	 private  String userPassword;
 
}
