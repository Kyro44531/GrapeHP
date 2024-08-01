<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Date" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/16
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background-color: rgb(235, 225, 239)">
<table>
    <thead>
    </thead>
    <tbody>
    <td style="width: 20%;margin-left:10%;margin-right: 0%; vertical-align: top;margin-top: 100px;">
        <div style="text-align: center;color: rgb(54, 1, 33); border: 0;font-size: 24px; margin-left: 15%;letter-spacing: 3px;margin-top: 100px;">
            <h3 style="text-align: center;">导&nbsp;&nbsp;航</h3>
            <ul>
                <li style="text-align: center; background-color: rgb(225,215,229);">组合介绍</li>
                <li style="text-align: center;"><a href="Main.jsp#num">成员介绍</a></li>
                <li style="text-align: center; background-color: rgb(225,215,229);"><a href="Main.jsp#song">专辑介绍</a>
                </li>
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

        <p style="text-align:center;margin:5%;backgroundcolor:antiquewhite;font-family: '微软雅黑 Light';font-size: 24px;">
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
        if (s0!=null&&s0!="unsigned"){
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
        <div style="text-align: left;color: rgb(54, 1, 33); border: 0;font-size: 40px; margin-left: 10%;letter-spacing: 3px;">
            <form action="sign.jsp" method="post">
                <div style="text-align: center;margin-top: 10%"><h4><%=(String) session.getAttribute("errmsg")%>
                </h4></div>
                <div style="text-align: center"><input type="submit" value="返回"
                                                       style="border: none;display: inline-block;background-color: indigo; opacity: 0.3;font-size: 40px;color: antiquewhite;height: 60px;width:200px;margin-top: 5px;text-align: center;">
                </div>
            </form>
        </div>
    </td>
    </tbody>
</table>

</body>
</html>
