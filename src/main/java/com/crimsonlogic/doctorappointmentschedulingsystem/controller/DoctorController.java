package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DoctorService;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.LoginServiceImp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;
/*
 * Doctor controller handles web requests
 * It operations many operation of creating modifying the doctor credentials
 * 
 */
@Controller
@RequestMapping("/doctors")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;   // service for doctor related operation 
    
    
    private static final Logger LOG= LoggerFactory.getLogger(DoctorController.class);
	
    /*
	 * displays all the doctors 
	 * 
	 * @param Model model holds the views attributes
	 * @output returns view page displayalldoctor
	 * 
	 */
    
    @GetMapping("/displayalldoctors")
    public String listDoctors(Model model) {
    	
    	LOG.debug("display all  doctors");
        List<Doctor> doctors = doctorService.getAllDoctor();
        model.addAttribute("doctors", doctors);
        return "displayalldoctor";
    }
       
    /*
     * create the doctors 
     * 
     * @param Model model holds the attributes
     * @return the view of adddoctor
     * 
     */
    
    @GetMapping("/createdoctor")
    public String showCreateForm(Model model) {
    	 LOG.debug("creating new doctor profile");
        model.addAttribute("doctor", new Doctor());
        return "adddoctor";
    } 
    
    /*
     * registering the doctor details 
     * 
     * @param returns the data of named attributes  
     * @param Model stores the attributes 
     * @param Initialize the session attributes 
     * 
     */
    
    @PostMapping("/registerdoctorcomplete")
    public String registerDoctor(@ModelAttribute Doctor doctor, Model model,HttpSession session) {
    	LOG.debug("storing the doctors details");
    	try {
            doctorService.saveDoctor(doctor);
            session.setAttribute("message", "Registration Successful");
            return "redirect:/doctors/displayalldoctors"; // Redirect to the list of doctors after successful registration
        } catch (Exception e) {
        	session.setAttribute("message", "Registration Failed: ");
            model.addAttribute("doctor", doctor); // Add the form data back to the model
            return "adddoctor"; // Return to the registration page with error message
        }
    }
    
   /*
    * Deactivate the doctor
    * 
    * @param  doctorID 
    * @param Initialize the session attributes 
    * @output redirects to displayalldoctors
    *
    */
    
    @GetMapping("/deactivate/{doctorID}")
    public String deactivateDoctor(@PathVariable String doctorID, HttpSession session) {
    	LOG.debug("deactivating doctor profile");
    	// deactivate the doctor
        doctorService.setDoctorStatusToInactive(doctorID);
        session.setAttribute("message", "Doctor has been deactivated successfully.");
        session.setAttribute("message", "Failed to deactivate doctor: ");
        return "redirect:/doctors/displayalldoctors"; // Redirect to the list of doctors after the update
    }
    
    /*
     * Activate  the doctor
     * 
     * @param  doctorID
     * @param Initialize the session attributes 
     * @output redirects to displayalldoctors
     */
    
    @GetMapping("/activate/{doctorID}")
    public String activateDoctor(@PathVariable String doctorID, HttpSession session) {
    	LOG.debug("activating the doctor profile");
    	
    	// activate the doctor 
        doctorService.setDoctorStatusToActive(doctorID);
        session.setAttribute("message", "Doctor has been activated successfully.");        
        return "redirect:/doctors/displayalldoctors"; // Redirect to the list of doctors after the update
    }
    
    /*
     * directs the searchdoctor view 
     * 
     * @param param Model to hold attributes for the view
     * @output returns to view searchdoctor
     */
    
    @GetMapping("/searchdoctorpage")
    public String showSearchPage(Model model) {
    	LOG.debug("search the doctor");
        return "searchdoctor"; // This corresponds to the JSP file name `doctor-search.jsp`
    }   
    
    /*
     * Search the active doctors based on their description
     * 
     * @param descrption of the user is search 
     * @param Model fetches the attributes
     * @output fetch view searchdoctor
     */
    
    @PostMapping("/searchActiveDoctors")
    public String searchActiveDoctors(@RequestParam("description") String description, Model model) {
    	LOG.debug("searching the doctor based on input");
    	// search doctor based on their description
        List<Doctor> doctors = doctorService.searchActiveDoctorsByDescription(description);
        model.addAttribute("doctors", doctors);
        model.addAttribute("searchTerm", description);
        return "searchdoctor"; // JSP page name
    }
    
   /*
    * dispalys the doctor home page
    * 
    * @param Session is initialized to store the doctor details
    * @output returns the view doctorhome
    */
    
    @GetMapping("/doctorhome")
    public String doctroHomePage(HttpSession session) {
    	LOG.debug("doctor homepage");
    	String doctorEmail=(String)	session.getAttribute("duser");
    	session.setAttribute("doctorEmial", doctorEmail);
		return "doctorhome";	
    }  
  
 }