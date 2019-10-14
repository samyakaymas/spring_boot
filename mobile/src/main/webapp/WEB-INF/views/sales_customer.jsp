<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function addmobile()
          {
            var node = document.createElement("INPUT")
            node.name = "mobiles[]";
            node.type = "number";
            node.required = true;
            node.max = 9999999999;
            node.min = 1000000000;
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
  <li><a class="active" href="/sales/customer">Add Customer</a></li>
  <li><a href="/sales/sale">Sale</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
    </div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<div id="sale_customer">
  <h2>ADD CUSTOMER</h2>
  <form action="/sales/customer" method="POST">
    Name:<input style="width:100%;" type="text" name="name" required>
    Address:<input style="width:100%" type="text" name="address">
    Date Of Birth:<input style="width:100%" type="date" name = "dob" value = "1990-01-01">
    Referenced By:
    <select style="width:100%;" name="reference">
      <option value=0>None</option>
      <c:forEach items="${list}" var="cu">
        <option value=${cu.getId()}>${cu.getName()}</option>
      </c:forEach>
    </select>
    Mobile Number:<div id="mobile"><input style="width:100%;" type="number" min=1000000000 max=9999999999 name="mobiles[]" required></div>
    <input type="button" value="Add Number" onclick="addmobile()">
    <input type="submit" value="Add Customer">
  </form>
  <div>${outcome}</div>
</div>
</div>

</body>
</html>