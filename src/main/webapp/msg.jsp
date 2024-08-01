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
        if (s0!=null&&s0!="unsigned"){
            out.println("用户名:"+s0+"<br>");
            out.println("欢迎访问小葡主页！");
        }else {
            response.sendRedirect("Main.jsp#board");
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
            <div style="margin-left: 25%;">
                <h3 style="font-family:微软雅黑;font-size: 60px">留&nbsp;&emsp;言</h3>
            </div>

            <form action="Main_msged.jsp#board" method="post">
                <!-- 文本输入框 -->

                <%
                    if (session.isNew())
                        session.setAttribute("username", "unsigned");
                %>

                用户名：
                <%=s0%>

                <br>

                <label for="text-field"></label>
                <textarea style="height: 500px;width: 70%;
                        font-size: 30px;font-family: '等线 Light';
                        border: none;background-color: antiquewhite;border-radius: 20px;
                        margin-top: 20px;margin-bottom: 20px;
                            " id="text-field" name="text-field"></textarea>

                <br>

                <script>
                    function changefont() {
                        var element1 = document.getElementById("font0");
                        var element2 = document.getElementById("text-field");
                        var element3 = document.getElementById("size0");
                        var style = element1.options[element1.selectedIndex].value;
                        element2.style.fontFamily = style;
                        element3.style.fontFamily = style;
                    }

                    function changesize() {
                        var element1 = document.getElementById("size0");
                        var element2 = document.getElementById("text-field");
                        var size = element1.options[element1.selectedIndex].value;
                        element2.style.fontSize = size;
                    }
                </script>

                <label for="font0">字体选择</label>
                <select id="font0" name="font0" style="margin-top: 20px;margin-bottom: 20px;
                            font-size: 30px;border: none;background-color: rgb(205,175,248);
                            height: 60px;width: 355px;" onchange="changefont()">
                    <option style="font-family: '等线 Light'">等线 Light</option>
                    <option style="font-family: '微软雅黑 Light'">微软雅黑 Light</option>
                    <option style="font-family: 方正粗黑宋简体">方正粗黑宋简体</option>
                    <option style="font-family: 微软雅黑">微软雅黑</option>
                    <option style="font-family: 等线">等线</option>
                    <option style="font-family: 宋体">宋体</option>
                    <option style="font-family: 黑体">黑体</option>
                    <option style="font-family: 仿宋">仿宋</option>
                    <option style="font-family:华文仿宋">华文仿宋</option>
                    <option style="font-family: 楷体">楷体</option>
                    <option style="font-family: 华文楷体">华文楷体</option>
                    <option style="font-family: 华文新魏">华文新魏</option>
                    <option style="font-family: 华文行楷">华文行楷</option>
                </select>

                <br>

                <label for="size0">字号选择</label>
                <select id="size0" name="size0" style="margin-top: 20px;margin-bottom: 20px;
                font-size: 30px;border: none;background-color: rgb(205,175,248);
                height: 60px;width: 355px;" onchange="changesize()">
                    <option style="font-size:16px">16px</option>
                    <option style="font-size:20px">20px</option>
                    <option style="font-size:24px">24px</option>
                    <option style="font-size:28px">28px</option>
                    <option style="font-size:30px" selected>30px</option>
                    <option style="font-size:32px">32px</option>
                    <option style="font-size:36px">36px</option>
                    <option style="font-size:40px">40px</option>
                    <option style="font-size:44px">44px</option>
                    <option style="font-size:48px">48px</option>
                    <option style="font-size:52px">52px</option>
                    <option style="font-size:56px">56px</option>
                    <option style="font-size:60px">60px</option>
                    <option style="font-size:64px">64px</option>
                </select>

                <br>
                <!-- 提交按钮 -->
                <div style="margin-left: 25%"><input type="submit" value="提交"
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
