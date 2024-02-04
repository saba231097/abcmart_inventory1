<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>ABC Inventory Management System</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    </head>
<body>
	<%
		if(session.getAttribute("user")==null){
			response.sendRedirect("index.jsp");
		}

	%>
    <nav class="navbar navbar-nav navbar-expand-sm" style="background-color: #AED6F1; color:white">
        <div class="container-fluid">
          
            <div class="row">
                <img src="resources/images/DP.jpg" class="rounded-circle" style="width: 80px;"
  alt="Avatar" /> 
  <h4><%= session.getAttribute("user") %></h4>
            </div>
        
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse align-items-center justify-content-center" id="collapsibleNavbar" >
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#">DASHBOARD</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">ADD INVENTORY</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">UPDATE INVENTORY</a>
              </li>  
              <li class="nav-item">
                <a class="nav-link" href="#">DELETE INVENTOPRY</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">GENERATE REPORTS</a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="#">
                <form action="logout" method="post">
                	<input type="submit" value="Logout">
                </form>
                </a>
              </li>    
            </ul>
          </div>
        </div>
      </nav>
</body>
</html>