package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Transaction;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.TransactionService;

/*
 * Transaction  dispalying based on credentials 
 */

@Controller
@RequestMapping("/transaction")
public class TransactionController {
	 @Autowired
	  private TransactionService transactionService; //autowiring the transaction service
	 
	 private static final Logger LOG= LoggerFactory.getLogger(TransactionController.class);

	 /*
	  * Displaying all the transactions for the admin
	  */
	 @GetMapping("/alltransaction")
	    public String listalltransactions(Model model) {
		 	
		 	//fetch all the resources
	        List<Transaction> transaction = transactionService.getAllTransaction();
	      
	        model.addAttribute("transactions", transaction);
	        LOG.debug("dispalying all transaction");
	        return "displayalltransaction";
	    }
	 
	 /*
	  * Dispalying the transaction based on the users
	  */
	 
	 @GetMapping("/transactionpatient")
	 public String listpatienttransaction(Model model,HttpSession session) { 
		 
		 //fetching the patient by using session attributes
		 String patientID=(String)session.getAttribute("patientIDSession");
		 
		 //transaction based on patient
		 List<Transaction> transactionbypatient=transactionService.getAllPatientTransaction(patientID);
		model.addAttribute("transactionbypatients",transactionbypatient);
		 return "displaytransactionbypatient";
	 }
}
