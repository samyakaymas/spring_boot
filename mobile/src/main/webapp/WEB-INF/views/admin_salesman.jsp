<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function addmobile()
          {
            var node = document.createElement("INPUT")
            node.name = "mobiles[]";
            node.type = "number";
            document.getElementById("mobile").appendChild(node);
          }

          function getDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1; //January is 0!
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
            document.getElementById("date2").value = today;
}
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
  <li><a href="/admin/accessory">Accessory</a></li>
  <li><a href="/admin/supplier">Supplier</a></li>
  <li><a class="active" href="/admin/salesman">Salesman</a></li>
  <li><a href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">


  <div id="admin_salesman_add">
  <form:form action="/admin/salesman/add" method="POST" modelAttribute="userForm">
    Name:<input type="text" name="name" required>
    Username:<spring:bind path="username">
                    <form:input type="text" path="username" placeholder="Username" autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
    </spring:bind>
    Password:<spring:bind path="password">
          <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
          <form:errors path="password"></form:errors>
  </spring:bind>
    Address:<input type="text" name="address">
    Date Of Birth:<input type="date" name = "dob" value = "1990-01-01">
    Joining Date:<input type="date" name = "join_date" id = "date">
    Start Salary:<input type="number" name = "start_salary" value=0>
    Mobile Number:<div id="mobile"><input type="number" min=1000000000 max=9999999999 name="mobiles[]"></div>
    <input type="button" value="Add Number" onclick="addmobile()">
    <input type="submit" value="Add Salesman">
  </form:form>
  <div>${outcome_add}</div>
</div>

<div id="admin_salesman_update">
  <form action="/admin/salesman/update" method="POST">
    Name: <select class="input" name="name" required>
      <c:forEach items="${list}" var="m">
        <option value="${m.getName()}">${m.getName()}</option>
      </c:forEach>
    </select>
    New Salary:<input type="number" name="salary">
    <input type="submit" value="Update Salary">
  </form>
  <div>${outcome_update}</div>
</div>

<div id="admin_salesman_delete">
    <form action="/admin/salesman/delete" method="POST">
      Name: <select class="input" name="id" required>
        <c:forEach items="${list}" var="m">
          <option value="${m.getId()}">${m.getName()}</option>
        </c:forEach>
      </select>
      Leaving Date: <input type="date" name="leaving_date" id = "date2">
      <input type="submit" value="Fire Salesman">
    </form>
    <div>${outcome_delete}</div>
  </div>

</div>

</body>
</html>