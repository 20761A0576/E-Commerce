<%@ page import="java.sql.*"%>

<%

String userid=(String)session.getAttribute("userid");
String npass=(String)session.getAttribute("npass");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Regis where userid=? and password=? ");
    ps.setString(1,userid);
    ps.setString(2,npass);
    ResultSet x=ps.executeQuery();
    
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
	padding: 10px 25px;
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
	letter-spacing:2px;
	}
	.but1 button{
	background-color: red;
	color: white;
	padding: 10px 75px;
	margin: 7px 5px;
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
  .home{
			background-color:red;
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
			margin:5% 0% 0% 30%;
			color:green;
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
    width: 35px;
    margin-left: 1250px;
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
  .add{
    
  }
</style>
</head>
<body>
	<div class="back">
		<div class="pt"><i>EAT FRESH</i></div>
    <table>
      <th><div class="flex">
        <button style=" background-color: #00BFFF; border: #00BFFF;" onclick="document.getElementById('id01').style.display='block'">
          <img src="imag.png" class="avatar"></button>
          </div>  
          <div id="id01" class="modaldiv">
            <div class="imgcontainer1"><br>
              <img src="imag.png" class="avatar"> 
              <% if(x.next()) { %>
              <h3><%=x.getString(3)%><%=x.getString(1)%><%=x.getString(2)%></h3><hr>
              <h3><%=x.getString(6)%></h3><hr>
              <h3><%=x.getString(4)%></h3><hr>
              <h3><%=x.getString(5)%></h3><hr>
              <h3><a href="login.html"><button class="inner">LOGOUT</button></a></h3>
            </div>
          </div>
      </div></th>
    <td><div class="pt1"><i>WELCOME <%=x.getString(1)%><%=x.getString(2)%></i></div></td>
  </table>
	</div>
<div class="topnav">
  <a class="active" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home</a>
  <a href="vegitables.html">VEGITABLES</a> 
  <a href="fruits.html">FRUITS</a>
  <a href="dryfruit.html">DRY FRUITS</a>
  <a href="about.html">ABOUT US</a>
  <form class="but1" style="float:right" action="register.html"><button>Sign UP</button></form>
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
  <img src="add.jpg" style="width: 100%; height: 400px; padding-left: 50px; padding-right:50px;">
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
<script>
  var modal = document.getElementById('id01');
    window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    } 
  }
</script> 
<% } else { %>
  <script>
    location.replace("fd-project.html");
  </script>
<% } %>


</body>
</html>
<% }catch(Exception e){
    out.print(e);
  }
%>