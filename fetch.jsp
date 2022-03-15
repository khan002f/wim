<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,MyConnection.DB_con,java.io.*,java.util.*,consumer.kafkaFetch" errorPage="admin/erro.jsp" %>
<%
/*response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Cache-Control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server*/

	
try
 {
	 ArrayList<String> Message=new kafkaFetch().getMsg();
	//out.print(Message.isEmpty()?"empty":"Not Empty");

	 for(String msg:Message)
		{
			//System.out.println(msg);
			String temp[]=msg.split("\\|");
			//System.out.print((Integer.parseInt(temp[9]))>7500? "style=\"color:red\"":"");
			//System.out.println(temp.length);
			//System.out.println(msg);
			/*for(String m:temp)
			{
				out.print(" ( "+ m+" ) ");
			}	*/
			//out.print("\n");

//int n= Integer.parseInt(temp[9]);
//out.print(n);
//<%= (n<1)?"style='color:red'":"style='color:black'"

String test="style='color:red'";
String weight1=temp[8].toString();
System.out.print(temp[1]);
//int w=Integer.parseInt(Weight1);
%>



			<div class="divRow" style='color:green' >
			
                
                <div  class="divCell"><%= temp[0] %></div>
                <div  class="divCell"><%= temp[1] %></div>
                <div  class="divCell"><%= temp[2] %></div>
                <div  class="divCell"><%= temp[3] %></div>
                <div  class="divCell"><%= temp[4] %></div>
                <div  class="divCell"><%= temp[5] %></div>
                <div  class="divCell"><%= temp[6] %></div>
                <div  class="divCell"><%= temp[7] %></div>
                <div  class="divCell" <%=test %>>  <%= temp[8] %></div>
                 <div  class="divCell" ><%= temp[9] %></div>
                <div  class="divCell"><input type=button value=Details onClick="javascript:alert('Here it will take you to the detailed page')"/></div>
              </div>

<%			
			
		}
 }
 catch(Exception e)
 {
	 
 }
 
 %>

	
           
                                
          
 
			