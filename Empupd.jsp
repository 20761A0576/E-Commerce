<%@ page import="java.sql.*"%>

<%
String empid=request.getParameter("empid");
String name=request.getParameter("name");
String des=request.getParameter("des");
Integer salary=Integer.parseInt(request.getParameter("salary"));
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("update Employee set NAME=?,DESIGNATION=?,SALARY=?,EMAIL=?,PHONENUMBER=? where EMPLOYEEID=?");
    ps.setString(1,name);
    ps.setString(2,des);
    ps.setInt(3,salary);
    ps.setString(4,email);
    ps.setString(5,mobile);
    ps.setString(6,empid);
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
			h2{
			color:white;
			}
            h3{
                margin:5% 0% 0% 35%;
                color:black;
            }
		</style>
	</head>
	<body>
		<% if(x!=0){ %>
            <h1>Update Sucessfully Completed....</h1>
            <form action="ProAdmin.html"><button class="home"><h2>Continue</h2></button</form>
        <% }else{ %>
            <h1>Update not Sucessfully Completed....</h1>
            <h3>ITEM ID are InValid</h3>
            <form action="Empupd.html"><button class="home"><h2>Continue</h2></button</form>
        <% } %>
		
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>