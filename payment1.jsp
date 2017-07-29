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
<title>Confirm Order</title>
</head>
<body style="background-color:#FFFFE3">
         <h1 style="text-align: center; color: #1bc2a2; float: left">"Proceed" button will redirect you to Order page! </h1>
         <br>
         <div style="width: 500px; margin: 200px auto 0 auto;">
<form action="payment.jsp">
<input type="submit" value="Proceed">
</form>
</div>
<%String name=request.getParameter("item");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "commercial";
String userId = "root";
String password = "root";
try {
	 Class.forName(driverName);
	 } catch (ClassNotFoundException e) {
	 e.printStackTrace();
	 }

	 Connection connection = null;
	 Statement statement = null;
	 ResultSet rs = null;
		 connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		 statement=connection.createStatement();
		 String sql ="select Price from items where Item_name = '" + name + "'";
		rs= statement.executeQuery(sql);
		  int price=0;
	 		if(rs.next()) {
	 	         price =rs.getInt("Price");
	 		}
	 		int i=statement.executeUpdate("INSERT INTO cus_orders(Product_name,Product_price) values('"+name+"','"+price+"')");
%>
</body>
</html>