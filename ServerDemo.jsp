<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	String uName = request.getParameter("userName").trim();
	String uPwd = request.getParameter("userPwd").trim();
		try {
			//1.加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//2.建立连接
			String url = "jdbc:mysql://localhost:3306/1211";
			Connection connection = DriverManager.getConnection(url,"root","zhaolong");
			//3获取Statement
			String sql = "SELECT * FROM Student WHERE NAME = ? AND pwd = ?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, uName);
			s.setString(2,uPwd);
			//4.执行SQL语句
			ResultSet rs = s.executeQuery();
			//5.判断是否有当前用户名和密码
			if(rs.next()){
				//如果有 跳转至成功界面
				session.setAttribute("userName", uName);
				response.sendRedirect("ServerDemo2.jsp");
			}else{
				//用户名和密码不正确，返回登录界面
				request.getRequestDispatcher("ClientDemo.jsp").forward(request,response);
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		

	
	
	
	%>
</body>
</html>