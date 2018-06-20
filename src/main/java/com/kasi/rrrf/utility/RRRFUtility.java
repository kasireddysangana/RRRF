package com.kasi.rrrf.utility;

public class RRRFUtility {
	
	/*
	 * Method to get the Next Sequence Number
	 */
	
	public static int getNextSequenceNo(String tableSequenceNo)
	{
		int sequenceNoLength = tableSequenceNo.length();
		String sequeceNoSubStr = tableSequenceNo.substring(1, sequenceNoLength);
		int sequenceNo = Integer.parseInt(sequeceNoSubStr);
		sequenceNo++;
		return sequenceNo;
		
	}

}
