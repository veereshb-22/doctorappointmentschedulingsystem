package com.crimsonlogic.doctorappointmentschedulingsystem.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.DateSlot;

@Repository
public interface DateSlotRepository extends JpaRepository<DateSlot, String> {
	   List<DateSlot> findByDoctorDoctorID(String doctorId);
	   
	   @Query("SELECT ds FROM DateSlot ds WHERE ds.slotStartTime <= :date AND ds.slotEndTime >= :date AND ds.doctor.doctorID = :doctorID")
	    List<DateSlot> findBookedSlotsByDateAndDoctor(@Param("date") Date date, @Param("doctorID") String doctorID);
	   
	   @Query("SELECT ds FROM DateSlot ds WHERE :date BETWEEN ds.slotStartTime AND ds.slotEndTime")
	   List<DateSlot> findSlotsByDate(@Param("date") Date date);
	
}