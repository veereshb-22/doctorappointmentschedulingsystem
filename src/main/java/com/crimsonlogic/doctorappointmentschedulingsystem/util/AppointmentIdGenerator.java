package com.crimsonlogic.doctorappointmentschedulingsystem.util;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Random;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class AppointmentIdGenerator implements IdentifierGenerator {
	
	 	private static final String PREFIX = "APID";
	    private static final int LENGTH = 8;
	    private static final DecimalFormat FORMAT = new DecimalFormat("00000000");

	    @Override
	    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
	        Random random = new Random();
	        int number = random.nextInt((int) Math.pow(10, LENGTH));

	        // Format the number with leading zeros
	        String formattedNumber = FORMAT.format(number);

	        // Return the ID in the desired format
	        return PREFIX + formattedNumber;
	    }
}		
