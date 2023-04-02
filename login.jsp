<%
//Read values from the myfood.html form
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
//print
out.println("Hello"+uname);
out.println("Thank you for your order");
out.println("We provide"+foodname);
out.println("Discount on"+qu);
%>