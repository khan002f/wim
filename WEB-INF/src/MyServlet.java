//package pack1;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class MyServlet extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		boolean flag=false;
		res.setContentType("text/html");
		PrintWriter pr=res.getWriter();
		//String userName=req.getParameter("nm");
		//String password=req.getParameter("ps");
		try{	
				pr.println("<html><title>test</title><body><h1>test</h1><br>");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "temp", "pass");
				Statement stmt=conn.createStatement();
				pr.println("<a href=\tuhin\test.txt>click</a>");
				ResultSet rs=stmt.executeQuery("Select * from example");
				
				
				for(;rs.next();)
				{
					pr.println (rs.getInt(1));
					pr.println (rs.getString(2));	
					pr.println (rs.getInt(3));		
				
				}
				pr.println("</body><html>");
		//	pr.println("<html><title>Welcome Page</title><body bgcolor=pink>You are a valid user <br>");
			
		}
		catch(Exception e)
		{
			System.out.println (e);
		}
		
	}
}