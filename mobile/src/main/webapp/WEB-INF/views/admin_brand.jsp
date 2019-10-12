<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        
</head>
<body>
<div id="sidetab">
<div id="navbar">

<ul>
  <li><a href="/">Home</a></li>
  <li><a href="/mobiles">All Mobiles</a></li>
  <li><a href="/accessory">All Accessories</a></li>
  <li><a class="active" href="/admin/brand">Brand</a></li>
  <li><a href="/admin/mobile">Mobile</a></li>
  <li><a href="/admin/accessory">Accessory</a></li>
  <li><a href="/admin/supplier">Supplier</a></li>
  <li><a href="/admin/salesman">Salesman</a></li>
  <li><a href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <div id="admin_brand">
  <form action="/admin/brand" method="POST">
    <select class="input" name="action" id="action">
    <option value="add">Add Brand</option>
    <option value="del">Delete Brand</option>
    </select>
    <input list="brand" name="brand">
    <datalist id="brand">
      <c:forEach items="${brands}" var="brand">
        <option value="${brand.getName()}">
      </c:forEach>
    </datalist>
    <input type="submit" value="Submit">
  </form>
  <div>${outcome}</div>
</div>
</div>

</body>
</html>