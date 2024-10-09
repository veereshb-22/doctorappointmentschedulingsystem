package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.util.List;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Transaction;

public interface TransactionService {
	
	public List<Transaction> getAllTransaction();
	
	public List<Transaction> getAllPatientTransaction(String patientID);
	
	public void transactionSaveBypatient(Appointment appointment);
}
