<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
          function check()
            {
              var x = document.getElementsByClassName("idds");
              if(x.length==0)
              {
                alert("No Model Added");
                return false;
              }
            };
          
          function deletes(node)
          {
            var y = node.querySelector('select');
            var x = document.getElementById("models");
            var z = document.createElement("OPTION");
            z.innerHTML = y.innerHTML;
            z.value = y.id;
            node.remove();
            z.id = y.id;
            x.appendChild(z);
          };

          function addmobile()
          {
            var x = document.getElementById("models").value;
            var name = document.getElementById(x).innerHTML;
            document.getElementById(x).remove();
            var row = document.createElement("TR");
            row.className = "idds";
            var column = document.createElement("TD");
            var s = document.createElement("SELECT");
            s.id = x;
            s.name = "ids[]";
            var o = document.createElement("OPTION");
            o.value = x;
            o.innerHTML = name;
            s.appendChild(o);
            column.appendChild(s);
            row.appendChild(column);
            var column = document.createElement("TD");
            column.innerHTML = '<input type="number" name="prices[]" min=0 value=0 required>';
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
          function modelchange()
          {
            var modelname = document.getElementById("model").value;
            var node = document.getElementById("id");
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
  <li><a href="/sales/customer">Add Customer</a></li>
  <li><a class="active" href="/sales/sale">Sale</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
    </div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <div id="sales">
    <h2>SALES</h2>
    <form action="/sales/sale" method="POST">
      <table>
      <tr><td>Customer:</td><td><select class="input" name="cid" required>
        <c:forEach items="${customers}" var="cu">
          <option value="${cu.getId()}">${cu.getName()} ${cu.getNumber().get(0).getNumber()}</option>
        </c:forEach>
      </select></td></tr>
      <tr><td>Mobile/Accessory:</td><td><select class="input" id="moas" name="moa" onchange="moa_change()">
        <option value="mobile">Mobile</option>
        <option value="accessory">Accessory</option>
      </select></td></tr>
      <tr><td>Date Of Purchase:</td><td><input type="date" name = "date" id="date"></td></tr>
      <tr><td>Model:</td>
          <td>
            <select style="width:400px" id="models" class = "mode m" name="model">
                <c:forEach items="${mstock}" var="m">
                    <option value=${m.getId()} id="${m.getId()}">${m.getName()} ${m.getId()}</option>
                </c:forEach>
            </select>
          </td>
        </tr>
      </table>
      <input type="button" value="Add Model" onclick="addmobile()" style="width: 15%"><br>
      Description:<table id="description">
        <tr>
          <td>Name</td>
          <td>Price</td>
          <td></td>
        </tr>
      </table>
      <input type="submit" value="Add Purchase" onclick="return check()" style="width: 15%">
    </form>
    <div>${outcome}</div>
  </div>

    
</div>

</body>
</html>