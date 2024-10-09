package com.crimsonlogic.doctorappointmentschedulingsystem.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Appointment;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.DateSlot;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.Doctor;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.AppointmentServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DateSlotServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.DoctorServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.PatientServiceImp;
import com.crimsonlogic.doctorappointmentschedulingsystem.service.TransactionServiceImp;

/**
 * AppointmentController handles appointment related web requests.
 * It provides functionalities to display, book  appointments.
 */ 
@Controller
@RequestMapping("/appointment")
public class AppointmentController {
	
	private static final Logger LOG= LoggerFactory.getLogger(AppointmentController.class);
	
	@Autowired
	private PatientServiceImp patientServiceImp;   // Service frm  patient related operation
	
	@Autowired
	private AppointmentServiceImp appointmentService;   // Service for appointment related operation
	
	@Autowired 
	private DoctorServiceImp doctorServiceImp;   // Service for doctor related operations
	
	@Autowired
    private DateSlotServiceImp dateSlotService;  //service fordoctorslot  related operation
	
	@Autowired
	private TransactionServiceImp  transactionServiceImp; // service for transaction related operation

	/**
	 * Display all the appointment  
	 * 
	 * @param model the model to hold attributes for the view
	 * @return the  name of view displaying all appointment
	 */
	
	 @GetMapping("/displayallappointment")
	    public String listPatients(Model model) {
	        List<Appointment> appointment=appointmentService.getAllAppointment();	        
	        		model.addAttribute("appointments",appointment);
	        return "displayallappointment";
	    }	
	 	
	 	/**
		 * Displays appointments for a specific patient.
		 *
		 * @param model the model to hold attributes for the view
		 * @param session the HTTP session to access patient information
		 * @return the name of the view displaying patient's appointments
		 */
	 
	 @GetMapping("/displayappointmentbypatient")
	    public String listpatientappointment(Model model,HttpSession session) { 
		 LOG.debug("display all appointmentdetails for patients");
		 String patientID=(String)session.getAttribute("patientIDSession");
	        List<Appointment> appointment=appointmentService.getAppointmentByPatientID(patientID);  
	        		model.addAttribute("appointmentbypatient",appointment);
	        return "displayuserappointmnet";
	    }
	 
		/**
		 * Shows the booking form for a selected doctor.
		 *
		 * @param doctorID the ID of the selected doctor
		 * @param model the model to hold attributes for the view
		 * @param session the HTTP session to access patient information
		 * @return the name of the view for booking an appointment
		 */
	 @GetMapping("/bookappointment")
	    public String showBookAppointmentForm(@RequestParam("doctorID") String doctorID, Model model,HttpSession session) {
	        // Fetch the doctor's details to show in the booking form
		    LOG.debug("selecting the doctor and booking time slot");
		 	int amount=(Integer)session.getAttribute("patientwalletSession");
		 	if(amount<500) {
		 		 return "insufficientbalancerecharge";
		 	}
		 	session.setAttribute("doctorIDByPatient", doctorID);
	        Doctor doctor = doctorServiceImp.findDoctorDetailsById(doctorID);
	        model.addAttribute("doctorPatientSession", doctor);
	        model.addAttribute("appointment", new Appointment());
	        return "lookforslot"; // JSP page for booking appointment
	    }
	 
	 /**
	 * Displays a list of appointments for a specific doctor.
	 *
	 * @param model the model to hold attributes for the view
	 * @param session the HTTP session to access doctor information 
	 * @return the name of the view displaying  doctorappointmentaction
	 * 
	 */
	@GetMapping("/listslotfordoctor")
	public String listAppointments( Model model,HttpSession session) {
		
		String email=(String)session.getAttribute("doctorEmail");
	    List<Appointment> appointments = appointmentService.getAppointmentByDoctorEmail(email);
	    model.addAttribute("appointments", appointments);
	    return "doctorappointmentaction"; // JSP page to display the list
}
	
	/**
	 * Updates the status of an appointment.
	 *
	 * @param appointmentID the ID of the appointment to update
	 * @param status the new status to set
	 * @param redirectAttributes attributes for redirecting with messages
	 * @return redirect URL to the doctor's appointment action page	 
	 * 
	*/
	
	@GetMapping("/updateStatus")
	public String updateStatus(
	        @RequestParam("appointmentID") String appointmentID,
	        @RequestParam("status") String status,
	        RedirectAttributes redirectAttributes) {
	    LOG.debug("Updating appointment status: appointmentID={}, status={}", appointmentID, status);

	    try {
	        // Validate status value
	        if (!status.equals("Confirm") && !status.equals("Reject")) {
	            throw new IllegalArgumentException("Invalid status value: " + status);
	        }

	        // Call service to update the status
	        appointmentService.updateAppointmentStatus(appointmentID, status);

	        // Add success message to redirect attributes
	        redirectAttributes.addFlashAttribute("message", "Appointment status updated successfully!");
	        LOG.info("Successfully updated status for appointmentID={}", appointmentID);
	    } catch (IllegalArgumentException e) {
	        // Handle invalid status value
	        redirectAttributes.addFlashAttribute("error", "Invalid status value.");
	        LOG.error("Invalid status value for appointmentID={}", appointmentID, e);
	    } catch (Exception e) {
	        // Handle other exceptions
	        redirectAttributes.addFlashAttribute("error", "Failed to update appointment status.");
	        LOG.error("Failed to update status for appointmentID={}", appointmentID, e);
	    }

	    // Redirect to the list page
	    return "redirect:/appointment/doctorappointmentaction";
	}

	/**
	 * Get's the avaiable slots
	 * 
	 * @param date the date of appointment selected 
	 * @param doctorID the ID of the doctor
	 * @return the view page unavaliable
	 * 
	 */
	
