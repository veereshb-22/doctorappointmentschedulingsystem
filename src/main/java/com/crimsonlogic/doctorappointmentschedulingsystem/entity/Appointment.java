package com.crimsonlogic.doctorappointmentschedulingsystem.entity;

import java.sql.Date;
import java.sql.Time;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity class of Appointment
 * class is mapped to appointment_info in database
 * 
 */

@Entity
@Table(name="appointment_info")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Appointment {
	
	/**
	 * Appointment ID generated automatically 
	 * mapped to appointment_id column primary key in the table
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "appointment-id-generator")
    @GenericGenerator(name = "appointment-id-generator", strategy = "com.crimsonlogic.doctorappointmentschedulingsystem.util.AppointmentIdGenerator")
	
	@Column(name="appointment_id")
	private String appointmentID;
	
	/**
	 * Appointment Date 
	 * mapped to appointment_date column
	 */
	
	@Column(name="appointment_date")
	private Date appointmentDate;
	
	/**
	 *Appointment time
	 *mapped to appointment_time 
	 */
	
	@Column(name="appointment_time")
	private Time appointmentTime; 
	
	/**
	 *Appointment status whether booked or not  
	 *mapped to appointment_status column
	 */
	
	@Column(name="appointment_status")
	private String appointmentStatus;
	
	/**
	 * Appointment fees  
	 * mapped to appointment_fees column
	 
	 */
	@Column(name="appointment_fees")
	private int appointmentFees;
	
	/**
	 * Represent the relationship between Patient and Appointment Entity
	 * field is mapped to patient_id 
	 */
	@ManyToOne
	@JoinColumn(name = "patient_id",referencedColumnName= "patient_id")
	private Patient patientID;
	
	/**
	 * Represent the relationship between Doctor and Appointment Entity
	 * field is mapped to doctor_id
	 */
	
	@ManyToOne
	@JoinColumn(name = "doctor_id",referencedColumnName= "doctor_id")
	private Doctor doctorID;
   
}
