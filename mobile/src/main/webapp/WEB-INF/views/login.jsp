<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
            <link rel="stylesheet" href="/common.css">
        <script>
            function userAuth()
            {
                var useri=document.getElementById("useri").value;
                var x = 0;
                var children = document.getElementsByClassName("option");
                for(child in children)
                {
                    //document.getElementById("warning").innerHTML += useri + " ";
                    if(useri==children[child].value)
                    {
                         x=1;
                         break;
                    }
                }
                if(x==1)
                {
                    document.getElementById("warning").innerHTML = "";
                    return true;
                }
                else
                {
                    document.getElementById("warning").innerHTML = "USERNAME NOT FOUND";
                    document.getElementById("invalid").innerHTML = "";
                    return false;
                }
                
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
            </ul>
</div></div>
        <div id="loginbox">
        <form action="" method="POST" onsubmit="return userAuth()">
            <table id="logintable">
                <tr>
                    <td>Username:</td>
                    <td><input list="users" name="username" id="useri">
                        <datalist id="users">
                        <c:forEach items="${users}" var="u">
                            <option class="option" value="${u.getUsername()}">
                        </c:forEach>
                        </datalist></td>
                    <td><div id="warning"> ${message} </div></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" value=""></td>
                    <td id="invalid">${invalid}</td>
                </tr>
                <tr>
                    <td></td><td colspan="2"><input type="submit" value="Login"></td>
                </tr>
            </table>
        </form>
        </div>
        
    </body>
</html>