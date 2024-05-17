<%@page import="cruisebooking.dao.Cruise"%>
<%@page import="cruisebooking.dto.CruiseCrud"%>
<%@page import="cruisebooking.dao.CruiseStaff"%>
<%@page import="cruisebooking.dto.CruiseStaffCurd"%>
<%@page import="cruisebooking.dao.Admin"%>
<%@page import="java.util.List"%>
<%@page import="cruisebooking.dto.AdminCrud"%>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style type="text/css">
        .add-staff-heading {
            width: 90%;
            border-radius: 10px;
            background-color: #ADD8E6; /* Light blue background color */
            color: purple; /* Purple text color */
            padding: 5px; /* Add padding */
            font-size: 30px; /* Font size */
            text-align: center; /* Center align text */
            letter-spacing : 5px;
            font-weight: bolder;
            top: 0px;
            margin-left : 5%;     
        }
        .table-container {
            margin-top: 20px; /* Add margin at the top */
            padding: 20px; /* Add padding */
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            padding: 30px; /* Add padding to the table */
        }
        .table th, .table td {
            padding: 20px; /* Add padding to table cells */
            text-align: left;
            border: 1px solid #ddd; /* Add border to table cells */
        }
    </style>
  </head>
  <body>
  <%@ include file="navbar.jsp" %>
<div class="content">     
      
        <%CruiseCrud crud = new CruiseCrud();
	        List<Cruise> list = crud.getAllCruise();%>
        
        <h2 class="text-center mb-4 add-staff-heading">Dispaly All Cruise</h2>
        
	    <!-- Update  -->
	    
	    <%String message = (String) request.getAttribute("message");
		        if(message != null){
	        %>  
	        <div class="alert alert-success alert-dismissible fade show" role="alert">
		  <strong>Success!</strong> <%=message %>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<%} %>
		
		<!-- Delete  -->
		<%String delete = (String) request.getAttribute("delete");
		        if(delete != null){
	        %>  
	        <div class="alert alert-success alert-dismissible fade show" role="alert">
		  <strong>Success!</strong> <%=delete %>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<%} %>
        <div class="container table-container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">CruiseName</th>
                        <th scope="col">CruiseId</th>
                        <th scope="col">OwnerName</th>
                        <th scope="col">TotalCapacity</th>
                        <th scope="col" colspan="3">Operation</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(Cruise cruise : list) {
                  %>
                        <tr>
                            <th scope="row"><%= cruise.getId() %></th>
                            <td><%= cruise.getCruiseName() %></td>
                            <td><%= cruise.getCruiseId() %></td>
                            <td><%= cruise.getOwnerName() %></td>
                            <td><%= cruise.getTotalCapacity() %></td>
                            <!--  <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop<%= cruise.getId() %>">View</button></td>-->
                            <td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal<%= cruise.getId() %>">Update</button></td>
                            <td>
							    <form action="delete" method="post">
							        <input type="hidden" name="cruiseId" value="<%= cruise.getCruiseId() %>">
							        <button type="submit" class="btn btn-danger">Delete</button>
							    </form>
							</td>
                            
                                       
                        </tr>
                    
        </div>
        
        <!-- Modal 
		<div class="modal fade" id="staticBackdrop<%= cruise.getId() %>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Show Cruise Info</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="form-container">
		        <form action="process_form.php" method="post">
		            <div class="form-row">
		                <div>
		                    <label for="name" class="form-label">Name:</label>
		                    <input type="text" id="name" name="name" class="form-input" value="<%= cruise.getCruiseName() %>" readonly>
		                </div>
		                <div>
		                    <label for="id" class="form-label">ID:</label>
		                    <input type="text" id="id" name="id" class="form-input" required>
		                </div>
		            </div>
		            <div class="form-row">
		                <div>
		                    <label for="email" class="form-label">Email:</label>
		                    <input type="email" id="email" name="email" class="form-input" required>
		                </div>
		                <div>
		                    <!-- Add another field here if needed -->
		                <!--  </div>
		            </div>
		            <button type="submit">Submit</button>
		        </form>
		        </div>
		    
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        
		      </div>
		    </div>
		  </div>
		</div>-->
		
		
		<!-- Update Date -->
		
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal<%= cruise.getId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Update Cruise</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <form action="cruiseupdate" method="post">
	          <div class="form-group">
	            <label for="cruiseName">Cruise Name:</label>
	            <input type="text" class="form-control" name="cruiseName" value="<%=cruise.getCruiseName() %>" required>
	          </div>
	          <div class="form-row">
	            <div class="form-group col-md-6">
	              <label for="cruiseId">Cruise ID:</label>
	              <input type="text" class="form-control" name="cruiseId" value="<%= cruise.getCruiseId() %>" required readonly>
	            </div>
	            <div class="form-group col-md-6">
	              <label for="ownerName">Owner Name:</label>
	              <input type="text" class="form-control" name="ownerName" value="<%= cruise.getOwnerName() %>" required>
	            </div>
	          </div>
	          <div class="form-row">
	            <div class="form-group col-md-6">
	              <label for="size">Size:</label>
	              <input type="text" class="form-control" name="size" value="<%= cruise.getSize() %>" required>
	            </div>
	            <div class="form-group col-md-6">
	              <label for="speed">Speed:</label>
	              <input type="text" class="form-control" name="speed" value="<%= cruise.getSpeed() %>" required>
	            </div>
	          </div>
	          <div class="form-row">
	            <div class="form-group col-md-6">
	              <label for="passengerCapacity">Passenger Capacity:</label>
	              <input type="text" class="form-control" name="passengerCapacity" value="<%= cruise.getPassengerCapacity() %>" required>
	            </div>
	            <div class="form-group col-md-6">
	              <label for="baggageCapacity">Baggage Capacity:</label>
	              <input type="text" class="form-control" name="baggageCapacity" value="<%= cruise.getBaggageCapacity() %>" required>
	            </div>
	          </div>
	          <div class="form-row">
	            <div class="form-group col-md-6">
	              <label for="totalCapacity">Total Capacity:</label>
	              <input type="text" class="form-control" name="totalCapacity" value="<%= cruise.getTotalCapacity() %>" required>
	            </div>
	            <div class="form-group col-md-6">
	              <label for="joinDate">Join Date:</label>
	              <input type="date" class="form-control" name="joinDate" value="<%= cruise.getJoinDate() %>" required>
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="time">Time:</label>
	            <input type="time" class="form-control" name="time" value="<%= cruise.getTime() %>" required>
	          </div>
	          
        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button class="btn btn-primary">Save changes</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
		<%} %>  
                </tbody>
            </table>
    </div>
  
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
  </body>
</html>
