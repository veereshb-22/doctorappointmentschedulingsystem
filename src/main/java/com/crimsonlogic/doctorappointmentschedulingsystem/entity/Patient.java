package com.crimsonlogic.doctorappointmentschedulingsystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.PrePersist;

import java.sql.Date;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "patient_info")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Patient {

	@Id
	@Column(name="patient_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "patient-id-generator")
    @GenericGenerator(name = "patient-id-generator", strategy = "com.crimsonlogic.doctorappointmentschedulingsystem.util.PatientIdGenerator")
	private String patientID;
    @Column(name = "patient_name")
    private String patientName;

    @Column(name = "patient_number", unique = true)
    private String phoneNumber;

    @Column(name = "patient_email", unique = true)
    private String patientEmail;

    @Column(name = "patient_password")
    private String patientPassword;

    @Column(name = "patient_status")
    private String patientStatus="User";

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "patient_address")
    private String patientAddress;

    @Column(name = "patient_gender")
    private String patientGender;

    @Column(name = "patient_wallet")
    private int wallet;
    
    @PrePersist
    protected void onCreate() {
           this.patientStatus = "Active"; // Ensure default value before persist
        
    }
    

}
