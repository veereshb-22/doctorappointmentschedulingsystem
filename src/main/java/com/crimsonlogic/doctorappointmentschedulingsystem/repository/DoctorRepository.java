package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;


@Repository
public interface DoctorRepository extends JpaRepository<Doctor,String> {
	
	 List<Doctor> findByDoctorStatus(String status);
	 List<Doctor> findByDoctorSpeciality(String speciality);
	 
	 @Modifying
	 @Transactional
	 @Query("UPDATE Doctor d SET d.doctorStatus = 'Inactive' WHERE d.doctorID = ?1")
	 void setDoctorStatusToInactive(String doctorID);
	 
	 @Modifying
	 @Transactional
	 @Query("UPDATE Doctor d SET d.doctorStatus = 'Active' WHERE d.doctorID = ?1")
	 void setDoctorStatusToActive(String doctorID);
	 
	 @Query("SELECT d FROM Doctor d WHERE d.doctorStatus = 'Active'")
	 List<Doctor> findActiveDoctors();
	 
	 @Query("SELECT d FROM Doctor d WHERE d.doctorEmail = :email AND d.doctorPassword = :password")
	 Optional<Doctor> findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
	 
	 // Find doctors by status and description
	 @Query("SELECT d FROM Doctor d WHERE d.doctorStatus = :status AND LOWER(d.doctorDescription) LIKE LOWER(CONCAT('%', :description, '%'))")
	 List<Doctor> findActiveDoctorsByDescription(@Param("status") String status, @Param("description") String description);
	 
	 @Query("SELECT d.doctorID FROM Doctor d WHERE  d.doctorEmail = :email")
	 String finddoctorID(@Param("email")String email);
	 
	 
	 @Query("SELECT d FROM Doctor d WHERE d.doctorEmail = :email")
	 Doctor findByDoctorIDDoctor(@Param("email")String email);
	 
	
}
