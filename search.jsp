<%@ page import="java.sql.*"%>

<%
String userid=(String)session.getAttribute("userid");
String itemname=request.getParameter("search");
session.setAttribute("itemname",itemname);
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Admin1 where ITEMNAME=? ");
    ps.setString(1,itemname);
    ResultSet rs=ps.executeQuery();
	PreparedStatement ps1=con.prepareStatement("select * from Regis where userid=?");
    ps1.setString(1,userid);
	ResultSet rs1=ps1.executeQuery();
    %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="aboutstyles.css">
<style>
.but button{
	background-color: red;
	color: white;
	padding: 10px 23px;
	margin: 0px 0px;
	font-size:15px;
    border-radius:10px;
	box-sizing:barder-box;
	border:1px solid #2222;
	baclground:#fsfsfs;
	}
.back{
	background-color:#00BFFF;
	background-attachment:fixed;
	background-position:center;
	background-repeat:no-repeat;
	background-size:cover;
			  
	}
		  
	.pt{
	text-align:center;
	color:green;
	padding:5px;
	font-variant:small-caps;
	font-size:50px;
	font-family:fantasy;
	letter-spacing:10px;
	}
  .pt1{
	text-align:right;
	color:green;
	padding:0px;
	font-size:20px;
	font-family:fantasy;
	letter-spacing:5px;
	}

  .sea {
    padding: 7px 8px;
    margin-top: 7px;
  }
  .flex-div{
    display: flex;
    align-items: center;
}
.flex-div{

    align-items: flex-start;
    margin-top: 2px;
}

.flex-div img{
    width: 40px;
    margin-left:1200px;
    border-radius: 50%;
}
.flex{
  margin-left: 1150px;
  background-color: #def0f6;
}
.modaldiv {
  display: none; 
  position: fixed; 
  z-index: 1;
  left: 0;
  top: 0;
  width: 20%; 
  height: 380px; 
  overflow: hidden; 
  border: 2px solid #888;
  background-color: rgb(89, 238, 121);
  margin-top: 7%;
  margin-left: 75%;
  margin-right: 50%;
  border-radius: 20px;
  }
  .avatar{
    height: 30px;
    width: 30px;
    border-radius: 20px;
  }		
  .inner{
  	background-color: red;
	color: white;
	padding: 10px 25px;
	margin: 0px 0px;
	font-size:15px;
  	border-radius:10px;
	box-sizing:barder-box;
	border:1px solid #2222;
	baclground:#fsfsfs;
  } 		  
</style>
</head>
<body>
	<div class="back">
		<div class="pt"><i>EAT FRESH ITEM</i></div>
		<table>
			<th><div class="flex">
			  <button style=" background-color: #00BFFF; border: #00BFFF;" onclick="document.getElementById('id01').style.display='block'">
				<img src="imag.png" class="avatar"></button>
				</div>  
				<div id="id01" class="modaldiv">
				  <div class="imgcontainer1"><br>
					<img src="imag.png" class="avatar"> 
					<% if(rs1.next()) { %>
					<h3><%=rs1.getString(3)%><%=rs1.getString(1)%><%=rs1.getString(2)%></h3><hr>
					<h3><%=rs1.getString(6)%></h3><hr>
					<h3><%=rs1.getString(4)%></h3><hr>
					<h3><%=rs1.getString(5)%></h3><hr>
					<h3><a href="login.html"><button class="inner">LOGOUT</button></a></h3>
				  </div>
				</div>
			</div></th>
		  <td><div class="pt1"><i>WELCOME <%=rs1.getString(1)%><%=rs1.getString(2)%></i></div></td>
		  <% } %>
		</table>
	</div>
<div class="topnav">
  <a class="active" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home</a>
  <a href="vegitables.html">VEGITABLES</a> 
  <a href="fruits.html">FRUITS</a>
  <a href="dryfruit.html">DRY FRUITS</a>
  <a href="about.html">ABOUT US</a>
  <form class="but" style="float:right" action="login.html"><button>Sign in</button></form>
  <form class="but" style="float:right" action="register.html"><button>Sign UP</button></form>
  <div class="search-container">
    <form action="search.jsp">
		<table>
		<tr>
			<td> <input type="text" placeholder="Search.." name="search"></td>
			<td> <button type="submit"><i class="fa fa-search"></i></button></td>
		</tr>
		</table>
    </form>
  </div>
</div>
<div class="add";">
	<img src="add1.jpg" style="width: 100%; height: 400px; padding-left: 50px; padding-right:50px;">
  </div>
<div class="row">
  <div class="column">
    <div class="card">
	  <% if(rs.next()){ %>
      <img src=<%=rs.getString(1) %> style="width: 75%;height: 75%;">
      <h3><%=rs.getString(3) %></h3>
      <p class="price">Rs.<%=rs.getInt(4)%></p>
	  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
	  <p><a href="pay.jsp"><button>BUY NOW</button></a></p>
    </div>
</div>
  
</div>
<script>
	var modal = document.getElementById('id01');
	  window.onclick = function(event) {
	  if (event.target == modal) {
		modal.style.display = "none";
	  } 
	}
  </script>
<%} else { %>
	<script>
	window.alert("This Item Is Not Avalable At A Time....");
	location.replace("ok.jsp");
	</script>
<% } %>


</body>
</html>

<%
}catch(Exception e){
    out.print(e);
}
%>