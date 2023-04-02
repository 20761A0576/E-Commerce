<%@ page import="java.sql.*"%>


<%
String tid=request.getParameter("itemid");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("delete from Admin1 where ITEMID=?");
    ps.setString(1,tid);
 
    int x=ps.executeUpdate();
    
%>
<html>
	<body>
        <% if(x!=0){ %>
			<script>
				window.alert("Item Sucessfully Deleted....");
				location.replace("ProAdmin.html");
			</script>
        <% }else{ %>
			<script>
				window.alert("Item Not Sucessfully Deleted....");
				window.alert("Something went wrong...");
				location.replace("delAd.html");
			</script>
        <% } %>
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>