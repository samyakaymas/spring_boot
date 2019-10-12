<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>

          function deletes(node)
          {
            node.remove();
          };

          function addmobile()
          {
            var row = document.createElement("TR");
            var column = document.createElement("TD");
            column.innerHTML = ` <select class = "mode m" name="model[]">
              <c:forEach items="${mobiles}" var="m">
                  <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
              </c:forEach>
              </select>`;
              row.appendChild(column);
            var column = document.createElement("TD");
            column.innerHTML = '<input type="number" name="ids[]">';
            row.appendChild(column);
            var column = document.createElement("TD");
            column.innerHTML = '<input type="number" name="prices[]" value=0 required>';
            row.appendChild(column);
            var column = document.createElement("TD");
            column.innerHTML = '<input type="button" value="Delete" onclick="deletes(this.parentElement.parentElement)">';
            row.appendChild(column);
            var parent = document.getElementById("description");
            parent.appendChild(row);
            moa_change();
          };

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
          };
          function moa_change()
          {
            if(document.getElementById("moas").value=="mobile")
            {
              var mod = document.getElementsByClassName("mode");
              for(let item of mod)
              {
                if(item.className!="mode m")
                {
                item.innerHTML = ` <c:forEach items="${mobiles}" var="m">
                        <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
                      </c:forEach> `;
                      item.className = "mode m";
                }
              }
            }
            else{
              var mode = document.getElementsByClassName("mode");
              for(let item of mode)
              {
                if(item.className!="mode a")
                {
                item.innerHTML = ` <c:forEach items="${accessories}" var="a">
                        <option value="${a.getModel()}">${a.getBrand()} ${a.getName()}</option>
                      </c:forEach> `;
                      item.className = "mode a";
                }
              }
            }
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
  <li><a href="/admin/accessory">Accessory</a></li>
  <li><a href="/admin/supplier">Supplier</a></li>
  <li><a href="/admin/salesman">Salesman</a></li>
  <li><a class="active" href="/admin/purchase">Purchase</a></li>
  <li><a href="/admin/allpurchase">All Purchases</a></li>
  <li><a href="/admin/expense">Other Expense</a></li>
  <li><a href="/admin/birthdays">Birthdays</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">


  <div id="admin_purchase">
  <form action="/admin/purchase" method="POST">
    <table>
    <tr><td>Supplier:</td><td><select class="input" name="sid" required>
      <c:forEach items="${suppliers}" var="s">
        <option value="${s.getId()}">${s.getName()}</option>
      </c:forEach>
    </select></td></tr>
    <tr><td>Mobile/Accessory:</td><td><select class="input" id="moas" name="moa" onchange="moa_change()">
      <option value="mobile">Mobile</option>
      <option value="accessory">Accessory</option>
    </select></td></tr>
    <tr><td>Date Of Purchase:</td><td><input type="date" name = "date" id="date"></td></tr></table>
    Description:<table id="description">
      <tr>
        <td>Model</td>
        <td>IMEI/ID</td>
        <td>Cost Price</td>
        <td></td>
      </tr>
      <tr>
        <td>
            <select class = "mode m" name="model[]">
                <c:forEach items="${mobiles}" var="m">
                    <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
                </c:forEach>
            </select>
        </td>
        <td><input type="number" name="ids[]" required  ></td>
        <td><input type="number" name="prices[]" value=0></td>
        <td></td>
      </tr>
    </table>
    <input type="button" value="Add Model" onclick="addmobile()" style="width: 15%"><br><br>
    <input type="submit" value="Add Purchase" style="width: 15%">
  </form>
  <div>${outcome}</div>
</div>
</div>
</body>
</html>