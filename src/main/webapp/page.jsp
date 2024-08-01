<%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/4
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="border: 0; background-color: rgb(235, 225, 239)">
</div>


<table>
    <thead>
    </thead>
    <tbody>
    <td style="width: 20%;margin-left:10%;margin-right: 0%; vertical-align: top;margin-top: 100px;">
        <div style="text-align: center;color: rgb(54, 1, 33); border: 0;font-size: 24px; margin-left: 15%;letter-spacing: 3px;margin-top: 100px;">
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

        <p style="text-align: center;margin-left: 15%;">
            <a href="kch.html">
                <image src="1.png" width=100%></image>
            </a>
        </p>

        <p style="color:rgb(157, 98, 169);text-align:center;font-family:Verdana, Geneva, Tahoma, sans-serif;margin-left: 10%;">
            <b>
                &lt Kim
                Chae
                Hyun &gt </b></p>

        <p style="text-align:center;margin:10%;backgroundcolor:antiquewhite;
            font-family: '微软雅黑 Light';font-size: 24px;">

                <%
                if(session.isNew()) {
                        Vector vs = (Vector) application.getAttribute("messages");
                        if(vs==null){
                            Vector v0 = new Vector<String>();
                            v0.add("#'微软雅黑Light'#32#珮琦#超级喜欢小葡#2023年12月19日#");
                            v0.add("#宋体#32#张元英#超级喜欢日单的tOgether fOever❥#2023年12月20日#");
                            application.setAttribute("messages", v0);
                        }
                    }

        String s0=(String) session.getAttribute("username");
        if (s0!=null&& !s0.equals("unsigned")){
            out.println("用户名:"+s0+"<br>");
            out.println("欢迎访问小葡主页！");
        }else {
            out.println("未登录");
        }

        int count0 =0;
        String dated0 = new Date().toString();

        Cookie temp;
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            int len0 = cookies.length;
            if(len0!=0){
                for(int i=0;i<len0;i++){
                    temp=cookies[i];
                    if(Objects.equals(temp.getName(), "accessCount")){
                        count0=Integer.parseInt(temp.getValue());
                    }
                    if(Objects.equals(temp.getName(), "datec")){
                        dated0=temp.getValue();
                    }
                }
            }
        }

        Cookie accessCount = new Cookie("accessCount",String.valueOf(count0+1));
        Cookie datec = new Cookie("date","2021");
        response.addCookie(accessCount);
        response.addCookie(datec);

        out.println("<br>浏览次数："+count0+"<br>");
        out.println("最近浏览时间"+"<br>"+dated0);

        %>

    </td>
    <td style="width: 75%;margin-left:2.5%;margin-right: 2.5%">
        <div style="text-align: left;color: rgb(54, 1, 33); border: 0;font-size: 40px;
         font-family:'微软雅黑 Light';margin-left: 10%;letter-spacing: 5px;padding-left: 15%">
            <div style="margin-left: 15%;">
            <h3 style="font-family:微软雅黑;font-size: 60px;">用 户 主 页</h3>
            </div>

            <div style="border: none;background-color: white;border-radius: 20px;margin-left: -20%;margin-right: 10%;
                    padding-left: 10%;padding-right: 10%;padding-top: 10%;padding-bottom: 10%">

            <%
                String u = request.getParameter("ww");
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/studentdb";
                String username="root";
                String password="zmjxx2003121";
                Connection conn=DriverManager.getConnection(url,username,password);

                String sql2="select * from users where username = '"+u+"'";
                PreparedStatement ps2=conn.prepareStatement(sql2);
                ResultSet rs=ps2.executeQuery();
                rs.next();
                    out.println("<div style='font-size:48px'>用户@<b>"+rs.getString("username")+"</b></div><br>");
                    if(rs.getString("text")==null|| Objects.equals(rs.getString("text"), "")){
                        out.println("<div style='font-size:32px'><i>这个人很懒，什么也没有留下</i></div><br>");
                    }else {
                        out.println("<div style='font-size:32px'><i>" + rs.getString("text") + "</i></div><br>");
                    }
                    out.println("<div style='font-size:40px'>来自于"+rs.getString("nation")+"的"+rs.getString("gender")+"生"+"</div>");
                ps2.close();
                conn.close();

                }catch(Exception e) {
                //response.sendError(999,"登陆失败");
                session.setAttribute("errmsg",e.getMessage());
                //response.sendRedirect("err_signing_in.jsp");
                e.printStackTrace();
                }
            %>

        </div>

            <form action="Main.jsp#board">
        <div style="margin-left: 20%;margin-top: 10%"><input type="submit" value="返回"
                                             style="border: none;display: inline-block;background-color: indigo; opacity: 0.3;font-size: 40px;
                                                       color: antiquewhite;height: 60px;width:200px;margin-top: 5px;text-align: center;">
        </div>
            </form>

        </div>
    </td>
    </tbody>
</table>

</body>
</html>
