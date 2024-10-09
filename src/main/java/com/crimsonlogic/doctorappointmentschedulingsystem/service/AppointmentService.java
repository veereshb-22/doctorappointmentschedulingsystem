package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.sql.Date;
import java.util.List;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;

public interface AppointmentService {
	
		public List<Appointment> getAllAppointment();
		
		public void saveAppointment(Appointment appointment);
		
		public List<Appointment> getAppointmentByPatientID(String patientId);
		
		Appointment getAppointmentById(String appointmentID);
		
		void updateAppointmentStatus(String appointmentID, String status);
		
		public List<Appointment> getAppointmentByDoctorEmail(String emial);
		
		List<Appointment> findByAppointmentDateAndDoctorID(Date appointmentDate, String doctorID);
		
		Appointment savepatientAppointment(String date,String time,String doctorID,String patientID);
}
