<%@ page import="java.sql.*"%>


<%
String empid=request.getParameter("empid");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("delete from Employee where EMPLOYEEID=?");
    ps.setString(1,empid);
 
    int x=ps.executeUpdate();
    
%>
<html>
	<head>
		<title>successful</title>
		<style>
			body{
			background-image:url("tick.gif");
			background-repeat:no-repeat;
			background-size:400px 250px;
			background-position:550px 30px;
			}
			
			.home{
			background-color:green;
			margin:5% 0% 0% 38%;
			position:absolute;
			padding: 0px 100px;
			font-size:14px;
			border-radius:40px;
			box-sizing:barder-box;
			border:1px solid #2222;
			baclground:#fsfsfs;
			}
			h1{
			margin:25% 0% 0% 30%;
			color:green;
			}
			h3{
			color:white;
			}
		</style>
	</head>
	<body>
        <% if(x!=0){ %>
            <h1>Your account Sucessfully Deleted....</h1>
            <form action="ProAdmin.html"><button class="home"><h2>Continue</h2></button</form>
        <% }else{ %>
            <h1>Your account Not Sucessfully Deleted....</h1>
            <h3>Something went wrong...</h3>
            <form action="Empdel.html"><button class="home"><h2>Continue</h2></button</form>
        <% } %>
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>