package com.crimsonlogic.doctorappointmentschedulingsystem.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import com.crimsonlogic.doctorappointmentschedulingsystem.entity.DateSlot;
import com.crimsonlogic.doctorappointmentschedulingsystem.repository.DateSlotRepository;

/**
 * DateSlot Service Logic
 */
@Service
public class DateSlotServiceImp implements DateSlotService{

	 @Autowired
	 private DateSlotRepository dateSlotRepository;

	    public List<DateSlot> getDateSlotsByDoctorId(String doctorId) {
	    	 return dateSlotRepository.findByDoctorDoctorID(doctorId);
	    }

	    public void saveDateSlot(DateSlot dateSlot) {
	    	dateSlotRepository.save(dateSlot);
	    }

		@Override
		public DateSlot getDateSlotById(String slotId) {
			return dateSlotRepository.findById(slotId).orElse(null);
		}

		@Override
		public List<DateSlot> findBookedSlotsByDateAndDoctor(Date date, String doctorID) {
			// TODO Auto-generated method stub
			return dateSlotRepository.findBookedSlotsByDateAndDoctor(date, doctorID);
		}
		
		@Override
		public boolean slotCorrect(Date date) {
			// TODO Auto-generated method stub
			  if(dateSlotRepository.findSlotsByDate(date).isEmpty()) {
				  return true;
			  }
			  return false;
		}
}
