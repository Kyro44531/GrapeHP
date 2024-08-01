<%@ page import="java.util.Date" %>
<%@ page import="java.util.Objects" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: Kyro
  Date: 2023/12/7
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript">
        function check() {
            window.opener.location.reload();

            const username = document.getElementById("userName").value;
            const password = document.getElementById("password").value;
            if (username == '') {
                window.alert("用户名不能为空");
                return false;
            } else if (password.length < 7) {
                window.alert("密码长度不能小于7位");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body style="background-color: rgb(235, 225, 239);">

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

        <p style="text-align:center;margin:10%;backgroundcolor:antiquewhite;font-family: '微软雅黑 Light';font-size: 24px;">

                <%
                if(session.isNew()) {
                    session.setAttribute("username","unsigned");
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
        <div style="font-family:'微软雅黑 Light';text-align: center;color: rgb(54, 1, 33); border: 0;font-size: 40px; margin-left: 10%;letter-spacing: 15px">

            <%
                if(s0!=null&&s0!="unsigned"){
                    out.println("<h3 style=\"font-family:微软雅黑;text-align: center;font-size: 60px;padding-left: -15%\">登&nbsp;&emsp;录</h3>\n" +
                            "                提示：您已登录\n" +
                            "                <br>\n" +
                            "                是否\n" +
                            "                <br>\n" +
                            "            <form action=\"Main_signout.jsp\" method=\"post\">\n" +
                            "                <div style=\"text-align: center;margin-top: 10px\">\n" +
                            "                    <input type=\"submit\" value=\"登出\"\n" +
                            "                           style=\"border: none;display: inline-block;background-color: indigo; opacity: 0.3;font-size: 40px;\n" +
                            "                                                       font-family: '等线 Light';\n" +
                            "                                                       color: antiquewhite;height: 60px;width:200px;margin-top: 5px;text-align: center;\">\n" +
                            "                </div>\n" +
                            "            </form>\n" +
                            "                <br>\n" +
                            "                或者\n" +
                            "            <form action=\"Main.jsp\" method=\"post\" onsubmit=\"check()\">\n" +
                            "                <div style=\"text-align: center;margin-top: 10px\">\n" +
                            "                    <input type=\"submit\" value=\"返回主页\"\n" +
                            "                           style=\"border: none;display: inline-block;background-color: indigo; opacity: 0.3;font-size: 40px;\n" +
                            "                                                       font-family: '等线 Light';\n" +
                            "                                                       color: antiquewhite;height: 60px;width:200px;margin-top: 5px;text-align: center;\">\n" +
                            "                </div>\n" +
                            "            </form>");
                }else{
                    out.println("<h3 style=\"font-family:微软雅黑;text-align: center;font-size: 60px;padding-left: -15%\">登&nbsp;&emsp;录</h3>\n" +
                            "\n" +
                            "            <form action=\"Main_signed_in.jsp\" method=\"post\" onsubmit=\"check()\">\n" +
                            "                <!-- 文本输入框 -->\n" +
                            "\n" +
                            "\n" +
                            "                <label for=\"name\">用户名:</label>\n" +
                            "                <input type=\"text\" id=\"name\" name=\"username\" required\n" +
                            "                       style=\"display: inline-block;background-color: antiquewhite;border: none;opacity: 0.7;height: 40px;width: 400px;\">\n" +
                            "\n" +
                            "                <br>\n" +
                            "                <!-- 密码输入框 -->\n" +
                            "                <div style=\"margin-top: 20px\">\n" +
                            "                <label for=\"password\">密&emsp;码:</label>\n" +
                            "                <input type=\"password\" id=\"password\" name=\"password\" required\n" +
                            "                       style=\"display: inline-block;background-color: antiquewhite;border: none;opacity: 0.7;height: 40px;width: 400px;\">\n" +
                            "                </div>\n" +
                            "\n" +
                            "                <br>\n" +
                            "                <!-- 提交按钮 -->\n" +
                            "                <div style=\"text-align: center;margin-top: 10px\">\n" +
                            "                    <input type=\"submit\" value=\"提交\"\n" +
                            "                                                       style=\"border: none;display: inline-block;background-color: indigo; opacity: 0.3;font-size: 40px;\n" +
                            "                                                       font-family: '等线 Light';\n" +
                            "                                                       color: antiquewhite;height: 60px;width:200px;margin-top: 5px;text-align: center;\">\n" +
                            "                </div>\n" +
                            "            </form>");
                }
            %>

        </div>
    </td>
    </tbody>
</table>

</body>
</html>
