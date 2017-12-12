<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录成功界面</title>
</head>
<body>
	<%
		//	取出用户名和密码
		String uName = request.getParameter("userName");
		String uPwd = request.getParameter("userPwd");
		//取出选择保存时间键
		String[] choose = request.getParameterValues("save");

		//判断用户名和密码是否与设定的相匹配
		if ("admin".equals(uName) && "111111".equals(uPwd)) {
			//判断是否选择保存用户名和密码
			if (choose != null && choose.length > 0) {
				//设置会话，保存用户名
				session.setAttribute("user", uName);
				//创建cookie保存
				Cookie cookieName = new Cookie("userName".trim(), uName);
				Cookie cookiePwd = new Cookie("userPwd".trim(), uPwd);
				//设置保存的时间
				cookieName.setMaxAge(86400);
				cookiePwd.setMaxAge(86400);
				//写入响应
				response.addCookie(cookieName);
				response.addCookie(cookiePwd);
				//密码用户名匹配成功，重定向至2响应界面
				response.sendRedirect("HomeServer2.jsp");
				//如果没有选择按钮，设置不保存，直接失效
			} else {
				//取出cookie
				Cookie[] cookiesR = request.getCookies();
				//设置立即失效
				for (Cookie co : cookiesR) {
					co.setMaxAge(0);
					response.addCookie(co);
				}
			}
			//如果用户名和密码不匹配，那么直接转发至登录界面重新登录
		} else {
			//取出cookie
			Cookie[] cookiesR = request.getCookies();
			//设置立即失效
			for (Cookie co : cookiesR) {
				co.setMaxAge(0);
				response.addCookie(co);
			}
			request.getRequestDispatcher("HomeClient.jsp").forward(request, response);
		}
	%>
</body>
</html>