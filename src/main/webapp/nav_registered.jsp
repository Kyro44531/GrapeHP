<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/4
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*" %>
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
        <li style="text-align: center; background-color: rgb(225,215,229);"><a href="Main.jsp#song" target="main">专辑介绍</a></li>
        <li style="text-align: center;"><a href="https://zh.wikipedia.org/wiki/Kep1er">维基百科</a></li>
        <li style="text-align: center; background-color: rgb(225,215,229);"><a href="mem.jsp" >会员注册</a></li>
        <li style="text-align: center;"><a href="sign.jsp" >点此登录</a></li>
    </ul>
</div>

<p style="text-align: center;margin-left: 10%;">
    <a href="kch.html">
        <image src="1.png" width=100%></image>
    </a>
</p>

<p style="color:rgb(157, 98, 169);text-align:center;font-family:Verdana, Geneva, Tahoma, sans-serif;margin-left: 10%;" > <b>
    &lt Kim
    Chae
    Hyun &gt </b> </p>

<p style="text-align:center;margin:5%;backgroundcolor:antiquewhite;">

        <%

  try {
      String u = new String(request.getParameter("username"));
      String p = new String(request.getParameter("password"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/studentdb";
    String username="root";
    String password="zmjxx2003121";
    Connection conn=DriverManager.getConnection(url,username,password);
    out.println("已连接至数据库");
    String sql="insert into users(username,password) values('"+u+"','"+p+"')";
    Statement stmt=conn.createStatement();
    stmt.executeUpdate(sql);

    out.println(sql+"<br>");
    out.println("注册成功！"+"<br>");

    String sql2="select * from users";;
    PreparedStatement ps2=conn.prepareStatement(sql2);
    ResultSet rs=ps2.executeQuery();
    while(rs.next())
    out.println(rs.getString("username")+"&emsp;"+rs.getString("password")+"<br>");

    ps2.close();
    conn.close();

  }catch(Exception e) {
    out.print("注册失败");
    e.printStackTrace();
  }

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
