# GrapeHP
小葡主页|JSP网页
## 1.流程 
**页面** main reg sign根据登录状态显示不同的页面<br>
**处理** Main_Registered Main_signed_in 重定向至主页<br>
登录状态记录在session中<br>
Cookie则用于记录当前的部分用户信息，用于自动填充