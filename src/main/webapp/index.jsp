<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<frameset rows="15%,80%,5%" style="padding: 0%;" frameborder="no">
    <frame src="header.jsp">
    <frameset cols="20%,80%" frameborder="no">
        <frame src="nav.jsp" name = "nav">
        <frame src="Main.jsp" name="main">
    </frameset>
    <frame src="bottom.jsp">
</frameset>
</html>