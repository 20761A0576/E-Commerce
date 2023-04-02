<%@ page import="java.sql.*"%>

<%

String userid=request.getParameter("uname");
session.setAttribute("userid",userid);
String npass=request.getParameter("pass");
session.setAttribute("npass",npass);


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Regis where userid=? and password=? ");
    ps.setString(1,userid);
    ps.setString(2,npass);
    ResultSet x=ps.executeQuery();
    
%>
<html>
	<body>
		<% if(x.next()){ %>
        <script>
				window.alert("Login Successfully Completed");
				location.replace("ok.jsp");
			</script>
        <% }else{ %>
          <script>
				window.alert("Invalid Userid and Password");
				location.replace("login.html");
			</script>
        <% } %>
		
	</body>
</html>


<% }catch(Exception e){
    out.print(e);
  }
%>