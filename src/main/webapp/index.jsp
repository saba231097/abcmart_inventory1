<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ABC Inventory Management System</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <img src="resources/images/loginscreen.jpeg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <div class="card shadow p-4">
                <h3 class="text-center">ABC MART</h3>
                <h4 class="text-center">Welcome Back</h4>
                <form action="authUser" method="post">
                	<%
                		if(session.getAttribute("loginStatusMSG")!=null){
                			out.println("<h1>"+session.getAttribute("loginStatusMSG")+"</h1>");
                		}
                	%>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="secrets" placeholder="********" required>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember">
                        <label class="form-check-label" for="remember">Remember me</label>
                    </div>
                    <div class="mb-3 d-grid">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                    <div class="mb-3 text-center">
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
