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
  <li><a href="/admin/allsuppliers">All Suppliers</a></li>
  <li><a href="/admin/salesman">Salesman</a></li>
  <li><a href="/admin/allsalesman">All Salesman</a></li>
  <li><a href="/admin/allcustomer">All Customer</a></li>
  <li><a href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a class="active" href="/admin/allsales">All Sales</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/expenses">All Other Expenses</a></li>
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>

</ul>
</div>
<div id="searchbar">
  <ul>
    <li></li>
  <form action="/admin/allsales" method="POST">
  <li>Salesman</li>
  <li>
    <select class="input" name="sid">
      <option value=0>All</option>
      <c:forEach items="${salesman}" var="s">
        <option value="${s.getId()}">${s.getName()}</option>
      </c:forEach>
    </select>
  </li>
  <li>Type</li>
  <li>
    <select class="input" name="moa">
        <option value="">All</option>
        <option value="mobile">Mobile</option>
        <option value="accessory">Accessory</option>
    </select>
  </li>
  <li>Start Date</li>
  <li><input type="date" name="start" value="2019-01-01"></li>
  <li>End Date</li>
  <li><input type="date" id="date" name="end"></li>
  <li><input type="submit" value="Search"></li>
  <li><input type="button" class="input" onclick="reset()" value="Reset"></li>
  </form>

</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  

  
  <div id="purchasetable">
  <table>
    <tr class="tableheads">
      <td>Sale ID</td>
      <td>Mobile/Accessory</td>
      <td>Date</td>
      <td>Salesman ID</td>
      <td>Description</td>
    </tr>
    <c:forEach items="${sales}" var="p">
      <tr class="tableitems">
        <td>${p.getId()}</td>
        <td>${p.getMoa()}</td>
        <td>${p.getDate()}</td>
        <td>${p.getSid()}</td>
        <td>
          <table>
          <c:forEach items="${p.getDesc()}" var="d">
            <tr class="description">
              <td>${d.getModel()}</td>
              <td>${d.getId()}</td>
            </tr>
          </c:forEach>
          </table>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>


</div>

</body>
</html>