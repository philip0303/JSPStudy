<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录成功界面</title>
</head>
<body>
	<h1>欢迎登陆</h1>
	<%
		Object name = session.getAttribute("userName");
		out.println("欢迎您" + session.getAttribute("userName"));
		
		//获取登陆次数
		Object c = application.getAttribute("count");
		if (c == null) {
			application.setAttribute("count", 1);
		} else {
			Integer i = (Integer) c;
			application.setAttribute("count", i + 1);
		}
		Integer counts = (Integer) application.getAttribute("count");
		out.println( "您是第" + counts + "位登陆的会员");
	%>
</body>
</html>