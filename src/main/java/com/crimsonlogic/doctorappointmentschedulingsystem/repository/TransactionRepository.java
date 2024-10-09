package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Transaction;

@Repository
public interface TransactionRepository  extends JpaRepository<Transaction,String>{

	@Query("SELECT t from Transaction t  where t.appointmentID.patientID.patientID= ?1")
	public List<Transaction> findTransactionByPatient(String patientID);
	
}
