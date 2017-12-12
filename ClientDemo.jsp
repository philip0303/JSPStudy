<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = "";
		String pwd = "";
		//1.获取cookie
		Cookie[] cookies = request.getCookies();
		//2.对取出来的cookies判断
		if(cookies !=null && cookies.length>0){
			for(Cookie coo:cookies){
				//3.取出
				String key = URLEncoder.encode(coo.getName(),"utf-8");
				//判断是用户名，还是密码
				if("userName".trim().equals(key)){
					name = coo.getValue();
				}
				if("userPwd".trim().equals(key)){
					pwd = coo.getValue();
				}
			}
		}
	%>


	<form action="ServerDemo.jsp" name="user" method="post">
		<table>
			<tr>
				<td align="center" class="text_toble">用户登录</td>
			</tr>
			<tr>
				<td align="center" class="text_toble">用户名</td>
			</tr>
			<tr>
				<td align="center" class="text_toble"><input type="text"
					value="<%=name%>" name="userName"></td>
			</tr>
			<tr>
				<td align="center" class="text_toble">密码</td>
			</tr>
			<tr>
				<td align="center" class="text_toble"><input type="password"
					value="<%=pwd%>" name="userPwd"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="save" value="saveDay">十天内自动保存用户名和密码</td>
			</tr>
			<tr>
				<td class="text_toble" style="text-align: center" colspan="2">
					<input type="submit" value="登录" />
				</td>
			</tr>
			<tr>
				<a href="EnrollDemo.jsp">注册</a>
			</tr>
		</table>

	</form>






</body>
</html>