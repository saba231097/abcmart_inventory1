<%@page import="com.app.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-3">
<%!ArrayList<Product> products=new ArrayList(); %>
<%
	
	products.add(new Product(101,"ParleG",15,4.5d));
	products.add(new Product(102,"Lux",15,4.5d));
	products.add(new Product(103,"Switch",100,105.6d));
	products.add(new Product(104,"Surxl",2,25d));
	products.add(new Product(105,"purfume",150,4.5d));
%>
  <h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and horizontal dividers) to a table:</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Qty</th>
        <th>Price/Unit</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <%
      	for(int i=0;i<products.size();i++){
      	
      		out.println("<tr>");
      		out.println("<td>"+products.get(i).id+"</td>");
      		out.println("<td>"+products.get(i).name+"</td>");
      		out.println("<td>"+products.get(i).qty+"</td>");
      		out.println("<td>"+products.get(i).price_per_unit+"</td>");
      		out.println("</tr>");
      	}
      %>
      
    </tbody>
  </table>
</div>


</table>
</body>
</html>