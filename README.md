# JSPStudy
学习Java web的笔记
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SessionClient</title>
</head>
<body>

	<form action="SessionTest.jsp" name="user" method="post" id="use">
		<tr>
			<td align="center" colspan="2" style="text-align: center"
				;class="text_toble">用户登录</td>
			<br />
			<br />
		</tr>

		<tr>
			<td class="text_toble">用户名</td>
			<td><input type="text" name="userName" value=""></td>
			<br />
			<br />
		</tr>
		<tr>
			<td class="text_toble">密码</td>
			<td><input type="password" name="userPwd" value=""></td>
			<br />
			<br />
		</tr>
		<tr>
			<td class="text_toble" style="text-align: center" colspan="2">
				<button type="submit" class="page_bth" name="saveUser">登录</button>
			</td>
		</tr>


		<%
			session.setAttribute("user", "admin");
			session.setAttribute("age", 10);
			session.getId();
			out.println(session.getId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			session.setMaxInactiveInterval(5);
		%>
		爱好： <br /> <input type="checkbox" name="love" value="田径">田径 <br />
		<input type="checkbox" name="love" value="跳舞">跳舞 <br />
		<input type ="checkbox" name="love" value="唱歌">唱歌 <br />
		<input type ="checkbox" name="love" value="篮球">篮球 <br />
		<input type="checkbox" name="love" value="排球">排球 <br />
	</form>







<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SessionServer</title>
</head>
<body>
	<%
		String userN = request.getParameter("userName");
		String useP = request.getParameter("userPwd");
		request.setCharacterEncoding("utf-8");
	%><br />
	<%
		session.getAttribute("user");
	%><br />
	<br />
	<%
		out.print("欢迎您" + userN);
	%>
	<br />
	<br />
	<br />
	<%
		out.println(useP);
	%>
	<br />
	<br />
	<%
		String s = session.getId();
		out.println(s);
	%>
	<br />
	<br />
	<%
		request.setCharacterEncoding("utf-8");
		String[] str = request.getParameterValues("love");
		for (int i = 0; i < str.length; i++) {
			out.println(str[i] + "&nbsp;&nbsp;&nbsp;");
		}
	%>


</body>
</html>



















</body>
</html>
