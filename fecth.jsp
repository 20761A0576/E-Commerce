<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
 
String sql="select * from emp";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
<body bgcolor="pink">
<center>
<h1>Welcome</h1>
<h1>Welcome to Student Details</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="5" align="center">EMP Details</th></tr>

<tr>
<td>Employee id</td>
<td>Name</td>
<td>Designation</td>
<td>Subject1</td>
<td>Subject2</td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
</tr>
<%
}
%>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>