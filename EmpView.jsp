
<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
 
String sql="select * from Employee";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
    <head>
        <style>
            .home{
			background-color:green;
			position:absolute;
			padding: 0px 60px;
			font-size:14px;
			border-radius:40px;
			box-sizing:barder-box;
			border:1px solid #2222;
			baclground:#fsfsfs;
			}
        </style>
    </head>
<body bgcolor="pink">
<center>
<h1>EMPLOYEE</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="8" align="center">EMPLOYEE Details</th></tr>

<tr>
<td>EMPLOYEE ID</td>
<td>EMPLOYEE NAME</td>
<td>DESIGNATION</td>
<td>SALARY</td>
<td>EMAIL</td>
<td>PHONE NUMBER</td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
</tr>
<%
}
%>
</table>
<br>
<br>
<form action="ProAdmin.html"><button class="home"><h2>Continue</h2></button</form>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>
