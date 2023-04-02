<%@ page import="java.sql.*"%>

<%

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Regis where USERID=");
    ResultSet rs=ps.executeQuery();
    
%>
<!DOCTYPE html>
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
	padding: 20px 23px;
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
	padding:50px;
	font-variant:small-caps;
	font-size:100px;
	font-family:fantasy;
	letter-spacing:20px;
	}
    .pt1{
	text-align:right;
	color:green;
	padding:0px;
	font-size:20px;
	font-family:fantasy;
	letter-spacing:5px;
	}
	.but1 button{
	background-color: red;
	color: white;
	padding: 20px 25px;
	margin: 0px 5px;
	font-size:14px;
    border-radius:10px;
	box-sizing:barder-box;
	border:1px solid #2222;
	baclground:#fsfsfs;
	}
  .sea {
    padding: 7px 8px;
    margin-top: 7px;
  }
		  
</style>
</head>
<body>
	<div class="back">
		<div class="pt"><i>EAT FRESH ITEM</i></div>
        <%
        while(rs.next())
        {
        %>
        <div class="pt1">WELCOME TO <%=rs.getString(1)%> <%=rs.getString(2)%></div>
        <% } %>
	</div>
<div class="topnav">
  <a class="active" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home</a>
  <a href="vegitables.html">VEGITABLES</a> 
  <a href="fruits.html">FRUITS</a>
  <a href="dryfruit.html">DRY FRUITS</a>
  <a href="about.html">ABOUT US</a>
  <form class="but" style="float:right" action="login.html"><button>LOG OUT</button></form>
  <form class="but1" style="float:right" action="register.html"><button>Sign UP</button></form>
  <div class="search-container">
    <form action="search.jsp">
		<table>
		<tr>
			<td> <input type="text" placeholder="Search.." name="search"></td>
			<td> <input type="submit" value="S" class="sea"></td>
		</tr>
		</table>
    </form>
  </div>
</div>

<div class="row">
  <div class="column">
    <div class="card">
      <img src="allveg.jpg" style="width: 75%;height: 75%;">
      <h3>VEGITABLES</h3>
      <p class="price">Rs.799</p>
	  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
	  <p><a href="pay.html"><button>BUY NOW</button></a></p>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="alldry.jpg" style="width: 75%;height: 75%;">
  <h3>DRY FRUITS</h3>
  <p class="price">Rs.4999</p>
  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
  <p><button>BUY NOW</button></p>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="allfruits.jpg" style="width: 75%;height: 75%;">
      <h3>FRUITS</h3>
      <p class="price">Rs.1999</p>
	  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
      <p><a href="pay.html"><button>BUY NOW</button></a></p>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="allvegg.jpg" style="width: 75%;height: 75%;">
      <h3>VEGITABLES</h3>
      <p class="price">Rs.699</p>
	  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
      <p><a href="pay.html"><button>BUY NOW</button></a></p>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="alldryf.jpg" style="width: 75%;height: 75%;">
      <h3>DRY FRUITS</h3>
      <p class="price">Rs.4599</p>
	  <label><h3>Quantity:</label><select><option> 1</option><option> 2</option><option >3</option></select></h3>
      <p><a href="pay.html"><button>BUY NOW</button></a></p>
    </div>
  </div>
</div>




</body>
</html>

<% }catch(Exception e){
    out.print(e);
  }
%>