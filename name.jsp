<%@ page import="java.sql.*"%>

<%


try{
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
}catch(Exception e){
    out.print(e);
}
%>