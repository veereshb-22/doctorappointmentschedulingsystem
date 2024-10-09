package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.DateSlot;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DateSlotServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DoctorServiceImp;
/*
 * DataSlotController manages the slots for doctor and and booking slots for patient
 */
@Controller
@RequestMapping("/timeslots")
public class DateSlotController {
		
		@Autowired
	    private DateSlotServiceImp dateSlotService; // autowiring dataslot service
		
	    @Autowired
	    private DoctorServiceImp doctorService; // autowiring doctor service
	    
		private static final Logger LOG= LoggerFactory.getLogger(DateSlotController.class);
		
		/*
		 * display the slots for the doctor
		 * @param Model to hold attributes for the view
		 * @param Session Initalized to store or fetch the attirbutes
		 * @output  returns the view displayslotfordoctor
		 */
		
	    @GetMapping("/list")
	    public String listDateSlots(Model model, HttpSession session) {
	    	 LOG.debug("listing the slots");
	        String email = (String) session.getAttribute("doctorEmail");
	        String  doctorID=doctorService.getDoctorIDbyEmail(email);
	        List<DateSlot> dateSlots = dateSlotService.getDateSlotsByDoctorId(doctorID);
	        model.addAttribute("dateSlots", dateSlots);
	        return "displayslotfordoctor"; // View for listing time slots
	    }

	    /*
	     * creating the slots 
	     * 
	     * @param Model to hold attributes for the view
	     * @output return dateslotform
	     * 
	     */
	    
	    @GetMapping("/createslot")
	    public String showCreateFormSlot(Model model) {
	        model.addAttribute("dateSlot", new DateSlot());
	        LOG.debug("creating date slot for doctor");
	        return "dateslotform"; // View for creating time slots
	    }
	    
	    /*
	     * 
	     * saving the doctor slots
	     * @param ModelAttributes dataslots 
	     * @param session initialized 
	     * @output redirects to list  
	     */
	    
	    @PostMapping("/save")
	    public String saveDateSlot(@ModelAttribute DateSlot dateSlot, HttpSession session) {
	    	LOG.debug("saving the date");
	    	String email = (String) session.getAttribute("doctorEmail");
	    	//fetching doctors details by using emial
	        Doctor doctor = doctorService.findDoctorDetailsByEmail(email);
	        System.out.println(doctor);
	        dateSlot.setDoctor(doctor);
	        dateSlotService.saveDateSlot(dateSlot);
	        return "redirect:/timeslots/list";// Redirect to list of time slots after saving
	    }
}
