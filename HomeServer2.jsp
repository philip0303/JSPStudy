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
	//获取session会话保存的用户名
		Object o = session.getAttribute("user");
		String userName = (String) o;
		//获取登录次数
		Object count = application.getAttribute("count");
		//判断，为空，就赋值为1
		if (count == null) {
			application.setAttribute("count", 1);
		} else {
			//不为空，在原先的基础上加1
			Integer i = (Integer) count;
			application.setAttribute("count", i + 1);
		}
		Integer counts = (Integer) application.getAttribute("count");
		out.println("您好"+userName+"会员!<br/>您是第" + counts + "位登录的会员");
	%>
</body>
</html>