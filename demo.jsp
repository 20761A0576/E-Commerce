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
	Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");  

}catch(Exception e){
	out.print(e);
	
}
%>
