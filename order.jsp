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
<title>Order Details</title>
</head>
<body style="background-color:#FFFFE3">
         <h1 style="text-align: center; color: #1bc2a2; float: left">"Enter your order no. to know Details: </h1>
 <br>
 <div style="width: 500px; margin: 200px auto 0 auto;">
<form action="order.jsp" method="post">
Order No:&nbsp;&nbsp;&nbsp;<input type="text" name="order_no"><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Proceed"></form>
</div>
<br>
<form method="post">

<table border="2">
<tr>
<td>Order ID</td>
<td>Product Name</td>
<td>Product Price</td>
<td>Buyer's Name</td>
<td>Buyer's Phone No</td>
<td>Buyer's Flat No</td>
<td>Buyer's Locality</td>
<td>Buyer's State</td>
<td>Buyer's Pin</td>
</tr>
<%
String order_no=request.getParameter("order_no");
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/commercial";
String username="root";
String password="root";
String query="select * from new_cus_orders where Order_Id='"+order_no+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr><td><%out.println(rs.getInt("Order_ID")); %></td>
    <td><%out.println(rs.getString("Product_name")); %></td>
    <td><%out.println(rs.getString("product_price")); %></td>
    <td><%out.println(rs.getString("Cus_name")); %></td>
    <td><%out.println(rs.getString("Cus_phone")); %></td>
    <td><%out.println(rs.getString("Cus_flat")); %></td>
    <td><%out.println(rs.getString("Cus_locality")); %></td>
    <td><%out.println(rs.getString("Cus_state")); %></td>
    <td><%out.println(rs.getString("Cus_pin")); %></td>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>

</form>
<br><br>
<form action="cancel.jsp" method="post">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Cancel Order"></form>


</body>
</html>