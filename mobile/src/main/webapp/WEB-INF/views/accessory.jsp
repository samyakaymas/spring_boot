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
        function prevattr()
        {
          document.getElementById("model").value = model_val;
        }
        window.onload = prevattr();
        </script>
</head>
<body>
<div id="sidetab">
<div id="navbar">
<ul>
  <li><a href="/">Home</a></li>
  <li><a href="/mobiles">All Mobiles</a></li>
  <li><a class="active" href="/accessory">All Accessories</a></li>
</ul>
</div>
<div id="searchbar">
  <ul>
    <li></li>
  <form action="/accessory" method="POST">
  <li>Model</li>
  <li><input class="input" list="model" name="model" id="model"></li>
  <li>Brand</li>
  <li>
    <select class="input" name="brandd">
      <option value="">All</option>
      <c:forEach items="${brands}" var="brand">
        <option value="${brand.getName()}">${brand.getName()}</option>
      </c:forEach>
    </select>
  </li>
  <li>Name</li>
  <li>
    <input type="text" name="name">
  </li>
  <li>Type</li>
  <li>
    <select class="input" name="type">
        <option value="">All</option>
        <c:forEach items="${types}" var="t">
          <option value="${t.getType()}">${t.getType()}</option>
        </c:forEach>
      </select>
  </li>
  <li><input type="submit" value="Search"></li>
  <li><input type="button" class="input" onclick="reset()" value="Reset"></li>
  </form>

</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  
  <h2>ALL ACCESSORIES</h2>
  
  <div id="accessorytable">
  <table>
    <tr class="tableheads">
      <td>MODEL NO.</td>
      <td>BRAND</td>
      <td>NAME</td>
      <td>TYPE</td>
      <td>PRICE</td>
      <td>DESCRIPTION</td>
    </tr>
    <c:forEach items="${list}" var="m">
      <tr class="tableitems">
        <td>${m.getModel()}</td>
        <td>${m.getBrand()}</td>
        <td>${m.getName()}</td>
        <td>${m.getType()}</td>
        <td>${m.getPrice()}</td>
        <td>
          <c:forEach items="${m.getSpecs()}" var="spec">
            ${spec.getSpecs()}<br>
          </c:forEach>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>


</div>

</body>
</html>