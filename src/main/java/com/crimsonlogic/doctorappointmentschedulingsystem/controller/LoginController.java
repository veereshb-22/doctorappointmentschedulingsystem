package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Login;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DoctorServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.LoginServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.PatientServiceImp;

@Controller
@RequestMapping("/loginpage")
public class LoginController {
	@Autowired
	LoginServiceImp  loginServiceImp; // autowiring the login service
	
	@Autowired
	PatientServiceImp patientServiceImp; // autowiring the patient service
	
	@Autowired
	DoctorServiceImp  doctorServiceImp; // autowiring the doctor service
	
	private static final Logger LOG= LoggerFactory.getLogger(LoginController.class);
	/*
	 * login for user, admin, doctor
	 * @param Model to hold attributes for the view
	 * @output returns to login view
	 */
	
	  @GetMapping("/login")
	    public String showLoginForm(Model model) {
		  LOG.debug("login page");
	        model.addAttribute("user", new Login());
	        return "login";
	    }  
	  
	  
	  /*
	   *login validation and redirect to repective credentials
	   *
	   *@param Request param userEmail  from login view
	   *@param Request param userPassword formlogin view
	   *@output redirects to different controller based on their credentials
	   */
	  @PostMapping("/login")
	  public String login(@RequestParam("userEmail") String userEmail, @RequestParam("userPassword") String userPassword,
	                      RedirectAttributes redirectAttributes, HttpSession session) {
		  String spassowrd=loginServiceImp.securePassword(userPassword);
	      String userType = loginServiceImp.validateUserType(userEmail, spassowrd);
	      if (userType.equals("admin")) {
	          LOG.debug("admin login successful");
	          return "redirect:/user/home";
	      }
	      
	      if (userType.equals("patient")) {
	          // Handle patient login
	    	  	String patientNameSession=patientServiceImp.getPatientName(userEmail);
	        	String patientIDSession=patientServiceImp.getPatientById(userEmail);
	        	int patientwalletSession=patientServiceImp.getPatientWallet(userEmail);
	        	session.setAttribute("patientEmailSession", userEmail);
	        	session.setAttribute("patientNameSession", patientNameSession);
	        	session.setAttribute("patientIDSession", patientIDSession);
	        	session.setAttribute("patientwalletSession", patientwalletSession);

	          return "redirect:/user/userhome";
	      }
	      if (userType.equals("doctor")) {
	          // Handle doctor login
	    	  session.setAttribute("doctorEmail",userEmail);
	          return "redirect:/doctors/doctorhome";
	      }
	      // Set error message if login fails
	      session.setAttribute("errorMessage", "Invalid email or password.");
	      return "redirect:/loginpage/login"; // Redirect back to login
	  }

	  /*
	   * logout from session and redirect to general home
	   *param session is closed for the user
	   * 
	   */
	  
	  	@GetMapping("/logout")
	    public String logout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	  		LOG.debug("logout successful");
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }
	        redirectAttributes.addFlashAttribute("message", "You have been logged out successfully.");
	        return "redirect:/user/generalhome";
	    } 
}
