<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
        <link rel="stylesheet" href="/common.css">
        <script>
        
        </script>
</head>
<body>
<div id="sidetab">
<div id="navbar">
<ul>
  <li><a href="/">Home</a></li>
  <li><a href="/mobiles">All Mobiles</a></li>
  <li><a class="active" href="/mobiles/compare">Compare</a></li>
</ul>
</div>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <div id="comparetable">
<table>
  <tr>
    <form action="/mobiles/compare" method="POST">
    <td style="width:200px;">
      Model:
    </td>
    <td>
    <select name="first">
      <c:forEach items="${list}" var="m">
        <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
      </c:forEach>
    </select>
    </td>
    <td>
    <select name="second">
        <c:forEach items="${list}" var="m">
            <option value="${m.getModel()}">${m.getB_name()} ${m.getName()}</option>
          </c:forEach>
      </select>
      </td>
      <td><input type="submit" name="Compare"></td>
    </form>
      </tr>
      <tr><td>MODEL NO.</td><td>${a.getModel()}</td><td>${b.getModel()}</td></tr>
      <tr><td>BRAND</td><td>${a.getB_name()}</td><td>${b.getB_name()}</td></tr>
      <tr><td>NAME</td><td>${a.getName()}</td><td>${b.getName()}</td></tr>
      <tr><td>DISPLAY TYPE</td><td>${a.getDisplay()}</td><td>${b.getDisplay()}</td></tr>
      <tr><td>SCREEN SIZE</td><td>${a.getScreen()}</td><td>${b.getScreen()}</td></tr>
      <tr><td>RESOLUTION</td><td>${a.getResolution()}</td><td>${b.getResolution()}</td></tr>
      <tr><td>FRONT CAMERA</td><td>${a.getFcamera()}</td><td>${b.getFcamera()}</td></tr>
      <tr><td>REAR CAMERA</td><td>${a.getRcamera()}</td><td>${b.getRcamera()}</td></tr>
      <tr><td>BLUETOOTH</td><td>${a.getBluetooth()}</td><td>${b.getBluetooth()}</td></tr>
      <tr><td>WIFI</td><td>${a.getWifi()}</td><td>${b.getWifi()}</td></tr>
      <tr><td>NETWORK</td><td>${a.getNetwork()}</td><td>${b.getNetwork()}</td></tr>
      <tr><td>EXTERNAL MEMORY</td><td>${a.getExmemory()}</td><td>${b.getExmemory()}</td></tr>
      <tr><td>FAST CHARGE</td><td>${a.getFcharge()}</td><td>${b.getFcharge()}</td></tr>
      <tr><td>USB</td><td>${a.getUsb()}</td><td>${b.getUsb()}</td></tr>
      <tr><td>BATTERY</td><td>${a.getBattery()}</td><td>${b.getBattery()}</td></tr>
      <tr><td>PRICE</td><td>${a.getPrice()}</td><td>${b.getPrice()}</td></tr>
      <tr><td>RAM</td><td>${a.getRam()}</td><td>${b.getRam()}</td></tr>
      <tr><td>SECONDARY MEMORY</td><td>${a.getSmemory()}</td><td>${b.getSmemory()}</td></tr>
      <tr><td>CPU</td><td>${a.getCpu()}</td><td>${b.getCpu()}</td></tr>
      <tr><td>GPU</td><td>${a.getGpu()}</td><td>${b.getGpu()}</td></tr>
      <tr><td>PLATFORM</td><td>${a.getPlatform()}</td><td>${b.getPlatform()}</td></tr>
      <tr><td>DUALSIM</td><td>${a.getDualsim()}</td><td>${b.getDualsim()}</td></tr>
</table>
</div>
</div>
</body>
</html>