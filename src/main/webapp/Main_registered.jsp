<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/11/23
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>葡萄种植基地</title>
</head>


<%
    if (session.isNew()) {
        Vector vs = (Vector) application.getAttribute("messages");
        if (vs == null) {
            Vector v0 = new Vector<String>();
            v0.add("#'微软雅黑Light'#32#珮琦#超级喜欢小葡#2023年12月19日#");
            v0.add("#宋体#32#张元英#超级喜欢日单的tOgether fOever❥#2023年12月20日#");
            application.setAttribute("messages", v0);
        }
        response.sendRedirect("mem.jsp");
    } else {

        try {
            String u = new String(request.getParameter("username"));
            String p = new String(request.getParameter("password"));
            String t = new String(request.getParameter("ta"));
            String n = new String(request.getParameter("country"));
            String g = new String(request.getParameter("gender"));

            if (u.equals("unsigned")) {
                session.setAttribute("errmsg", "请不要使用unsigned作为用户名");
                response.sendRedirect("err_regstering_in.jsp");
            } else {

                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/studentdb";
                String username = "root";
                String password = "zmjxx2003121";
                Connection conn = DriverManager.getConnection(url, username, password);
//      out.println("已连接至数据库");
                String sql = "insert into users(username,password,text,nation,gender) values('" + u + "','" + p + "','" + t + "','" + n + "','" + g + "')";
                Statement stmt = conn.createStatement();
                stmt.executeUpdate(sql);

//      out.println(sql+"<br>");
                out.println("注册成功！" + "<br>");

//      String sql2="select * from users";;
//      PreparedStatement ps2=conn.prepareStatement(sql2);
//      ResultSet rs=ps2.executeQuery();
//      while(rs.next())
//          out.println(rs.getString("username")+"&emsp;"+rs.getString("password")+"<br>");
//      ps2.close();
                conn.close();
                response.sendRedirect("Main.jsp");
            }

        } catch (Exception e) {
            session.setAttribute("errmsg", "该用户已被注册");
            response.sendRedirect("err_regstering_in.jsp");
            e.printStackTrace();
        }
    }
%>

</html>