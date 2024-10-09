package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment,String>{
	
	@Query("SELECT a FROM Appointment a WHERE a.patientID.patientID= ?1")
    List<Appointment> findAppointmentsByPatientId(String patientID);
	
	@Query("SELECT a FROM Appointment a WHERE a.doctorID.doctorEmail = :email")
	List<Appointment> findAppointmentsByDoctorEmial(@Param("email")String email);
	
	@Query("SELECT a FROM Appointment a WHERE a.doctorID.doctorID = :doctorID AND a.appointmentDate = :appointmentDate")
	List<Appointment> findOKAppointmentDateAndDoctorID(@Param("appointmentDate")Date appointmentDate,@Param("doctorID") String doctorID);
}
	
