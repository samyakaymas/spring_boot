<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
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
            if(document.getElementById("date").value=="")
            {
              document.getElementById("date").value = today;
            }
          };
          window.onload = function() {
            getDate();
          };</script>
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
  <li><a href="/admin/allsuppliers">All Suppliers</a></li>
  <li><a href="/admin/salesman">Salesman</a></li>
  <li><a href="/admin/allsalesman">All Salesman</a></li>
  <li><a href="/admin/allcustomer">All Customer</a></li>
  <li><a href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a href="/admin/allsales">All Sales</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/expenses">All Other Expenses</a></li>
  <li><a class="active" href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <div id="admin_birthday">
  <form action="/admin/birthdays" method="POST">
    <input type="date" name="date" id="date" value="${date}">
    <input type="submit" value="Submit">
  </form>
  <div>${outcome}</div>
  <div id="birthdaytable">
  <table>
    <tr>
      <td>Customer ID</td>
      <td>Name</td>
      <td>Address</td>
      <td>Mobile Number</td>
    </tr>
    <c:forEach items="${list}" var="c">
      <tr>
        <td>${c.getId()}</td>
        <td>${c.getName()}</td>
        <td>${c.getAddress()}</td>
        <td>
          <c:forEach items="${c.getNumber()}" var = "m">
            ${m.getNumber()}<br>
          </c:forEach>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>
</div>
</div>

</body>
</html>