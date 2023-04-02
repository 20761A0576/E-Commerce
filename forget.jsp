<%@ page import="java.sql.*"%>

<%

String mb=request.getParameter("mobile");
String npass=request.getParameter("npass");
String cpass=request.getParameter("cpass");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("update Regis set PASSWORD=? , CONFORMPASSWORD=? where PHONENUMBER=? ");
    ps.setString(1,npass);
    ps.setString(2,cpass);
    ps.setString(3,mb);
    ResultSet x=ps.executeQuery();
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
        <% if(x.next()){ %>
            <h1>Your password Sucessfully Updated....</h1>
            <form action="login.html"><button class="home"><h2>Continue</h2></button</form>
        <% }else{ %>
            <h1>Your password Not Sucessfully Updated....</h1>
            <h3>Something went wrong...</h3>
            <form action="forget.html"><button class="home"><h2>Continue</h2></button</form>
        <% } %>
		
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>