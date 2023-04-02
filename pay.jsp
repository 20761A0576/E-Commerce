<%@ page import="java.sql.*"%>

<%

String itemname=(String)session.getAttribute("itemname");

try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Shesi@4570");
    PreparedStatement ps=con.prepareStatement("select * from Admin1 where ITEMNAME=? ");
    ps.setString(1,itemname);
    ResultSet rs=ps.executeQuery();
    
%>


<!DOCTYPE html> 
<html> 
	<head> 
	<style>
	body { 
	font-family: Verdana; 
	background-image: url("img.webp");
	font-weight: bold; 
    background-repeat: no-repeat;
    background-size: cover;
	} 
	.container { 
	height: 600px; 
	width: 600px;
	background: transparent; 
	box-shadow: 5px 5px 5px 5px rgb(64, 180, 243);
	top: 40%; 
	left: 50%; 
	position: absolute; 
	transform: translate(-50%, -50%);  
	border-bottom-left-radius: 180px; 
	border-top-right-radius: 150px; 
	} 
	.main-content { 
	height: 80px; 
	width:500px;
	margin: 0px 30px 20px;
	background: transparent; 
	box-shadow: 5px 5px 5px 5px rgb(64, 180, 243);
	border-bottom-left-radius: 90px; 
	border-bottom-right-radius: 80px; 
	} 
	.text { 
	text-align: center; 
	font-size: 300%;  
	color:rgb(53, 145, 243) ; 
	}
	.item { 
	color: black; 
	font-size: 20px;  
	font-weight: bolder; 
	} 
	.centre-content { 
	height: 100px;
	width:500px;
	margin: -10px 30px 20px; 
	color: rgb(53, 145, 243); 
	text-align: center; 
	font-size: 20px; 
	border-radius: 25px; 
	padding-top: 0.5px; 
	background: transparent; 
	box-shadow: 5px 5px 5px 5px rgb(64, 180, 243);
	} 
	.centre-content-h1 { 
	padding-top: 30px; 
	padding-bottom: 30px; 
	font-weight: normal; 
	}  
	.price { 
	font-size: 40px; 
	margin-left: 5px;
	bottom: 30px; 
	position: relative; 
	}  
	.pay-now-btn { 
	cursor: pointer; 
	color: black; 
	height: 50px; 
	width: 290px; 
    font-weight: bold; 
    font-size: medium;
	border: none; 
	margin: 5px 30px; 
	background: transparent; 
	box-shadow: 3px 3px 3px 3px rgb(64, 180, 243); 
	position: relative; 
	} 
	.card-details { 
	background: transparent; 
	box-shadow: 5px 5px 5px 5px rgb(64, 180, 243);
	color: black; 
	margin: 10px 30px; 
	padding: 20px; 
	}   
	.card-details p { 
	font-size: 15px; 
	}
	.card-details label { 
	font-size: 15px;
	line-height: 30px; 
	} 
	.submit-now-btn { 
	cursor: black; 
	color: black; 
	height: 40px; 
	width: 240px; 
	border: none; 
	margin: 5px 130px; 
	border-radius:10px;
	box-sizing:barder-box;
	background-color: rgb(242, 242, 9); 
	box-shadow: 5px 5px 5px 5px rgb(64, 180, 243); 
	}
	button:active{
        transform:translateY(10px);
    }
	input[type=text] {
	padding: 8px;
	background-color: white;
	box-shadow: 3px 3px 3px 3px rgb(64, 180, 243);
	color:black;
	font-size:14px;
    border-radius:10px;
	box-sizing:barder-box;
	border:1px solid #2222;
	baclground:#fsfsfs;
	}
    .number-field{
        background-color: white;
        padding: 8px;
	    box-shadow: 3px 3px 3px 3px rgb(64, 180, 243);
	    color:black;
	    font-size:14px;
        border-radius:10px;
	    box-sizing:barder-box;
	    border:1px solid #2222;
    }
	</style>
	</head> 
	<body> 
    <div class="container"> 
      <div class="main-content"> 
        <p class="text">PAYMENT</p> 
      </div> 
      <div class="centre-content"> <table><tr>
        <%if(rs.next()){ %>
        <td><h1 class="price"><%=rs.getString(3) %>|RS.<%=rs.getInt(4)%><span>/-</span></h1> </td>
        <%} %>
        <td><p class="item">Buy ITEMS !</p></td>
		</tr></table>
      </div> 
      <div class="last-content"> 
        <button type="button" class="pay-now-btn"> 
           Apply Coupons 
        </button> 
        <button type="button" class="pay-now-btn"> 
           Pay with Netbanking 
        </button> 
      </div> 
      <div class="card-details">
		<div class="card-number">
			<label>Card Holder NAME : </label>
			<input type="text" class="number-field" placeholder="Name" required /><br><br>
			<label> ADDRESS : </label>
			<input type="text" class="number-field" placeholder="Address" required /> 
		</div> 
        <p>Pay using Credit or Debit card</p> 
        <div class="card-number">
          <label> Card Number </label>
          <input type="number" class="number-field" placeholder="###-###-###" required /> 
        </div> 
        <br/> 
        <div class="date-number"> 
          <label> Expiry Date </label> 
          <input type="number" class="number-field" placeholder="DD-MM-YY" required  /> 
        </div> <br>
        <div class="cvv-number"> 
          <label> CVV number </label> 
          <input type="number" class="number-field" placeholder="xxx" required /> 
        </div> <br>
    	<form action="thank.html">
        <button type="submit" class="submit-now-btn">PAY</button> </form>
      </div> 
    </div> 
	</body> 
</html>
<% }catch(Exception e){
    out.print(e);
  }
%>