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
<%@ page import="java.util.Date" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.ServletContext" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<html>
<head>
    <title>葡萄种植基地</title>
</head>
<script>
    function changeimage(id1) {
        element = document.getElementById(id1)//获取我们定义的图片的id
        if (element.src.match("h1"))//检索<img>标签里src中有没有字符串h1
        {
            element.src = "h2.png";//如果第一张显示h1图片，点击后就变成h2图片
        } else {
            element.src = "h1.png";//如果第一张显示h2图片，点击后就显示h1图片
        }
    }
</script>
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

        <p style="text-align:center;margin:5%;backgroundcolor:antiquewhite;font-family: '微软雅黑 Light';font-size: 24px;">

                <%
                    session.setAttribute("username","unsigned");

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

        </p>
    </td>
    <td style="width: 75%;margin-left:2.5%;margin-right: 2.5%">

        <%
            String user = (String) session.getAttribute("username");
            if (user != "unsigned" && user != null) {
                out.println("<div\n" +
                        "                style=\"background-image:url('concert.jpg');background-size: cover;opacity: 0.8; border-radius: 25px;\n" +
                        "        margin-left: 10%; margin-right: 10%; font-size: 28px; padding-left: 5.5%; padding-right: 5.5%;\n" +
                        "        padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: antiquewhite;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 组 合 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <p style=\"color: antiquewhite;font-family: 微软雅黑;text-align:justify;line-height: 56px;font-size: 28px;\">\n" +
                        "                &emsp;&emsp;Kep1er组合是韩国选秀Girls Planet的出道组，由金采炫、休宁巴伊叶、崔有真、金多娟、徐永恩、姜睿绪、江崎光、坂本舞白、沈小婷<a\n" +
                        "                    href=\"#num\">九名成员</a>组成。2022年1月3日，携出道专辑《FIRST IMPACT》出道，主打曲《WA DA DA》获得了广泛的传播度和喜爱值。<br>\n" +
                        "                &emsp;&emsp;自出道至今，Kep1er组合已经发行了5张mini<a href=\"#song\">专辑</a>，每次回归的风格多变，既有表达了少女奔跑向前的歌曲《WA DA\n" +
                        "                DA》，也有充满夏日活力的探寻之曲《Up!》，以及包含了对于爱情的探索的《Giddy》。丰富的歌曲风格展现出了Kep1er的百变魅力 <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "\n" +
                        "\n" +
                        "            </p>\n" +
                        "        </div>"+
                "<div\n" +
                        "                style=\"background-color: white;opacity: 0.5; border-radius: 25px; margin-left: 10%; margin-right: 10%;\n" +
                        "         font-size: 28px; padding-left: 5.5%; padding-right: 5.5%; padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: blueviolet;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 成 员 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <table style=\"width: 100%; align-self: center;font-size: 24px\" id=\"num\">\n" +
                        "                <thead>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <th>序号</th>\n" +
                        "                    <th>成员</th>\n" +
                        "                    <th>生日</th>\n" +
                        "                    <th>MBTI</th>\n" +
                        "                    <th>照片</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody style=\"font-size: 20px\">\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 1</td>\n" +
                        "                    <td><b>金采炫</b></td>\n" +
                        "                    <td> 2002.4.26</td>\n" +
                        "                    <td> ESFP</td>\n" +
                        "                    <td><a href=\"kch.html\"><img src=\"b1.JPEG\" height=\"100\"></img> </a></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 2</td>\n" +
                        "                    <td><b>休宁巴依叶 </b></td>\n" +
                        "                    <td> 2004.7.27</td>\n" +
                        "                    <td> ESFJ</td>\n" +
                        "                    <td><img src=\"b2.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 3</td>\n" +
                        "                    <td><b>崔有真 </b></td>\n" +
                        "                    <td> 1996.8.12</td>\n" +
                        "                    <td> ENFP</td>\n" +
                        "                    <td><img src=\"b3.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 4</td>\n" +
                        "                    <td><b>金多娟</b></td>\n" +
                        "                    <td> 2003.3.2</td>\n" +
                        "                    <td> ESTP</td>\n" +
                        "                    <td><img src=\"b4.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 5</td>\n" +
                        "                    <td><b>徐永恩</b></td>\n" +
                        "                    <td> 2004.12.17</td>\n" +
                        "                    <td> ENTJ</td>\n" +
                        "                    <td><img src=\"b5.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 6</td>\n" +
                        "                    <td><b>姜睿绪 </b></td>\n" +
                        "                    <td> 2005.8.2</td>\n" +
                        "                    <td> ENFJ</td>\n" +
                        "                    <td><img src=\"b6.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 7</td>\n" +
                        "                    <td><b>江崎光</b></td>\n" +
                        "                    <td> 2004.3.12</td>\n" +
                        "                    <td> ESFJ</td>\n" +
                        "                    <td><img src=\"b7.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 8</td>\n" +
                        "                    <td><b>坂本舞白 </b></td>\n" +
                        "                    <td> 1999.12.16</td>\n" +
                        "                    <td> INFP</td>\n" +
                        "                    <td><img src=\"b8.JPG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 9</td>\n" +
                        "                    <td><b>沈小婷</b></td>\n" +
                        "                    <td> 1999.11.12</td>\n" +
                        "                    <td> ISFJ</td>\n" +
                        "                    <td><img src=\"b9.JPEG\" height=\"100\"></img></td>\n" +
                        "                </tr>\n" +
                        "                </tbody>\n" +
                        "            </table>\n" +
                        "        </div>"
                +" <br>\n" +
                        "\n" +
                        "        <div\n" +
                        "                style=\"background-color: white;opacity: 0.5; border-radius: 25px; margin-left: 10%; margin-right: 10%; font-size: 28px;padding-left: 5.5%; padding-right: 5.5%;padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: blueviolet;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 专 辑 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <table style=\"width: 100%;\" id=\"song\">\n" +
                        "                <thead>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <th>专辑名称</th>\n" +
                        "                    <th>发行日期</th>\n" +
                        "                    <th>主打曲</th>\n" +
                        "                    <th>点此听歌</th>\n" +
                        "                    <th>❤</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody>\n" +
                        "                <tr style=\"text-align: center; vertical-align: middle;\">\n" +
                        "                    <td style=\"font-family:Times New Roman\"><b> FIRST IMPACT</b></td>\n" +
                        "                    <td> 2022.01.03</td>\n" +
                        "                    <td><a href=\"video.html\"><b>WA DA DA</b> </a></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/4gdiCHNbwugojBqr5Jt3pq?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht1\" onclick=\"changeimage('ht1')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td style=\"font-family: Kristen ITC\"> DOUBLAST</td>\n" +
                        "                    <td> 2022.06.20</td>\n" +
                        "                    <td><b>UP! </b></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/3XZAvh2NCDQYHgJei35VQ1?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht2\" onclick=\"changeimage('ht2')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td style=\"font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;\"><i>TROUBLE\n" +
                        "                        SHOOTER </i></td>\n" +
                        "                    <td> 2022.10.13</td>\n" +
                        "                    <td><b>We Fresh</b></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/7tMN3tczfA8zwcD4jlCsRh?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht3\" onclick=\"changeimage('ht3')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td style=\"font-family:Comic Sans MS\"><i> LOVE STRUCK! </i></td>\n" +
                        "                    <td> 2023.04.10</td>\n" +
                        "                    <td><b>Giddy</b></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/6blIAzkMKENKqAfMwj5cZQ?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht4\" onclick=\"changeimage('ht4')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td style=\"font-family:Monotype Corsiva;\"> Magic Hour</td>\n" +
                        "                    <td> 2023.09.25</td>\n" +
                        "                    <td><b>Galileo</b></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/2nehY8ewjt4clnD40SclwM?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht5\" onclick=\"changeimage('ht5')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                </tbody>\n" +
                        "            </table>\n" +
                        "        </div>");
            } else {
                out.println("<div\n" +
                        "                style=\"background-image:url('concert.jpg');background-size: cover;opacity: 0.2 ;border-radius: 25px;\n" +
                        "        margin-left: 10%; margin-right: 10%; font-size: 28px; padding-left: 5.5%; padding-right: 5.5%;\n" +
                        "        padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: antiquewhite;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 组 合 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <p style=\"color: antiquewhite;font-family: 微软雅黑;text-align:justify;line-height: 56px;font-size: 28px;\">\n" +
                        "                &emsp;&emsp;登录后查看全部内容\n" +
                        "                <br>\n" +
                        "                &emsp;&emsp;<a href=\"sign.jsp\"> 点此登录</a>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "                &nbsp; <br>\n" +
                        "            </p>\n" +
                        "        </div>"
                +" <div\n" +
                        "                style=\"background-color: white;opacity: 0.5; border-radius: 25px; margin-left: 10%; margin-right: 10%;\n" +
                        "         font-size: 28px; padding-left: 5.5%; padding-right: 5.5%; padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: blueviolet;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 成 员 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <table style=\"width: 100%; align-self: center;\" id=\"num\">\n" +
                        "                <thead>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <th>序号</th>\n" +
                        "                    <th>成员</th>\n" +
                        "                    <th>生日</th>\n" +
                        "                    <th>MBTI</th>\n" +
                        "                    <th>照片</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td> 1</td>\n" +
                        "                    <td><b>金采炫</b></td>\n" +
                        "                    <td> 2002.4.26</td>\n" +
                        "                    <td> ESFP</td>\n" +
                        "                    <td><a href=\"kch.html\"><img src=\"b1.JPEG\" height=\"100\"> </a></td>\n" +
                        "                </tr>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <td colspan=\"5\" style=\"font-size: 32px\">\n" +
                        "                        登录后可查看全部内容\n" +
                        "                        <a href=\"sign.jsp\">点此登录</a>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                </tbody>\n" +
                        "            </table>\n" +
                        "        </div>"
                +" <br>\n" +
                        "\n" +
                        "        <div\n" +
                        "                style=\"background-color: white;opacity: 0.5; border-radius: 25px; margin-left: 10%; margin-right: 10%; font-size: 28px;padding-left: 5.5%; padding-right: 5.5%;padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;\">\n" +
                        "            <div style=\"color: blueviolet;font-family: 微软雅黑;text-align: center;\">\n" +
                        "                <h2>\uD83C\uDF47 专 辑 介 绍 \uD83C\uDF47</h2>\n" +
                        "            </div>\n" +
                        "            <table style=\"width: 100%;\" id=\"song\">\n" +
                        "                <thead>\n" +
                        "                <tr style=\"text-align: center;\">\n" +
                        "                    <th>专辑名称</th>\n" +
                        "                    <th>发行日期</th>\n" +
                        "                    <th>主打曲</th>\n" +
                        "                    <th>点此听歌</th>\n" +
                        "                    <th>❤</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody>\n" +
                        "                <tr style=\"text-align: center; vertical-align: middle;\">\n" +
                        "                    <td style=\"font-family:Times New Roman\"><b> FIRST IMPACT</b></td>\n" +
                        "                    <td> 2022.01.03</td>\n" +
                        "                    <td><a href=\"video.html\"><b>WA DA DA</b> </a></td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <iframe style=\"border-radius:12px\"\n" +
                        "                                    src=\"https://open.spotify.com/embed/track/4gdiCHNbwugojBqr5Jt3pq?utm_source=generator\"\n" +
                        "                                    width=\"280\" height=\"150\" frameBorder=\"0\" allowfullscreen=\"\"\n" +
                        "                                    allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\"\n" +
                        "                                    loading=\"lazy\"></iframe>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                    <td>\n" +
                        "                        <div style=\"margin-top: 5%;margin-bottom: -15%;\">\n" +
                        "                            <image src=\"h1.png\" id=\"ht1\" onclick=\"changeimage('ht1')\" height=\"30px\"></image>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                <tr>\n" +
                        "                    <td colspan=\"5\" style=\"font-size: 32px;\">\n" +
                        "                        <div style=\"text-align: center\">\n" +
                        "                        登录后即可查看全部内容\n" +
                        "                        <a href=\"sign.jsp\">点此登录</a>\n" +
                        "                        </div>\n" +
                        "                    </td>\n" +
                        "                </tr>\n" +
                        "                </tbody>\n" +
                        "            </table>\n" +
                        "        </div>");
            }
        %>

        <div
                style="background-color: white;opacity: 0.5; border-radius: 25px; margin-left: 10%; margin-right: 10%; font-size: 28px;padding-left: 5.5%; padding-right: 5.5%;padding-top: 2%;padding-bottom: 5.5%;margin-top: 5.5%;">
            <div style="color: blueviolet;font-family: 微软雅黑;text-align: center;">
                <h2 id="board">🍇 留 言 板🍇</h2>
                <%
                    if (session.getAttribute("username") != "unsigned" && session.getAttribute("username") != null) {
                        out.println("<div style='text-align: right;'><a href='msg.jsp'>点此留言<a></div>");
                    }
                %>
            </div>
            <div>
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
                    String[] uss = new String[100];
                    Vector v = (Vector) application.getAttribute("messages");
                    for (int i = 0; i < v.size(); i++) {
                        String s = (String) v.elementAt(i);
                        StringTokenizer tozen = new StringTokenizer(s, "#");
                        int max = tozen.countTokens();
                        String font0 = null;
                        String size0 = null;
                        for (int k = 0; k < max; k++) {
                            switch (k){
                                case 2:{out.print("<div style='font-size:22px;'><form action=\"page.jsp\">来自@");break;}
                                case 3:{out.println("<div style='font-family:"+font0+";font-size:"+size0+";'>&emsp;&emsp;");break;}
                            }
                            if(k==max-1){
                                out.println("</div><div style='text-align:right;font-size:15px;color:darkgray'>");
                            }
                            String str = tozen.nextToken();
                            if(k>1){
                                if(k==2){
                                    out.print("<input type=\"submit\" style=\"border: none;font-size:22px;color:indigo;background-color:white; id=\"ww\" name=\"ww\" value='"+str+"'>");
                                    uss[i]=str;
                                }else {
                                    out.println(str);
                                }
                            }else if(k==0){
                                font0=str;
                            }else if(k==1){
                                size0=str;
                            };
                            if (k == 2) {
                                out.println("</form></div>");
                            }
                            if(k==max-1){
                                out.println("</div>");
                            }
                        }
                    }
                %>
            </div>
        </div>

    </td>
    </tbody>
</table>

</body>
</html>
