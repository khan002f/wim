package MyConnection;
import java.sql.*;

public class DB_con
{
	private String db_connect_string;
	private String db_userid;
	private String db_password;	 
	
        public DB_con(String db_connect_string,String db_userid,String db_password) 
        {
        	this.db_userid=db_userid;
        	this.db_connect_string=db_connect_string;
        	this.db_password=db_password;
        }
        public DB_con()	
        { 
        	this.db_connect_string="jdbc:mysql://gronthi.db.7186002.hostedresource.com:3306/gronthi";
        	this.db_userid="gronthi";
        	this.db_password="Ran19TU84";
        }

        public Connection dbConnect()
        {
                try
                {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn = DriverManager.getConnection(db_connect_string, db_userid, db_password);
                       	System.out.println("connected");
                        return conn;
                        
                }
                catch (Exception e)
                {	
                		System.out.println(e.getMessage());
                        e.printStackTrace();
                        return null;
                }
        }
}; 