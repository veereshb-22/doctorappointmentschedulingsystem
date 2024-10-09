package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Transaction;
import com.crimsonlogic.doctorappointmentschedulingsystem.repository.TransactionRepository;

/**
 * Transaction service logic 
 */

@Service
public class TransactionServiceImp implements TransactionService  {
	@Autowired
	private TransactionRepository transactionRepository ;
	
	/**
	 * fetch the all transction
	 */
	
	 public List<Transaction> getAllTransaction(){	
		 return transactionRepository.findAll();
	 }
	 
	 /**
	  * fetch all the patient transaction
	  */
	 
	@Override
	public List<Transaction> getAllPatientTransaction(String patientID) {
		return transactionRepository.findTransactionByPatient(patientID);	
	}


	@Override
	public void transactionSaveBypatient(Appointment appointment) {
		Transaction  transaction=new Transaction();
		transaction.setTransactionStatus("Complete");
		transaction.setTransactionCost(500);
		transaction.setAppointmentID(appointment);
		transactionRepository.save(transaction);
	}
	
}
