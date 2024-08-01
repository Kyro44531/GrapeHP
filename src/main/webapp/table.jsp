<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/25
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb";
        String username = "root";
        String password = "zmjxx2003121";
        Connection conn = DriverManager.getConnection(url, username, password);

        String u = "username4";
        String p = "password4";
        String t = "text-field4";
        String n = "CH";
        String g = "FEMALE";

        String sql = "insert into users(username,password,text,nation,gender) values('" + u + "','" + p + "','" + t + "','" + n + "','" + g + "')";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("插入数据成功！" + "<br>");

        out.println("查询所有元素的结果：<br>");
        String sql2 = "select * from users";
        PreparedStatement ps2 = conn.prepareStatement(sql2);
        ResultSet rs = ps2.executeQuery();
        out.println("<table>" +
                "<thead>" +
                "<tr>" +
                "<th> username </th>" +
                "<th> password </th>" +
                "<th> text </th>" +
                "<th> nation </th>" +
                "<th> gender </th>" +
                "</tr>" +
                "</thead>" +
                "<tbody>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getString("username")+"</td>");
            out.println("<td>"+rs.getString("password")+"</td>");
            out.println("<td>"+rs.getString("text")+"</td>");
            out.println("<td>"+rs.getString("nation")+"</td>");
            out.println("<td>"+rs.getString("gender")+"</td>");
            out.println("</tr>");
        }
        out.println("</tbody>" +
                "</table>");

        out.println("查询username4的text<br>");
        String sql5 = "select text from users where username = 'username4' ";
        PreparedStatement ps5 = conn.prepareStatement(sql5);
        ResultSet rs5= ps5.executeQuery();
        rs5.next();
        out.println("查询结果为:"+rs5.getString("text")+"<br>");

        String sql3 = "update users set password = 'passwordnew' where password = 'password4' ";
        stmt.executeUpdate(sql3);
        out.println("更新数据成功<br>");

        rs = ps2.executeQuery();
        out.println("<table>" +
                "<thead>" +
                "<tr>" +
                "<th> username </th>" +
                "<th> password </th>" +
                "<th> text </th>" +
                "<th> nation </th>" +
                "<th> gender </th>" +
                "</tr>" +
                "</thead>" +
                "<tbody>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getString("username")+"</td>");
            out.println("<td>"+rs.getString("password")+"</td>");
            out.println("<td>"+rs.getString("text")+"</td>");
            out.println("<td>"+rs.getString("nation")+"</td>");
            out.println("<td>"+rs.getString("gender")+"</td>");
            out.println("</tr>");
        }
        out.println("</tbody>" +
                "</table>");

        String sql4 = "delete from users where username = 'username4' ";
        stmt.executeUpdate(sql4);
        out.println("删除数据成功<br>");

        rs = ps2.executeQuery();
        out.println("<table>" +
                "<thead>" +
                "<tr>" +
                "<th> username </th>" +
                "<th> password </th>" +
                "<th> text </th>" +
                "<th> nation </th>" +
                "<th> gender </th>" +
                "</tr>" +
                "</thead>" +
                "<tbody>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getString("username")+"</td>");
            out.println("<td>"+rs.getString("password")+"</td>");
            out.println("<td>"+rs.getString("text")+"</td>");
            out.println("<td>"+rs.getString("nation")+"</td>");
            out.println("<td>"+rs.getString("gender")+"</td>");
            out.println("</tr>");
        }
        out.println("</tbody>" +
                "</table>");


        ps2.close();
        conn.close();
    } catch (Exception e) {
        session.setAttribute("errmsg", e.getMessage());
        response.sendRedirect("err_signing_in.jsp");
    }
%>
</body>
</html>
