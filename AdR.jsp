<%@ page import="java.sql.*"%>

<%
String id=request.getParameter("empid");
String name=request.getParameter("name");
String des=request.getParameter("des");
Integer salary=Integer.parseInt(request.getParameter("salary"));
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("insert into Employee values(?,?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,name);
    ps.setString(3,des);
    ps.setInt(4,salary);
    ps.setString(5,email);
    ps.setString(6,mobile);
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
			margin:20% 0% 0% 35%;
			color:green;
			}
			h2{
			color:white;
			}
			h3{
			margin:5% 0% 0% 35%;
			}
		</style>
	</head>
	<body>
        <% if(x!=0){ %>
            <h1>Registration Sucessfully Completed....</h1>
            <h3>Congratulations, your account has been successfully created</h3>
            <form action="ProAdmin.html"><button class="home"><h2>Continue</h2></button</form>
        <% }else{ %>
            <h1>Registration not Sucessfully Completed....</h1>
            <h3>Something went wrong...</h3>
            <form action="EmpRegis.html"><button class="home"><h2>Continue</h2></button</form>
        <% } %>
	</body>
</html>
    
        
<%
}catch(Exception e){
    out.print(e);
}
%>