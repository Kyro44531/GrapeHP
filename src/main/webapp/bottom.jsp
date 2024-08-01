<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/7
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.ServletContext" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <%!
            synchronized void countPeople(){
                ServletContext application = ((HttpServlet)(this)).getServletContext();
                Integer number = (Integer)application.getAttribute("Count");
                if(number==null){
                    number = 1;
                    application.setAttribute("Count",number);
                } else{
                    number = number.intValue() + 1;
                    application.setAttribute("Count",number);
                }
            }
        %>
        <%
            if (session.isNew()) {
                countPeople();
            }
                Integer yourNumber=(Integer) application.getAttribute("Count");

        %>
    <p style="text-align:right;">
        欢迎访问本网站，你是第<%=yourNumber%>个访客
    </p>
</body>
</html>
