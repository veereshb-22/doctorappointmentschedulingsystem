package com.crimsonlogic.doctorappointmentschedulingsystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity class of Admin
 * class is mapped to  admin_info in database
 */
@Entity
@Table(name = "admin_info")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Admin {
	
	/**
	 * Email of the admin
	 * field is mapped to admin_email column 
	 */
	
	@Id
	@Column(name="admin_email")
	private String adminEmail;
	
	/**
	 * Password of the admin 
	 * field is mapped to admin_password column
	 */
	
	@Column(name="admin_password")
	private String adminPassword;
	
	/**
	 * Name of the admin 
	 * field is mapped to admin_name
	 */
	
	@Column(name="admin_name")
	private String adminName;
	
	/**
	 * Status of admin
	 * field is mapped to admin_status 
	 */
	@Column(name="admin_status")
	private String adminStatus;
}