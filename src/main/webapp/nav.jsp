<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/4
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background-color: rgb(235, 225, 239);">
<div style="text-align: center;color: rgb(54, 1, 33); border: 0;font-size: 24px; margin-left: 10%;letter-spacing: 3px;">
    <h3 style="text-align: center;">导&nbsp;&nbsp;航</h3>
    <ul>
        <li style="text-align: center; background-color: rgb(225,215,229);">组合介绍</li>
        <li style="text-align: center;"><a href="Main.jsp#num" target="main">成员介绍</a></li>
        <li style="text-align: center; background-color: rgb(225,215,229);"><a href="Main.jsp#song"
                                                                               target="main">专辑介绍</a></li>
        <li style="text-align: center;"><a href="https://zh.wikipedia.org/wiki/Kep1er">维基百科</a></li>
        <li style="text-align: center; background-color: rgb(225,215,229);"><a href="mem.jsp">会员注册</a></li>
        <li style="text-align: center;"><a href="sign.jsp">点此登录</a></li>
    </ul>
</div>

<p style="text-align: center;margin-left: 10%;">
    <a href="kch.html">
        <image src="1.png" width=100%></image>
    </a>
</p>

<p style="color:rgb(157, 98, 169);text-align:center;font-family:Verdana, Geneva, Tahoma, sans-serif;margin-left: 10%;">
    <b>
        &lt Kim
        Chae
        Hyun &gt </b></p>

<p style="text-align:center;margin:5%;backgroundcolor:antiquewhite;">

        <%
        String s=(String) session.getAttribute("name");
        if (s!=null){
            out.println("用户名:"+s+"<br>");
            out.println("欢迎访问小葡主页！");
        }else {
            out.println("未登录");
        }
        %>


<p>
</body>
</html>
