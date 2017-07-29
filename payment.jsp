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
<title>Payment Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
 <body style="background-color:#FFFFE3">
         <h1 style="text-align: center; color: #1bc2a2; float: left">Payment Page</h1>
         <br>
                  <div style="width: 500px; margin: 200px auto 0 auto;">
   <form action="payment.jsp" method="post">
     Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="username" /><br /><br />
     Phone No:&nbsp; <input type="text" name="phone" /><br /><br />
     Flat No: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="flat" /><br /><br />
     Locality:&nbsp;&nbsp;&nbsp; <input type="text" name="locality" /><br /><br />
     State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="state" /><br /><br />
     Pin:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="pin" /><br /><br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Order" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear" />
   </form> 
   <br>
   <form action="main.html">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Cancel" />
  </form>
   
 </div>
  <%
  String uname=request.getParameter("username");
   String phone=request.getParameter("phone");
  String flat=request.getParameter("flat");
  String locality=request.getParameter("locality");
  String state=request.getParameter("state"); 
  String pin=request.getParameter("pin");
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
 		 String sql ="select * from cus_orders order by Order_ID DESC LIMIT 1";
 		rs= statement.executeQuery(sql);
 		  int prices=0;
 		  String names=null;
 	 		while(rs.next()) {
 	 			names=rs.getString("Product_name");
 	 	         prices =rs.getInt("Product_price");
 	 		}
 	 		
 		
 		int i=2;
 		  i=statement.executeUpdate("INSERT INTO new_cus_orders(Product_price,Product_name,Cus_name,Cus_phone,Cus_flat,Cus_locality,Cus_state,Cus_pin) values('"+prices+"','"+names+"','"+uname+"','"+phone+"','"+flat+"','"+locality+"','"+state+"','"+pin+"')"); 		
 		 if(i==0){
  			out.println("Order Failed!");
  		}
 		 else if(i==1){
  			out.println("Order Sucessful!");
 		 }
 		 else
 			 out.print("");
 		String sql1 ="select Order_ID from new_cus_orders order by Order_ID DESC LIMIT 1";
 		rs= statement.executeQuery(sql1);
 		  int order_no=0;
 	 		while(rs.next()) {
 	 	         order_no =rs.getInt("Order_ID");
 	 	         
 	 		}
 	 		out.println("Your Order ID is:"+order_no);
 	 		order_no=0;
 	 		i=2;
 	 		
 		%>

   
  
</body>
</html>