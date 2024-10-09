package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Patient;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.PatientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class PatientController {
	
    @Autowired
    private PatientService patientService; //autowired the patient service
    
	private static final Logger LOG= LoggerFactory.getLogger(PatientController.class);
	/*
	 * display error message if no slots are avaliable 
	 */
	
	@GetMapping("/error")
	public String errorpage() {
	return "error";	
	}
	
	/*
	 * dispaly payment successful 
	*/
	
	@GetMapping("/successful")
	public String getsuccessfultransaction() {
		return "transactionsuccessful";
	}
	/*
	 * @param Model stores attributes for views
	 * @output returns to register page
	 * 
	 */
	
    @GetMapping("/add")
    public String showAddPatientForm(Model model) {
    	LOG.debug("registering user");
        model.addAttribute("patient", new Patient());
        return "register";
    }
    
    /*
     * returns to home page of admin
     */
    
    @GetMapping("/home")
    public String home() {
    	LOG.debug("userhome");
        return "adminhome"; // returns the home.jsp view
    }
    
    /*
     * registering the patients data and storing it 
     * 
     * @param patient attribute data
     * @param redirect attributes 
     *@output registration successful redirect to admin otherwise redirect to register  
     *
     */
    
    @PostMapping("/add")
    public String addPatient(@ModelAttribute("patient") Patient patient, RedirectAttributes redirectAttributes,HttpSession session) {
    	//String encodedepassword=loginServiceImp.securePassword(patient.getPatientPassword());
    	//patient.setPatientPassword(encodedepassword);
    	try {
      	patientService.savePatient(patient);
        redirectAttributes.addFlashAttribute("message"," Registeration Successful ");
        LOG.debug("registering successful");
    	}catch(Exception e) {
    		redirectAttributes.addFlashAttribute("message","User already exist registration failed!");
    		session.setAttribute("errorMessage", "Registration Failed User Credentail Exists");
    		 LOG.debug("registering failed");
    		System.out.println(e);
    		return "redirect:/user/add";
    	}
        return "redirect:/loginpage/login";
    }
    
    /*
     * 
     * Displaying the patient data
     * 
     * @param Model stores attributes for the view
     * @output return th displayalluser view
     */
    
    @GetMapping("/list")
    public String listPatients(Model model) {
    	
    	//fetch all patient data
        List<Patient> patients = patientService.getAllPatients();
        model.addAttribute("patients", patients);
        return "displayalluser";
    }
    
    /*
     *return to userhome view 
     */
    
    @GetMapping("/userhome")

    	 public String userHome(HttpSession session, Model model) {
    	        // Retrieve session attributes
    	        return "userhome"; // Name of your JSP or Thymeleaf template
    	    }
    
    /*
     * return general home view
     */
  
    @GetMapping("/generalhome")
    public String generalhome() {
    	return "generalhome";
    }
    
    /*
     * return to general about page
     */
    @GetMapping("/generalabout")
    public String generalabout() {
    	return "generalabout";
    }
     
    @GetMapping("/generalcontact")
    public String generalcontact() {
    	return "generalcontact";
    }
    
    // logout for sessions
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        redirectAttributes.addFlashAttribute("message", "You have been logged out successfully.");
        return "redirect:/user/generalhome";
    }  
    
    @GetMapping("/viewprofile")
    String viewprofiledata() {
    	
    	return "profile";
    
    }
    
    /*
     * 
     * Recharge the user wallet
     * 
     * @param amount need to be recharged
     * @param session initialized 
     * 
     */
    
    @PostMapping("/recharge")
    public String recharge(@RequestParam("amount") int amount, HttpSession session, RedirectAttributes redirectAttributes) {
        String patientEmail = (String) session.getAttribute("patientEmailSession");
        if (patientEmail != null && amount > 0) {
            patientService.updatePatientWallet(amount, patientEmail);
            int money=patientService.getPatientWallet(patientEmail);
            session.setAttribute("patientwalletSession", money);
            LOG.debug("recharge wallet successful");
            redirectAttributes.addFlashAttribute("message", "Wallet recharged successfully!");
        } else {
        	 LOG.debug("recharge wallet failed");
            redirectAttributes.addFlashAttribute("error", "Invalid amount or session.");
        }
        return "redirect:/user/userhome";
    }
    
}
