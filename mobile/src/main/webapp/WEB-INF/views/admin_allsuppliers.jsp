<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
        function reset()
        {
          inputs = document.getElementsByClassName ("input");
          for(x in inputs)
          {
            inputs[x].value="";
          }
          return false;
        }
        function getDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1;
            var yyyy = today.getFullYear();

            if(dd<10) {
                dd = '0'+dd
            } 

            if(mm<10) {
                mm = '0'+mm
            } 

            today = yyyy + '-' + mm + '-' + dd;
            console.log(today);
            document.getElementById("date").value = today;
          };
          window.onload = function() {
            getDate();
          };
        </script>
</head>
<body>
<div id="sidetab">
<div id="navbar">
<ul>
    <li><a href="/">Home</a></li>
  <li><a href="/mobiles">All Mobiles</a></li>
  <li><a href="/accessory">All Accessories</a></li>
  <li><a href="/admin/brand">Brand</a></li>
  <li><a href="/admin/mobile">Mobile</a></li>
  <li><a href="/admin/mstock">Mobile Stock</a></li>
  <li><a href="/admin/accessory">Accessory</a></li>
  <li><a href="/admin/astock">Accessory Stock</a></li>
  <li><a href="/admin/supplier">Supplier</a></li>
  <li><a class="active" href="/admin/allsuppliers">All Suppliers</a></li>
  <li><a href="/admin/salesman">Salesman</a></li>
  <li><a href="/admin/allsalesman">All Salesman</a></li>
  <li><a href="/admin/allcustomer">All Customer</a></li>
  <li><a href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a href="/admin/allsales">All Sales</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/expenses">All Other Expenses</a></li>
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>

</ul>
</div>

</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  

  
  <div id="purchasetable">
      <h2>ALL SUPPLIERS</h2>
  <table>
    <tr class="tableheads">
      <td>Supplier ID</td>
      <td>Name</td>
      <td>Address</td>
      <td>Mobile Number</td>
    </tr>
    <c:forEach items="${list}" var="p">
      <tr class="tableitems">
        <td>${p.getId()}</td>
        <td>${p.getName()}</td>
        <td>${p.getAddress()}</td>
        <td>
          <c:forEach items="${p.getNumber()}" var="d">
             ${d.getNumber()}<br>
          </c:forEach>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>


</div>

</body>
</html>