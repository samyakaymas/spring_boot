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
  <li style="background:white"><a class="active" href="/mobiles">All Mobiles</a></li>
  <li><a href="/mobiles/compare">Compare</a></li>
</ul>
</div>
<div id="searchbar">
  <ul>
    <li></li>
  <form action="/mobiles" method="POST">
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
  <li>Sort By</li>
  <li><select class="input" name="sortby">
    <option value="">None</option>
    <option value="screen">Screen Size</option>
    <option value="fcamera">Front Camera</option>
    <option value="rcamera">Rear Camera</option>
    <option value="ram">RAM</option>
    <option value="smemory">Secondary Memory</option>
    <option value="battery">Battery</option>
    <option value="price">Price</option>
  </select></li>
  <li><input type="submit" value="Search"></li>
  <li><input type="button" class="input" onclick="reset()" value="Reset"></li>
  </form>

</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  

  
  <div id="mobiletable">
  <table>
    <tr class="tableheads">
      <td>MODEL NO.</td>
      <td>BRAND</td>
      <td>NAME</td>
      <td>DISPLAY TYPE</td>
      <td>SCREEN SIZE</td>
      <td>RESOLUTION</td>
      <td>FRONT CAMERA</td>
      <td>REAR CAMERA</td>
      <td>BLUETOOTH</td>
      <td>WIFI</td>
      <td>NETWORK</td>
      <td>EXTERNAL MEMORY</td>
      <td>FAST CHARGE</td>
      <td>USB</td>
      <td>BATTERY</td>
      <td>PRICE</td>
      <td>RAM</td>
      <td>SECONDARY MEMORY</td>
      <td>CPU</td>
      <td>GPU</td>
      <td>PLATFORM</td>
      <td>DUALSIM</td>
      <td>COLORS</td>
    </tr>
    <c:forEach items="${list}" var="m">
      <tr class="tableitems">
        <td>${m.getModel()}</td>
        <td>${m.getB_name()}</td>
        <td>${m.getName()}</td>
        <td>${m.getDisplay()}</td>
        <td>${m.getScreen()}"</td>
        <td>${m.getResolution()}</td>
        <td>${m.getFcamera()} MP</td>
        <td>${m.getRcamera()} MP</td>
        <td>${m.getBluetooth()}</td>
        <td>${m.getWifi()}</td>
        <td>${m.getNetwork()}</td>
        <td>${m.getExmemory()} GB</td>
        <td>${m.getFcharge()}</td>
        <td>${m.getUsb()}</td>
        <td>${m.getBattery()} MAH</td>
        <td>${m.getPrice()}</td>
        <td>${m.getRam()} GB</td>
        <td>${m.getSmemory()} GB</td>
        <td>${m.getGpu()}</td>
        <td>${m.getCpu()}</td>
        <td>${m.getPlatform()}</td>
        <td>${m.getDualsim()}</td>
        <td>
          <c:forEach items="${m.getColor()}" var="colo">
            ${colo.getColor()}<br>
          </c:forEach>
        </td>
      </tr>
    </c:forEach>
  </table>
  </div>


</div>

</body>
</html>