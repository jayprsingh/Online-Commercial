<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
   <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancellation Page</title>
</head>
<body style="background-color:#FFFFE3">
         <h1 style="text-align: center; color: #1bc2a2; float: left">"Enter your order no. to cancel order: </h1>
 <br>
 <div style="width: 500px; margin: 200px auto 0 auto;">
<form action="cancel.jsp" method="post">
Order No:&nbsp;&nbsp;&nbsp;<input type="text" name="order_no"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Cancel"></form>
</div>
<%
String order_no=request.getParameter("order_no");
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/commercial";
String username="root";
String password="root";
String query="delete from new_cus_orders where Order_Id='"+order_no+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
int i=0;
i=stmt.executeUpdate(query);
if(i==1){
	out.println("Sucessfully Cancelled");
}
else if(i==2){
	out.print("Unsucessful!");
}
else
	out.println("");
}
catch(Exception e)
{
    e.printStackTrace();
    }

%>
</body>
</html>