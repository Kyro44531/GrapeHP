<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>

<html>
<head>
  <title>通过JSP打开数据表</title>
</head>
<body>


<%

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/studentdb";
    String username="root";
    String password="zmjxx2003121";
    Connection conn=DriverManager.getConnection(url,username,password);
    out.println("已连接至数据库");
    String sql="select * from users ";
    PreparedStatement ps=conn.prepareStatement(sql);
    ResultSet rs=ps.executeQuery();
    rs.next();
    out.println(rs.getString("username")+rs.getString("password"));
    ps.close();
    conn.close();
  }catch(Exception e) {
    out.print("登录失败");
    e.printStackTrace();
  }
%>

</body>
</html>
