<%@ page import="java.sql.*"%>

<%
String img=request.getParameter("img");
String itemid=request.getParameter("itemid");
String itemname=request.getParameter("itemname");
Integer price=Integer.parseInt(request.getParameter("price"));
Integer quan=Integer.parseInt(request.getParameter("quan"));
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("insert into Admin1 values(?,?,?,?,?)");
    ps.setString(1,img);
    ps.setString(2,itemid);
    ps.setString(3,itemname);
    ps.setInt(4,price);
    ps.setInt(5,quan);
 
    int x=ps.executeUpdate();

%>
        <html>
            <body>
                <script>
                    <% if(x!=0){ %>
                        window.alert("Registration Sucessfully Completed....");
		                location.replace("ProAdmin.html");
                    <% }else{ %>
                        window.alert("Registration not Sucessfully Completed....");
                        window.alert("Something went wrong...");
		                location.replace("admin.html");
                    <% } %>
            </script>
        </body>
    </html>
        

<% } catch(Exception e){
    out.print(e);
}
%>