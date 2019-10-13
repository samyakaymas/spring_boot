<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function addspec()
          {
            var node = document.createElement("INPUT")
            node.name = "mobiles[]";
            node.type = "number";
            document.getElementById("mobile").appendChild(node);
          }
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
  <li><a class="active" href="/admin/supplier">Supplier</a></li>
  <li><a href="/admin/allsuppliers">All Suppliers</a></li>
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


  <div id="admin_acc_add">
  <form action="/admin/supplier" method="POST">
    Name:<input type="text" name="name" required>
    Address:<input type="text" name="address" required>
    Mobile Number:<div id="mobile"><input type="number" min=1000000000 max=9999999999 name="mobiles[]"></div>
    <input type="button" value="Add Number" onclick="addspec()">
    <input type="submit" value="Add Supplier">
  </form>
  <div>${outcome_add}</div>
</div>

<div id="admin_acc_delete">
    <form action="/admin/supplier/delete" method="POST">
      Supplier: <select class="input" name="id" required>
        <c:forEach items="${suppliers}" var="m">
          <option value="${m.getId()}">${m.getName()}</option>
        </c:forEach>
      </select>
      <input type="submit" value="Delete Supplier">
    </form>
    <div>${outcome_delete}</div>
  </div>

</div>

</body>
</html>