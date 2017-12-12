<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
</head>
<body>
	<%
		int i = 0;
		application.setAttribute("count", i++);
		application.getAttribute("count");
	%>
	<%
		String name = "";
		String pwd = "";
		//1.从request中获取cookie数组
		Cookie[] cookies = request.getCookies();
		//2.对获取到的cookie数组进行判断 是否为空
		if (cookies != null && cookies.length > 0) {
			//3.循环遍历数组
			for (Cookie c : cookies) {
				//4.取key
				String key = URLEncoder.encode(c.getName(), "utf-8");
				//这样取值可以防止空指针报错异常
				if ("userName".trim().equals(key)) {
					//5.取出value
					name = c.getValue();
				}
				if ("userPwd".trim().equals(key)) {
					pwd = c.getValue();
				}
				//6.将用户名和密码放入value
			}
		}
	%>


	<form action="CookieTest.jsp" name="user" method="post">
		<table>
			<tr>
				<td align="center" colspan="2" style="text-align: center"
					class="text_toble">用户登录</td>
			</tr>
			<tr>
				<td class="text_toble">用户名</td>
			</tr>
			<tr>
				<td><input type="text" value="<%=name%>" name="userName"></td>
			</tr>
			<tr>
				<td class="text_toble">密码</td>
			</tr>
			<tr>
				<td><input type="password" value="<%=pwd%>" name="userPwd"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="haha" value="saveDay">十天内自动保存用户名和密码</td>
			</tr>
			<tr>
				<td class="text_toble" style="text-align: center" colspan="2">
					<input type="submit" value="登录" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>