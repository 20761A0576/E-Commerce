<%@ page import="java.sql.*"%>


<%
String phone=request.getParameter("phone");
String pass=request.getParameter("pass");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("delete from Regis where PHONENUMBER=? AND PASSWORD=?");
    ps.setString(1,phone);
    ps.setString(2,pass);
 
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
			<script>
				window.alert("Your account Sucessfully Deleted....");
				location.replace("register.html");
			</script>
        <% }else{ %>
			<script>
				window.alert("Your account Not Sucessfully Deleted....");
				window.alert("Something went wrong...");
				location.replace("delete.html");
			</script>
        <% } %>
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>