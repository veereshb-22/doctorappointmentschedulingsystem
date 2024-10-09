package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Patient;
import com.crimsonlogic.doctorappointmentschedulingsystem.exception.UserTypeNotFoundException;

public interface PatientService {
	
		List<Patient> getAllPatients();
	    
		String getPatientById(String email);
	    
		boolean validateCredentials(String email, String password);
	    
		Patient savePatient(Patient patient) throws UserTypeNotFoundException;
	    
		int getPatientWallet(String email);
	    
		String getPatientName(String emial);
	    
		void updatePatientWallet(int amount, String email); // Updated method signature
	    
		String getPatientStatus(String email);
	    
		public Patient findPatientById(String patientID);
	    
		public void deductFromWallet(int amount,String email);
}
