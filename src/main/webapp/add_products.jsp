<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>


<script>

$(document).ready(function(){




  $("#loginBtn").click(function(){

    var json = [];
$('#productTable').find('tr').each(function() {
    var obj = {};
    var $td = $(this).find('td');
    obj['pn'] = $td.eq(0).text();
    obj['bn'] = $td.eq(1).text();
    obj['cat'] = $td.eq(2).text();
    json.push(obj);
});
console.log(json);
  $.post("http://localhost:8080/abcinventory/addPro",
  {
      data:json
  },
  function(data, status){
    data=data.trim();
     if(data=="Success"){

       window.location.href = "admin_home.jsp"
     }else{
       document.getElementById("errLoginMsg").style.display="block";
       document.getElementById("spinner").style.display="none";
         document.getElementById("loginBtnTxt").style.display="block";

     }
  });
  
});
    
    $("#addProduct").click(function(){
        var pn=$("#pn").val();
        var bn=$("#bn").val();
        var cat=$("#cat").val();
        var ed=$("#ed").val();
        var qty=$("#qty").val();
        var cp=$("#cp").val();
        var sp=$("#sp").val();
        var count=$("#productTable").length+1
       var dynamicRow="<tr data><td id=\"pn\">" + pn + "</td><td>" +bn+"</td><td>"+cat+"</td><td>"+ed+"</td><td>"+qty+"</td><td>"+cp+"</td><td>"+
        sp+"</td><td><button class='btn btn-danger btn-lg btn-delete mr-3' type='button'>Delete</button><button class='btn btn-info btn-lg btn-edit' type='button'>Edit</button><button class='btn btn-info btn-lg btn-update' type='button' style='display:none'>Update</button></td><td></tr>";
       
      
       $("#productTable tbody").append(dynamicRow)

    });
    
    $('body').on('click','.btn-delete',function() {
      $(this).parents('tr').remove();
    });

    $('body').on('click','.btn-edit',function() {
      
      var pn=$(this).parents('tr').find('td:eq(0)').text();
      var bn=$(this).parents('tr').find('td:eq(1)').text();

     
      $(this).parents('tr').find('td:eq(0)').html("<input name='edit_text' value='"+pn+"'>");
      $(this).parents('tr').find('td:eq(1)').html("<input name='edit_bn' value='"+bn+"'>");
      $(this).parents('tr').find('td:eq(7)').html("<button class='btn btn-danger btn-lg btn-delete mr-3' type='button'>Delete</button><button class='btn btn-info btn-lg btn-edit' type='button' style='display:none'>Edit</button><button class='btn btn-info btn-lg btn-update' type='button' style='display:block'>Update</button>");
      
    });

    $('body').on('click','.btn-update',function() {
      var name=$(this).parents('tr').find("input[name='edit_text']").val();
      var bn=$(this).parents('tr').find("input[name='edit_bn']").val();
      $(this).parents('tr').find('td:eq(0)').text(name);
      $(this).parents('tr').find('td:eq(1)').text(bn);
     
      $(this).parents('tr').find('td:eq(7)').html("<button class='btn btn-danger btn-lg btn-delete mr-3' type='button'>Delete</button><button class='btn btn-info btn-lg btn-edit' type='button' style='display:block'>Edit</button><button class='btn btn-info btn-lg btn-update' type='button' style='display:none'>Update</button>");
      
    });


    $("#addToInventory").click(function(){
      var jsonData=[];
      $('#productTable tr:gt(0)').each(function(){
        var obj={};
          var $td=$(this).find('td');
          obj['productName']=$td.eq(0).text().trim();
          obj['batchNumber']=$td.eq(1).text();
          obj['category']=$td.eq(2).text();
          obj['expiryDate']=$td.eq(3).text();
          obj['qty']=$td.eq(4).text();
          obj['costPrice']=$td.eq(5).text();
          obj['salePrice']=$td.eq(6).text();
          jsonData.push(obj);
      });
      console.log(JSON.stringify(jsonData));
      $.post("http://localhost:8080/abcinventory/addProducts",
                {
                    data:JSON.stringify(jsonData)
                },
                function(data, status){
                	alert(status);
                });
    });
    
});
</script>
</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img class="img-circle" src="resources/images/DP.jpg" width="50" height="50"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
        <li><a href="#">Add Products</a></li>
        <li><a href="#">Update Products</a></li>
        <li><a href="#">List Products</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2><img class="img-circle" src="resources/images/DP.jpg" width="50" height="50"></h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Dashboard</a></li>
        <li><a href="#section2">Add Products</a></li>
        <li><a href="#section3">Update Products</a></li>
        <li><a href="#section3">List Products</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="row">
        <div class="col-sm-12">
          
            <form>
                <input type="text" class="form-control" placeholder="Product Name" id="pn" style="width: 20%;float: left;">
                <input type="text" class="form-control" placeholder="batch No" id="bn" style="width: 20%;float: left;">
                <select class="form-control form-select" placeholder="Category" id="cat" style="width: 20%;">
                    <option>Cosmetics</option>
                    <option>Grooming</option>
                    <option>Cookies</option>
                    <option>Grocery</option>
                    </select>
                <br/>
                <input type="date" class="form-control" placeholder="Expiry Date" id="ed" style="width: 20%;float: left;">
                <input type="text" class="form-control" placeholder="qty" id="qty" style="width: 20%;float: left;">
                <input type="text" class="form-control" placeholder="Cp Per unit" id="cp" style="width: 20%;">
                <br/>
                <input type="text" class="form-control" placeholder="Sp Per Unit" id="sp" style="width: 20%;float: left;">
                <button type="button" id="addProduct" class="btn btn-primary" >Add Product</button>
                <button type="button" id="addToInventory" class="btn btn-primary" >Add To Inventory</button>
            </form>
            <table class="table data-table" id="productTable">
                <thead>
                  <tr>
                    <th>Product Name</th>
                    <th>Batch No.</th>
                    <th>Category</th>
                    <th>Exp. Date</th>
                    <th>Qty</th>
                    <th>Cp Per Unit</th>
                    <th>Sp Per unit</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  
                </tbody>
              </table>
        </div>
        
        
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
