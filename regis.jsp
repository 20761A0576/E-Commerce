<%@ page import="java.sql.*"%>

<%
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String userid=request.getParameter("userid");
String npass=request.getParameter("npass");
String cpass=request.getParameter("cpass");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
	PreparedStatement ps=con.prepareStatement("select * from Regis");
	ResultSet rs=ps.executeQuery();
	rs.next();
	
%>
    <html>
	<head>
		<title>successful</title>
	</head>
	<body>
		<% if(rs.getString(6).equals(userid)){ %>
			<script>
				window.alert("Your Account Already Created....");
				location.replace("register.html");
			</script>
		<% }else{ 
	
		ps=con.prepareStatement("insert into Regis values(?,?,?,?,?,?,?,?)");
		ps.setString(1,fname);
		ps.setString(2,mname);
		ps.setString(3,lname);
		ps.setString(4,email);
		ps.setString(5,mobile);
		ps.setString(6,userid);
		ps.setString(7,npass);
		ps.setString(8,cpass);
		int x=ps.executeUpdate(); 
     	if(x!=0){ %>
			<script>
				window.alert("Registration Sucessfully Completed....");
				window.alert("Congratulations, your account has been successfully created");
				location.replace("login.html");
			</script>
        <% }else{ %>
			<script>
				window.alert("Registration not Sucessfully Completed....");
				window.alert("Something went wrong...");
				location.replace("register.html");
			</script>
        <% } 
		} %>
	</body>
</html>
    
        
<%
}catch(Exception e){
    out.print(e);
}
%>