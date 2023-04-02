<%@ page import="java.sql.*"%>

<%
String img=request.getParameter("img");
String itemid=request.getParameter("itemid");
Integer price=Integer.parseInt(request.getParameter("price"));
Integer quan=Integer.parseInt(request.getParameter("quan"));
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("update Admin1 set IMAGEFILE=?, PRICE=? , QUANTITY=? where ITEMID=?");
    ps.setString(4,itemid);
    ps.setInt(2,price);
    ps.setInt(3,quan);
    ps.setString(1,img);
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
            <form action="AdItem.jsp"><button class="home"><h2>Continue</h2></button</form>
        <% }else{ %>
            <h1>Update not Sucessfully Completed....</h1>
            <h3>ITEM ID are InValid</h3>
            <form action="Admin.html"><button class="home"><h2>Continue</h2></button</form>
        <% } %>
		
	</body>
</html>
        
<%
}catch(Exception e){
    out.print(e);
}
%>