
<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
 
String sql="select * from Admin1";
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
<h1>ITEM</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="5" align="center">ITEM Details</th></tr>

<tr>
<td>Image File</td>
<td>Item Id</td>
<td>Item Name</td>
<td>Price</td>
<td>Quantity</td>
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
<td><%=rs.getInt(5)%></td>
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
