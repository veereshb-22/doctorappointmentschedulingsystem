package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Patient;
import com.crimsonlogic.doctorappointmentschedulingsystem.repository.AppointmentRepository;

/**
 * Appointment Service Logic
 */
@Service
public class AppointmentServiceImp implements AppointmentService {
	
	 @Autowired
	 private AppointmentRepository appointmentRepository;
	 
	 @Autowired
	 private DoctorServiceImp doctorServiceImp;
	 
	 @Autowired
	 private PatientServiceImp patientServiceImp;

	 /**
	  *  fetching all the appointments 
	  */
	 
	 public List<Appointment> getAllAppointment(){	
		return appointmentRepository.findAll();
	 }

	 /** 
	  * fetching all appointment based on patientID
	  */
	 
	@Override
	public List<Appointment> getAppointmentByPatientID(String patientId) {
		 return appointmentRepository.findAppointmentsByPatientId(patientId);
	}
	
	/**
	 *  Saving the data in the database
	 */
	
	@Override
	public void saveAppointment(Appointment appointment) {
		 appointmentRepository.save(appointment);
		
	}
	
	/**
	 * fetching appointment details by appointment id
	 */
	
	@Override
	public Appointment getAppointmentById(String appointmentID) {
		// TODO Auto-generated method stub
		return appointmentRepository.findById(appointmentID).orElse(null);
	}
	
	/**
	 *  updating the status of appointment
	 */
	
	@Override
	public void updateAppointmentStatus(String appointmentID, String status) {
		 Appointment appointment = getAppointmentById(appointmentID);
		 if(appointment!=null) {
			 appointment.setAppointmentStatus(status);
			 saveAppointment(appointment);
		 }
		
	}
	
	/**
	 * fetch appointment for based on doctor email
	 */
	
	@Override
	public List<Appointment> getAppointmentByDoctorEmail(String emial) {
		// TODO Auto-generated method stub
		return appointmentRepository.findAppointmentsByDoctorEmial(emial);
	}
	
	/**
	 * finding appointment data by appointment date and doctorId
	 * Fetches the data present in the database
	 */
	
	@Override
	public List<Appointment> findByAppointmentDateAndDoctorID(Date appointmentDate, String doctorID) {
		 return appointmentRepository.findOKAppointmentDateAndDoctorID(appointmentDate, doctorID);	
		 }

	/**
	 *  Saving the appointment details in the database
	 */
	
	@Override
	public Appointment savepatientAppointment(String date, String time, String doctorID, String patientID) {
		 Appointment appointment=new Appointment();
		 
		 // Coverting string to local date form 		
		 DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	     DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	     LocalDate localDate = LocalDate.parse(date, dateFormatter);
	     LocalTime localTime = LocalTime.parse(time, timeFormatter);
	     
	     // Convert local date, local time to date ,time format
	     Date appointmentDate = Date.valueOf(localDate);
	     Time appointmentTime = Time.valueOf(localTime);
	     Doctor doctor = doctorServiceImp.findDoctorDetailsById(doctorID);
	     Patient patient=patientServiceImp.findPatientById(patientID);
	     appointment.setDoctorID(doctor);
	     appointment.setPatientID(patient);
	     appointment.setAppointmentTime(appointmentTime);
	     appointment.setAppointmentDate(appointmentDate);
	     appointment.setAppointmentFees(500);
	     appointment.setAppointmentStatus("Booked");
	     appointmentRepository.save(appointment);
	     return appointment;
	}
}
