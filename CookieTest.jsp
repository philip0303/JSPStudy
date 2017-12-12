<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cookie响应界面</title>
</head>
<body>
	<%
	
	//1.取出表单中的用户名和密码
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("userName");
	String pwd = request.getParameter("userPwd");
	//a.获取checkbox，看是否选中
	String[] chex = request.getParameterValues("haha");//获取选择的name
	//b.判断是否选中checkbox
	if(chex!=null && chex.length>0){

		//2.创建cookie对象保存用户名和密码
		//name = URLEncoder.encode(name,"utf-8");
		//pwd = URLEncoder.encode(pwd,"utf-8");
		Cookie cookieName = new Cookie("userName".trim(),name);
		Cookie cookiePwd = new Cookie("userPwd".trim(),pwd);
		cookieName.setMaxAge(864000);
		cookiePwd.setMaxAge(864000);
		//3.写入响应中
		response.addCookie(cookieName);
		response.addCookie(cookiePwd);
	}else{
		
		//设置cookie失效
		//取出cookie
		Cookie[] cookies = request.getCookies();
		for(Cookie c :cookies){
			//设置失效时间
			c.setMaxAge(0);
			//放进去cookie
			response.addCookie(c);
			
		}
		
		
		
		
		
	}
	
	

	
	
	
	
	
	%>
	
	
	
	
	
	
	
	
</body>
</html>