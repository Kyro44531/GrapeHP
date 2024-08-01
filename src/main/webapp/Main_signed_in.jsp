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
        response.sendRedirect("sign.jsp");
    } else {
        try {
            Cookie dftusnm = new Cookie("dftusnm", request.getParameter("username"));
            response.addCookie(dftusnm);
            String u = new String(request.getParameter("username"));
            String p = new String(request.getParameter("password"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/studentdb";
            String username = "root";
            String password = "zmjxx2003121";
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql2 = "select * from users where username = '" + u + "'";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ResultSet rs = ps2.executeQuery();
            rs.next();
            if (Objects.equals(rs.getString("password"), p)) {
                session.setAttribute("username", u);
                ps2.close();
                conn.close();
                response.sendRedirect("Main.jsp");
            } else {
                ps2.close();
                conn.close();
                session.setAttribute("errmsg", "用户名或密码错误");
                response.sendRedirect("err_signing_in.jsp");
            }



        } catch (Exception e) {
            //response.sendError(999,"登陆失败");
            session.setAttribute("errmsg", e.getMessage());
            response.sendRedirect("err_signing_in.jsp");
        }
    }
%>

</html>
