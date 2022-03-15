package consumer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class test 
{
	public String generateRow() 
	{		
		//int min=45;
		//int max=65;
		//Random rand= new Random();
		//int randomNum = rand.nextInt((max - min) + 1) + min;
		String msg;
		//System.out.println(new test().getRandNo(30,55));
		//System.out.println(new test().getRandStr(7));
		msg= new test().getRandStr(7)+ "|"; //License plate
		msg= msg+ (new test().getRandNo(40,65)) + "|"; //Speed
		msg= msg+ (new test().getRandNo(10,20)) + "|"; //  length
		msg= msg+ "N" + "|"; // direction
		msg= msg+ (9) + "|"; // Vehicle class
		msg= msg+ (new test().getRandNo(1,4))+ "|"; // Lane
		msg= msg+ (new test().getRandNo(10,20))+ "|"; //height
		msg= msg+ (new test().getRandNo(70,100))+ "|"; //Tire pressure
		msg= msg+ (new test().getRandNo(70000,80100))+ "|";	//Weight
		msg= msg+ new Date().toString() ; // Timestamp
		
		
		System.out.println(msg);
		return msg;
	}
	public String getRandStr(int limit) 
	{
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < limit) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
	public int getRandNo(int min,int max)
	{
		Random rand= new Random();
		int randomNum = rand.nextInt((max - min) + 1) + min;
		//System.out.println(randomNum);
		
		return randomNum;
		
	}
	public static void main(String[] args) throws IOException, InterruptedException {
		
		ArrayList<String> Message=new kafkaFetch().getMsg();
		for(String msg:Message)
		{
			//System.out.println(msg);
			String temp[]=msg.split("\\|");
			//System.out.println(temp.length);
			//System.out.println(msg);
			for(String m:temp)
			{
				System.out.print(" ( "+ m+" ) ");
			}	
			System.out.println("\n");
		}
	}
	
	
}