	@GetMapping("/getUnavailableSlots")
	public List<String> getUnavailableSlots(Date date, String doctorID) {
		 LOG.debug("unavaiable slots ");
		 
		// fetching appointment details using 
	    List<Appointment> appointments = appointmentService.findByAppointmentDateAndDoctorID(date, doctorID);
	    List<String> unavailableSlots = new ArrayList<>();
	    
	    for (Appointment appointment : appointments) {
	        Time time = appointment.getAppointmentTime(); // Assuming getAppointmentTime returns Time
	        if (time != null) {
	            unavailableSlots.add(time.toString()); // Convert Time to String
	
	        }
	    }
	    return unavailableSlots;
	}
	
	/*
	 * show the slot 
	 * 
	 * @param doctor the ID of the doctor
	 * @param appointmentDate the date of appointment selected
	 * @param Model  model that holds view attributes
	 * output returns the view page schedulebookingslot
	 * 
	 */
	
	@GetMapping("/showtimeslots")
	public String showTimeSlots(
	        @RequestParam("doctorID") String doctorID,
	        @RequestParam("appointmentDate") Date appointmentDate,
	        Model model) {
		if(dateSlotService.slotCorrect(appointmentDate)) {
			return "error";
		}
	    LOG.debug("Showing the slots available");

	    Doctor doctor = doctorServiceImp.findDoctorDetailsById(doctorID);

	    // Define available time slots
	    List<String> timeSlots = Arrays.asList(
	        "09:00:00",
	        "10:00:00",
	        "11:00:00",
	        "12:00:00",
	        "14:00:00",
	        "15:00:00",
	        "16:00:00"
	    );

	    // Retrieve all date slots for the given doctor
	    List<DateSlot> availableDateSlots = dateSlotService.findBookedSlotsByDateAndDoctor(appointmentDate, doctorID);

	    // Retrieve booked appointments for the given date and doctor
	    List<Appointment> bookedAppointments = appointmentService.findByAppointmentDateAndDoctorID(appointmentDate, doctorID);
	    // Convert booked appointments to a set of booked times
	    Set<String> bookedTimes = new HashSet<>();
	    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
	    for (Appointment appointment : bookedAppointments) {
	        Time appointmentTime = appointment.getAppointmentTime(); // Get appointment time
	        String formattedTime = timeFormat.format(appointmentTime);
	        bookedTimes.add(formattedTime);
	    }

	    // Prepare a set for available times based on DateSlot
	    Set<String> availableTimes = new HashSet<>(timeSlots);

	    // Iterate over the available date slots and adjust available times
	    for (DateSlot slot : availableDateSlots) {
	        Date slotStartDate = slot.getSlotStartTime();
	        Date slotEndDate = slot.getSlotEndTime();

	        // Assume appointment date must be between slot start and end dates
	        if (appointmentDate.equals(slotStartDate) || appointmentDate.equals(slotEndDate) ||
	            (appointmentDate.after(slotStartDate) && appointmentDate.before(slotEndDate))) {
	            // Extract time range for this slot
	            String slotStartTimeStr = "09:00:00"; // Example time, adjust based on actual logic
	            String slotEndTimeStr = "17:00:00"; // Example time, adjust based on actual logic

	            // Check if any predefined time slots fall within this DateSlot
	            for (String timeSlot : timeSlots) {
	                if (timeSlot.compareTo(slotStartTimeStr) >= 0 && timeSlot.compareTo(slotEndTimeStr) <= 0) {
	                    availableTimes.add(timeSlot);
	                }
	            }
	        }
	    }

	    // Remove booked times from available times
	    availableTimes.removeAll(bookedTimes);

	    // Prepare the view model
	    model.addAttribute("doctorID", doctorID);
	    model.addAttribute("appointmentDate", appointmentDate);
	    model.addAttribute("doctorName", doctor.getDoctorName());
	    model.addAttribute("timeSlots", timeSlots);
	    model.addAttribute("availableTimes", availableTimes); // Add available times after checking
	    model.addAttribute("bookedTimes", bookedTimes);
	    LOG.debug("Slots retrieved successfully");

	    // Check if all slots are booked
	    if (availableTimes.isEmpty()) {
	        model.addAttribute("message", "No available time slots for the selected date.");
	        return "noavailabletimeslots"; // JSP page for no slots available
	    }

	    return "schedulebookingslot";
	}
	
	/*
	 * Booking the slots appointment and transaction are generated 
	 * 
	 * @param request request the data
	 * @param session maintain the session attributes
	 * @param redirectAttributes redirects the attributes
	 * @output redirects to the URL 
	 * 
	 */
    @PostMapping("/bookappointment")
    public String bookAppointment(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) {
        // Extract parameters from the request
    	String email=(String)session.getAttribute("patientEmailSession");
    	patientServiceImp.deductFromWallet(500,email);
	 	int updatedMoney=patientServiceImp.getPatientWallet(email);
	 	session.setAttribute("patientwalletSession", updatedMoney);
    	String doctorId=(String)session.getAttribute("doctorIDByPatient");
        String appointmentDateString = request.getParameter("appointmentDate");
        String appointmentTimeString = request.getParameter("appointmentTime");
        String patientId=(String)session.getAttribute("patientIDSession");
        Appointment appointment= appointmentService.savepatientAppointment(appointmentDateString, appointmentTimeString, doctorId, patientId);
        transactionServiceImp.transactionSaveBypatient(appointment);
       // Add a success message to the redirect attributes
        redirectAttributes.addFlashAttribute("message", "Appointment booked successfully!");
        // Redirect to a success page or another view
        return "redirect:/user/successful"; // Adjust to the appropriate path
    }
}
