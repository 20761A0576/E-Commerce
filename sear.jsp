<%@ page import="java.sql.*"%>

<%
String itemname=request.getParameter("search");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Admin where ITEMNAME=? ");
    ps.setString(1,itemname);
    int x=ps.executeUpdate();
    if(x!=0){
        out.println(" ITEM NAME :"+itemname); 
        Statement smt=con.createStatement();
        int result=smt.executeUpdate("select quantity from Admin where ITEMNAME=itemname ");  
        out.println("|| QUANTITY :"+result);  
        int re=smt.executeUpdate("select price from Admin where ITEMNAME=itemname ");  
        out.println("|| PRICE :"+re);
        

    }else{
        out.println("This Item Is Not Avalable At A Time....");
    }
        

}catch(Exception e){
    out.print(e);
}
%>