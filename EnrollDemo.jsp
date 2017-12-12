<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册新用户</title>
</head>
<body>
	<form action = "EnrollServer.jsp" method = "post">
		<table>
			<tr>
				<td align="center" class="text_toble">用户名</td>
			</tr>
			<tr>
				<td align="center" class="text_toble"><input type="text"
					value="" name="EnrollName"></td>
			</tr>
			<tr>
				<td align="center" class="text_toble">用户名</td>
			</tr>
			<tr>
				<td align="center" class="text_toble"><input type="text"
					value="" name="EnrollPwd"></td>
			</tr>
			<tr>
				<td class="text_toble" style="text-align: center" colspan="2">
					<input type="submit" value="注册" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>