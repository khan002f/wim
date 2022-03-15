import java.sql.*;

public class getmySQLConnection
{
        public static void main(String[] args) throws Exception
        {
                DB db = new DB();
                Connection conn=db.dbConnect("jdbc:mysql://localhost:3306/test", "temp", "pass");
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery("Select * from example");
				
				for(;rs.next();)
				{
					System.out.println (rs.getInt(1));
					System.out.println (rs.getString(2));	
					System.out.println (rs.getInt(3));		
				
				}
        }

}

class DB
{
        public DB() {}

        public Connection dbConnect(String db_connect_string,
          String db_userid, String db_password)
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
                        e.printStackTrace();
                        return null;
                }
        }
}; 