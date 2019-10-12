<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function addcolor()
          {
            var node = document.createElement("INPUT")
            node.name = "color[]";
            node.type = "text";
            document.getElementById("colors").appendChild(node);
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
  <li><a class="active" href="/admin/mobile">Mobile</a></li>
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


  <div id="admin_mobile_add">
  <form action="/admin/mobile/add" method="POST">
    Brand:<select class="input" name="brand">
      <c:forEach items="${brands}" var="brand">
        <option value="${brand.getName()}">${brand.getName()}</option>
      </c:forEach>
    </select>
    Name:<input type="text" name="name" required>
    Model:<input type="text" name="model" required>
    Price:<input type="number" name="price" value=0>
    Display:<input type="text" name="display">
    Resolution:<input type="text" name="resolution">
    Wifi:<input type="number" name="wifi" value=0.0>
    Network:<input type="text" name="network">
    Fast Charge:<input type="text" name="fcharge">
    GPU:<input type="text" name="gpu">
    CPU:<input type="text" name="cpu">
    Platform:<input type="text" name="platform">
    Dual Sim<input type="text" name="dualsim">
    Screen:<input type="number" name="screen" value=0.0>
    Front Camera:<input type="number" name="fcamera" value=0>
    Rear Camera:<input type="number" name="rcamera" value=0>
    Bluetooth:<input type="number" name="bluetooth" value=0.0>
    Secondary Memory:<input type="number" name="smemory" value=0>
    RAM:<input type="number" name="ram" value=0>
    Battery:<input type="number" name="battery" value=0>
    External Memory:<input type="number" name="exmemory" value=0>
    USB:<input type="number" name="usb" value=0.0>
    Colors:<div id="color"><input type="text" name="color[]"></div><div id="colors"></div>
    <input type="button" value="Add Color" onclick="addcolor()">
    <input type="submit" value="Add Mobile">
  </form>
  <div>${outcome_add}</div>
</div>


<div id="admin_mobile_update">
  <form action="/admin/mobile/update" method="POST">
    Mobile: <select class="input" name="model" id="model">
      <option value=""></option>
      <c:forEach items="${list}" var="m">
        <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
      </c:forEach>
    </select>
    New Price:<input type="number" name="price" id="price" required>
    <input type="submit" value="Update Price">
  </form>
  <div>${outcome_update}</div>
</div>

<div id="admin_mobile_delete">
    <form action="/admin/mobile/delete" method="POST">
      Mobile: <select class="input" name="model" id="model">
        <option value=""></option>
        <c:forEach items="${list}" var="m">
          <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
        </c:forEach>
      </select>
      <input type="submit" value="Delete Mobile">
    </form>
    <div>${outcome_delete}</div>
  </div>

</div>

</body>
</html>