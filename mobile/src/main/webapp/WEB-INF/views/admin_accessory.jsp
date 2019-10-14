<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function addspec()
          {
            var node = document.createElement("INPUT")
            node.name = "specs[]";
            node.type = "text";
            document.getElementById("specs").appendChild(node);
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
  <li><a class="active" href="/admin/accessory">Accessory</a></li>
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
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">


  <div id="admin_acc_add">
      <h2>ADD</h2>
  <form action="/admin/accessory/add" method="POST">
    Brand:<select class="input" name="brand">
      <c:forEach items="${brands}" var="brand">
        <option value="${brand.getName()}">${brand.getName()}</option>
      </c:forEach>
    </select>
    Name:<input type="text" name="name" required>
    Model:<input type="text" name="model" required>
    Price:<input type="number" name="price" value=0>
    Type:<input type="text" name="type">
    Specifications:<div id="spec"><input type="text" name="specs[]"></div><div id="specs"></div>
    <input type="button" value="Add Spec" onclick="addspec()">
    <input type="submit" value="Add Accessory">
  </form>
  <div>${outcome_add}</div>
</div>

<div id="admin_acc_delete">
    <h2>DELETE</h2>
    <form action="/admin/accessory/delete" method="POST">
      Accessory: <select class="input" name="model" id="model" required>
        <c:forEach items="${list}" var="m">
          <option value="${m.getModel()}">${m.getBrand()} ${m.getName()}</option>
        </c:forEach>
      </select>
      <input type="submit" value="Delete Accessory">
    </form>
    <div>${outcome_delete}</div>
  </div>

</div>

</body>
</html>