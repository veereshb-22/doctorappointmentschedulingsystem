package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, String> {
    
    @Query("SELECT p FROM Patient p WHERE p.patientEmail = :email AND p.patientPassword = :password")
    Optional<Patient> findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
    
    @Query("SELECT p.patientID FROM Patient p WHERE p.patientEmail = ?1")
    String findPatientIdByEmail(String email);
    
    @Query("SELECT p.patientName FROM Patient p WHERE p.patientEmail = ?1")
    String findPatientNameByEmail(String email);
    
    @Query("SELECT p.wallet FROM Patient p WHERE p.patientEmail = ?1")
    int findPatientWalletByEmail(String email);
    
    @Query("SELECT p.patientStatus FROM Patient p WHERE p.patientEmail = ?1")
    String findPatientStatus(String email);

    @Modifying
    @Transactional
    @Query("UPDATE Patient p SET p.wallet = p.wallet + ?1 WHERE p.patientEmail = ?2")
    void updatePatientWallet(int amount, String email);
    
    @Modifying
    @Transactional
    @Query("UPDATE Patient p SET p.wallet = p.wallet - ?1 WHERE p.patientEmail = ?2")
    void deductPatientWallet(int amount, String email);
}
