<%@ page import="java.sql.*"%>

<%
String itemid=request.getParameter("itemid");
String itemname=request.getParameter("itemname");
Integer price=Integer.parseInt(request.getParameter("price"));
Integer quan=Integer.parseInt(request.getParameter("quan"));
String img = "tomato.jpg";
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("insert into Employee values(?,?,?,?,?)");
    ps.setString(1,itemid);
    ps.setString(2,itemname);
    ps.setInt(3,price);
    ps.setInt(4,quan);
    File file = new File(img);
    FileInputStream stream = new FileInputStream(file);
    pstatement.setBinaryStream(5, stream);
 
    int x=ps.executeUpdate();
    if(x!=0){
        out.print("Registration Sucessfully Completed....");
    }else{
        out.println("Registration not Sucessfully Completed....");
        out.print("Something went wrong...");
    }
        

}catch(Exception e){
    out.print(e);
}
%>