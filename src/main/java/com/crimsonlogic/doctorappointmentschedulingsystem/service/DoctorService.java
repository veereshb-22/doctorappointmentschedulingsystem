package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;

public interface DoctorService {

		 List<Doctor> getAllDoctor();
		
		 void saveDoctor(Doctor doctor);
		 
		 List<Doctor> getActiveDoctors();
		 
		 List<Doctor> searchDoctorsBySpeciality(String speciality);
		 
		 void setDoctorStatusToInactive(String doctorID);
		 
		 void setDoctorStatusToActive(String doctorID);
		 
		 public List<Doctor> searchActiveDoctorsByDescription(String description);
		 
		 boolean ValidateEmailandPassword(String doctorEmail,String doctorPassword);
		 
		 String getDoctorIDbyEmail(String emial);
		 
		 Doctor findDoctorDetailsByEmail(String emial);
		 
		 public Doctor findDoctorDetailsById(String doctorID);
	
}
