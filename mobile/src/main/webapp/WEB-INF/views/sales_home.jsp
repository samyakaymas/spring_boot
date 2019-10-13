<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="/common.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script>
        window.onload = function () {
        
        var chart = new CanvasJS.Chart("chartContainer", {
          animationEnabled: true,
          theme: "light2",
          title:{
            text: "Weekly Sale Chart"
          },
          axisX: {
            title: "Date",
            valueFormatString: "DD MMM"
	        },
          axisY:{
            title: "Sale Value",
            prefix: document.getElementById("rs").innerHTML,
            includeZero: false
          },
          data: [{        
            type: "line",
            xValueType: "dateTime",  
            xValueFormatString: "DD MMM",    
            dataPoints: [
              { y: parseInt(document.getElementById("7y").innerHTML), x: parseInt(document.getElementById("7d").innerHTML),markerColor: "blue", markerType: "triangle" },
              { y: parseInt(document.getElementById("6y").innerHTML), x: parseInt(document.getElementById("6d").innerHTML),markerColor: "blue", markerType: "triangle" },
              { y: parseInt(document.getElementById("5y").innerHTML), x: parseInt(document.getElementById("5d").innerHTML),markerColor: "blue", markerType: "triangle" },
              { y: parseInt(document.getElementById("4y").innerHTML), x: parseInt(document.getElementById("4d").innerHTML),markerColor: "blue", markerType: "triangle" },
              { y: parseInt(document.getElementById("3y").innerHTML), x: parseInt(document.getElementById("3d").innerHTML),markerColor: "blue", markerType: "triangle" },
              { y: parseInt(document.getElementById("2y").innerHTML), x: parseInt(document.getElementById("2d").innerHTML),markerColor: "blue", indexLabel: "yesterday", markerType: "triangle" },
              { y: parseInt(document.getElementById("1y").innerHTML), x: parseInt(document.getElementById("1d").innerHTML),markerColor: "blue", indexLabel: "today", markerType: "cross" }
            ]
          }]
        });
        chart.render();
        
        }
        </script>
</head>
<body>
    <div id="sidetab">
        <div id="navbar">
<ul>
  <li><a class="active" href="/">Home</a></li>
  <li><a href="/mobiles">All Mobiles</a></li>
  <li><a href="/accessory">All Accessories</a></li>
  <li><a href="/sales/customer">Add Customer</a></li>
  <li><a href="/sales/sale">Sale</a></li>
  <li><a href="/logout">Logout</a></li>
</ul>
</div>
    </div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">

  <div id="1d" hidden>${p.get(0).date.getTime()}</div>
  <div id="2d" hidden>${p.get(1).date.getTime()}</div>
  <div id="3d" hidden>${p.get(2).date.getTime()}</div>
  <div id="4d" hidden>${p.get(3).date.getTime()}</div>
  <div id="5d" hidden>${p.get(4).date.getTime()}</div>
  <div id="6d" hidden>${p.get(5).date.getTime()}</div>
  <div id="7d" hidden>${p.get(6).date.getTime()}</div>
  <div id="1y" hidden>${p.get(0).y}</div>
  <div id="2y" hidden>${p.get(1).y}</div>
  <div id="3y" hidden>${p.get(2).y}</div>
  <div id="4y" hidden>${p.get(3).y}</div>
  <div id="5y" hidden>${p.get(4).y}</div>
  <div id="6y" hidden>${p.get(5).y}</div>
  <div id="7y" hidden>${p.get(6).y}</div>
  <div id="rs" hidden>&#8377;</div>
  <div id="chartContainer"></div>
        <script src="/graph.js"></script>
    
</div>

</body>
</html>