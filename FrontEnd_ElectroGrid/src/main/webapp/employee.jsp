<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="model.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ElectroGrid Employee</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/NewEmp.js"></script>
</head>
<body>

		<nav class="navbar navbar-dark bg-dark justify-content-between">
		  <a class="navbar-brand">ElectroGrid</a>
		
		</nav>
		
		
		<div class="card bg-dark text-white">
		  <img class="card-img" src="Images/employee.jpg" alt="Card image">
		  <div class="card-img-overlay">
		    <h5 class="card-title">Employee Registration</h5>
		    <div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
		    <div class="container"><div class="row"><div class="col-6">
		    	<form id="formItem" name="formItem">
		<br><br>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
		  </div>
		  <input id="name"  name="name" type="text" class="form-control" aria-label="Name" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="row">
		
		<div class="col-6">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">NIC</span>
			  </div>
			  <input id="nic"  name="nic" type="text" class="form-control" aria-label="NIC" aria-describedby="inputGroup-sizing-default">
			</div>
		</div>
		<div class="col-6">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">DOB</span>
			  </div>
			  <input id="dob" name="dob" type="date" class="form-control" aria-label="DOB" aria-describedby="inputGroup-sizing-default">
			</div>
		</div>
		
		</div>

		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Address</span>
		  </div>
		  <input id="address" name="address" type="text" class="form-control" aria-label="Address" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Phone</span>
		  </div>
		  <input id="phone" name="phone" type="number" class="form-control" aria-label="Phone" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="row">
		
		<div class="col-6">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">Position</span>
			  </div>
			  <input id="position" name="position" type="text" class="form-control" aria-label="Position" aria-describedby="inputGroup-sizing-default">
			</div>
		</div>
		<div class="col-6">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">Approved Salary</span>
			  </div>
			  <input id="salary" name="salary" type="number" class="form-control" aria-label="Salary" aria-describedby="inputGroup-sizing-default">
			</div>
		</div>
		
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">Branch</label>
		    <input id="sBranch" type="text" class="input-group-text" aria-label="sBranch" aria-describedby="inputGroup-sizing-default" disabled>
		 	&nbsp &nbsp
		  </div>
		  <select class="custom-select" name="branch" id="select">
		    <option selected>Choose...</option>
		    <option value="Colombo">Colombo</option>
		    <option value="Kandy">Kandy</option>
		    <option value="Galle">Galle</option>
		    <option value="Jaffna">Jaffna</option>
		    <option value="Polonaruwa">Polonaruwa</option>
		  </select>
		</div>
		 <br>
		 <input id="btnSub" name="btnSub" type="button" value="Submit"
		 class="btn btn-primary">
		 <input type="hidden" id="hidempID"
		 name="hidempID" value="">
		</form>
		    </div>
		    
		    
		    <div class="col-2">
		   
		    </div>
		    
		    
		    
		    </div></div>
		  </div>
		</div>
	
		
<br>

		<div id="divItemsGrid">
		 <%
									 Employee emp = new Employee();
									 out.print(emp.readEmp());
		%>
		
</div> </div> </div>

</body>
</html>