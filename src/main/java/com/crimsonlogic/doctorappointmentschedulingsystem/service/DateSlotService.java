package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.sql.Date;
import java.util.List;

import com.crimsonlogic.doctorappointmentschedulingsystem.entity.DateSlot;

public interface DateSlotService {
	
		void saveDateSlot(DateSlot dateSlot);
	    
		List<DateSlot> getDateSlotsByDoctorId(String doctorId);
		
		public DateSlot getDateSlotById(String slotId);
		
		List<DateSlot> findBookedSlotsByDateAndDoctor( Date date,  String doctorID);
		
		boolean slotCorrect(Date date);
}
