<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册成功处理界面</title>
</head>
<body>
	<%
		//获得注册的用户名和密码
		String name = request.getParameter("EnrollName").trim();
		String pwd = request.getParameter("EnrollPwd").trim();
		//对获取的的用户名和密码进行判断
		try {
			//1.加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//2.建立连接
			String url = "jdbc:mysql://localhost:3306/1211";
			Connection connection = DriverManager.getConnection(url, "root", "zhaolong");
			//3获取Statement
			String sql = "SELECT * FROM Student WHERE NAME = ? AND pwd = ?";
			PreparedStatement s = connection.prepareStatement(sql);
			s.setString(1, name);
			s.setString(2, pwd);
			//4.执行SQL语句
			ResultSet rs = s.executeQuery();
			//5.判断是否有当前用户名和密码
			if (rs.next()) {
				//如果有 返回注册界面
				response.sendRedirect("EnrollDemo.jsp");
			} else {
				//如果没有，讲用户名和密码放入数据库，并返回登录界面
				String inSql = "INSERT INTO Student(`name`,`pwd`) VALUES (?,?)";
				s.setString(1, name);
				s.setString(2, pwd);
				s = connection.prepareStatement(inSql);
				response.sendRedirect("ClientDemo.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	
</body>
</html>