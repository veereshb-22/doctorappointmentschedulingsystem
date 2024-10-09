package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;
import com.crimsonlogic.doctorappointmentschedulingsystem.exception.UserTypeNotFoundException;
import com.crimsonlogic.doctorappointmentschedulingsystem.repository.DoctorRepository;

/**
 * Doctor Service Logic 
 */

@Service
public class DoctorServiceImp implements  DoctorService {
	
	@Autowired
    private DoctorRepository doctorRepository; // autowired doctor repository
	
	@Autowired
	private LoginServiceImp loginServiceImp;
	
	/**
	 *fetch doctor details 
	 */
    
	@Override
    public List<Doctor> getAllDoctor() {
        return doctorRepository.findAll();
    }
	
	/**
	 *  saving doctor in the database
	 */
    
	@Override
    public void saveDoctor(Doctor doctor) {
		String password=doctor.getDoctorPassword();
		String secure=loginServiceImp.securePassword(password);
		doctor.setDoctorPassword(secure);
		doctor.setDoctorStatus("Active");
		doctorRepository.save(doctor);
    }
	
	/**
	 *fetch all active doctors 
	 */
	
    @Override
    public List<Doctor> getActiveDoctors() {
        return doctorRepository.findByDoctorStatus("active");
    }
    
    /**
     *  search the doctor based on their speciality
     */
    
    @Override
    public List<Doctor> searchDoctorsBySpeciality(String speciality) {
        return doctorRepository.findByDoctorSpeciality(speciality);
    }
    
    /**
     * set the doctor status Inactive  
     */
	
    @Override
	public void setDoctorStatusToInactive(String doctorID) {
		 doctorRepository.setDoctorStatusToInactive(doctorID);		
	}
    
    /**
     * set the doctor status Active
     */
	
    @Override
	public void setDoctorStatusToActive(String doctorID) {
        
		doctorRepository.setDoctorStatusToActive(doctorID);	
        
	}
    
    /**
     * search the active doctor based on their description 
     */
	
    @Override
	public List<Doctor> searchActiveDoctorsByDescription(String description) {
		List <Doctor> doctor=doctorRepository.findActiveDoctorsByDescription("Active", description);
		try {
		if(doctor.isEmpty()) {
			throw new UserTypeNotFoundException("NO DOCTOR IS ACTIVE");
		}
		}catch(UserTypeNotFoundException e) {
			System.out.print(e);
		}
	    return doctor;
	}
    
    /**
     * Validate the doctor pased on their email and password
     */
    
	@Override
	public boolean ValidateEmailandPassword(String doctorEmail, String doctorPassword) {
	
		boolean status=doctorRepository.findByEmailAndPassword(doctorEmail, doctorPassword).isPresent();
		try {
			if(status==false) {
				throw new UserTypeNotFoundException("user credential not exists");
			}
		}catch(UserTypeNotFoundException e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 *fetch the doctorID  based on their email 
	 */
	
	@Override
	public String getDoctorIDbyEmail(String emial) {
		// TODO Auto-generated method stub
		return doctorRepository.finddoctorID(emial);  
	}
	
	/**
	 * fetch doctor details by email
	 */
	
	@Override
	public Doctor findDoctorDetailsByEmail(String emial) {
		// TODO Auto-generated method stub
		return doctorRepository.findByDoctorIDDoctor(emial);
	}
	
	/**
	 * fetch the doctor details based on doctorId
	 */
	
	@Override
	public Doctor findDoctorDetailsById(String doctorID) {
		// TODO Auto-generated method stub
		return doctorRepository.findById(doctorID).orElse(null);
	}

}