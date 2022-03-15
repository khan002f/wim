package mongoDB;

import java.util.ArrayList;

import org.bson.Document;
import org.json.JSONObject;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.json.JSONObject;

public class WimMongoClien{
/*
public static void main(String[] args) {
	MongoClient mongoClient = MongoClients.create(
	"mongodb+srv://dbUser:wim123@cluster0.dresi.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
	MongoDatabase database = mongoClient.getDatabase("wimdatabase");
	ArrayList<String> temp=new WimMongoClien().getAllDocuments(database.getCollection("wimcollection"));

 }*/
// Method to fetch all documents from the mongo collection.
public ArrayList<String>  getAllDocuments(MongoCollection<Document> col) {
System.out.println("Fetching all documents from the collection");
// Performing a read operation on the collection.
FindIterable<Document> fi = col.find();
MongoCursor<Document> cursor = fi.iterator();
ArrayList<String> data = new ArrayList<String>();

	try {
		int j=1;
		while(cursor.hasNext()) {
		
		//String temp=cursor.next().ThitoJson().toString();
		
		//System.out.println(cursor.next().toJson().toString());
			if(j<20)
			{
				cursor.next();
				
			}
			else
			{
				//System.out.println(cursor.next().toJson());
				
				JSONObject obj=new JSONObject(cursor.next().toJson());
				System.out.println(obj.get("msg").toString());
				//String temp[]=obj.get("msg").toString().split("\\|");
				data.add(obj.get("msg").toString());
			}
		
		j++;
		}
	} 
	catch(Exception e)
	{
		e.fillInStackTrace();
	}
	finally {
		cursor.close();
		}
	return data;
	}

}