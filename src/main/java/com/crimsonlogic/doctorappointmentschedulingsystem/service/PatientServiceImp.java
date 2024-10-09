package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Patient;
import com.crimsonlogic.doctorappointmentschedulingsystem.repository.PatientRepository;

@Service
public class PatientServiceImp implements PatientService {

    @Autowired
    private PatientRepository patientRepository; //autowiring patient repository
    
    @Autowired
    private LoginServiceImp loginServiceImp;
   
    /**
     * fetch all patient details
     */
    
    @Override
    public List<Patient> getAllPatients() {    
        return patientRepository.findAll();
        
    }
    
    /**
     * save the patient details in the database
     */
    
    @Override
    public Patient savePatient(Patient patient) {
    	String password=patient.getPatientPassword();
    	String secure=loginServiceImp.securePassword(password);
    	patient.setPatientPassword(secure);
       return patientRepository.save(patient);
    	
    }   

    /**
     * validate patient based on their credentials
     */
    
    @Override
    public boolean validateCredentials(String email, String password) {
        return patientRepository.findByEmailAndPassword(email, password).isPresent();   
    }

    /**
     * update the patient wallet based in patient email
     */
    
    @Override
    public void updatePatientWallet(int amount, String email) {
    	patientRepository.updatePatientWallet(amount,email);
    }
    
    /**
     * fetch the patient wallet based on patient email
     */
	
    @Override
	public int getPatientWallet(String email) {
		// TODO Auto-generated method stub
		return patientRepository.findPatientWalletByEmail(email);
	}
    
    /**
     * fetch patient name based on email
     */
	
    @Override
	public String getPatientName(String emial) {
		// TODO Auto-generated method stub
		return patientRepository.findPatientNameByEmail(emial);
	}

    /**
     * fetch patient Id based on email 
     */
    
	@Override
	public String getPatientById(String email) {
		// TODO Auto-generated method stub
		return patientRepository.findPatientIdByEmail(email);
	}
	
	/**
	 * fetch patient status based on email
	 */
	
	@Override
	public String getPatientStatus(String email) {
		return patientRepository.findPatientStatus(email);
	}
	
	/**
	 * fetch patient id
	 */
	
	@Override
	public Patient findPatientById(String patientID) {
		// TODO Auto-generated method stub
		return patientRepository.findById(patientID).orElse(null);
	}
	
	/**
	 * deduct the amount form
	 */
	
	@Override
	public void deductFromWallet(int amount, String email) {
		patientRepository.deductPatientWallet(amount, email);
		
	}
	
}
