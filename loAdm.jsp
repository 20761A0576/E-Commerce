<%@ page import="java.sql.*"%>

<%

String userid=request.getParameter("uname");
String npass=request.getParameter("pass");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Adminadmin where ADMINID=? and PASSWORD=? ");
    ps.setString(1,userid);
    ps.setString(2,npass);
    ResultSet x=ps.executeQuery();
    
%>
<html>
	<body>
		<% if(x.next()){ %>
            <script>
                window.alert("Login Successfully Completed");
                location.replace("ProAdmin.html");
            </script>
        <% }else{ %>
            <script>
                window.alert("Invalid Userid and Password");
                location.replace("loAdm.html");
            </script>
            
        <% } %>
		
	</body>
</html>

<% }catch(Exception e){
    out.print(e);
  }
%>