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
<%@ page import="jakarta.servlet.ServletContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<html>
<head>
    <title>葡萄种植基地</title>
</head>
                <%!
                    synchronized void sendmsg(ServletContext application,String s2){
                        Vector v1 = (Vector) application.getAttribute("messages");
                        v1.add(s2);
                        application.setAttribute("messages",v1);
                    }
                %>
                <%
                    String s1=request.getParameter("text-field");
                    String s3=request.getParameter("font0");
                    String s4=request.getParameter("size0");
                    Date d = new Date();
                    String s2="#"+s3+"#"+s4+"#"+session.getAttribute("username")+"#"+s1+"#"+ d+"#";
                    sendmsg(application,s2);
                    response.sendRedirect("Main.jsp");
                %>

</html>
