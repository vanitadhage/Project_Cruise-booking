<!doctype html>
<%@page import="cruisebooking.dto.CreateCruiseCrud"%>
<%@page import="cruisebooking.dao.CreateCruise"%>
<%@page import="java.util.List"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style>
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
        .info-pair {
        display: flex;
        justify-content: space-between;
	    }
	    .info-pair b {
	        margin-right: 10px;
	    }
	   /* Styles for the search container */
		.search-container {
		    position: relative;
		    display: inline-block;
		    margin-left: 38%;
		    margin-bottom: 10px;
		}
		
		/* Search input */
		#searchInput {
		    border-radius: 20px;
		    border: 2px solid transparent; /* Set border color transparent */
		    padding: 10px;
		    width: 80%; /* Set width to 60% */
		    transition: all 0.3s;
		    box-shadow: none;
		    margin-right: 5px;
		    border-color: black;
		}
		
		#searchInput:hover {
		    border-color: blue;
		    backgroud-color: blue;
		    box-shadow: 10px 5px 5px blue;
		}
		
		/* Search button */
		.search-btn {
		    background-color: transparent;
		    font-size: 10px;
		    width: 20px;
		    height: 20px;
		    border: none;
		    cursor: pointer;
		}
		.search-btn img{
		    top: 0;
		    width: 70px;
		    height: 70px;
		    border-radius: 30%;d
		}
		.search-btn img:hover{
		    width: 80px;
		    height: 80px;
		    transition: 0.5s;
		}
		
		/* Dropdown */
		.dropdown-content1 {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 200px;
		    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		    z-index: 1;
		}
		
		.dropdown-content1 select {
		    width: 100%;
		    padding: 10px;
		}
		
		.dropdown-content1.show {
		    display: block;
		}
	   
    </style>
     <script type="text/javascript">
     function toggleDropdown() {
    	    var dropdown = document.getElementById("searchDropdown");
    	    dropdown.classList.toggle("show");
    	}

    	function updateSearchInput() {
    	    var select = document.getElementById("searchSelect");
    	    var selectedOption = select.options[select.selectedIndex].text;
    	    document.getElementById("searchInput").value = selectedOption;
    	}

</script>
  </head>
  <body>
    <%@ include file="navbar.jsp" %>
    
    <%CreateCruiseCrud createCruiseCrud = new CreateCruiseCrud();
      List<CreateCruise> createCruises = createCruiseCrud.getAllCruiseInfo();
    %>
   
    <div class="container">
    
    <div class="content">
      <h2 class="text-center mb-4 add-staff-heading">Dispay Todyas Cruise</h2>
	      <div class="search-container">
	    <input type="text" id="searchInput" placeholder="Search..." onclick="toggleDropdown()">
	    <button class="search-btn" onclick="toggleDropdown()">
	        <img src="images/searchicon.jpg">
	    </button>
	    <div id="searchDropdown" class="dropdown-content1">
	        <select id="searchSelect" onchange="updateSearchInput()">
	           <option value="">Select an option</option>
	           <option value="PoiletId">PoiletId</option>
	           <option value="CruiseId">CruiseId</option>
	           <option value="Date">Date</option>
	           <option value="Location">Location</option>
	        </select>
	    </div>
	</div>
      

       
    
		<% int count = 0; %>
		<% for(CreateCruise createCruise : createCruises) { %>
		  <% if (count % 3 == 0) { %>
		    <div class="row">
		  <% } %>
		 <div class="col-md-4">
			    <div class="card mb-3">
			        <div class="card pt-3" style="width: 18rem;">
			            <img src="images/ship1.jpg" class="card-img-top" alt="...">
			            <div class="card-body" style="text-align: justify;">
			                <div class="info-pair">
			                    <b>Cruise Id :</b>
			                    <span><%=createCruise.getCruiseId() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>Poilet Id :</b>
			                    <span><%=createCruise.getPoiletId() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>From Location :</b>
			                    <span><%=createCruise.getFromLocation() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>To Location :</b>
			                    <span><%=createCruise.getToLocation() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>Date :</b>
			                    <span><%= createCruise.getDate() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>Time :</b>
			                    <span><%= createCruise.getTime() %></span>
			                </div>
			                <div class="info-pair">
			                    <b>Price :</b>
			                    <span><%= createCruise.getPrice() %></span>
			                </div>
			                <a href="#" class="btn btn-primary">Delete</a>
			            </div>
			        </div>
			    </div>
			</div>
					 
		  
		  
		  <% count++; %>
		  <% if (count % 3 == 0 || count == createCruises.size()) { %>
		    </div> 
		  <% } %>
		<% } %>
		
    </div>
    
    
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