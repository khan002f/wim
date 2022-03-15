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
        	this.db_connect_string="jdbc:mysql://localhost:3306/gronthi";
        	this.db_userid="temp";
        	this.db_password="pass";
        }

        public Connection dbConnect()
        {
                try
                {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn = DriverManager.getConnection(db_connect_string, db_userid, db_password);
                        //stem.out.println("connected");
                        return conn;
                        
                }
                catch (Exception e)
                {
                        e.printStackTrace();
                        return null;
                }
        }
}; 