<%@page import="vn.fpt.fsoft.intern517.olt.model.bean.Class"%>
<%@page import="vn.fpt.fsoft.intern517.olt.model.bean.Topic"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Kiểm tra IP</title>
	<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div id = "sidebar" class = "sidebar animate-sidebar" style = "display:none">
		<ul>
			<li class = "active"><a onclick="document.getElementById('sidebar').style.display='none'; document.getElementById('overlay').style.display='none';">Thi Trắc Nghiệm Online</a></li>
			<li><a href="ManageAdminServlet">Quản lý Admin</a></li>
			<li><a href="ManageClassAdminServlet">Quản lý lớp/học viên</a></li>
			<li><a href="ManageTopic.jsp">Quản lý Topic</a></li>
			<li><a href="ResultClass.jsp">Lấy kết quả</a></li>
			<li><a href="CheckIP.jsp">Kiểm tra IP</a></li>
			<li><a href="ResetIP.jsp">Reset IP/Xóa dữ liệu</a></li>
		</ul>
	</div>
	
	<div class = "overlay overlay-sidebar" id = "overlay" onclick="document.getElementById('sidebar').style.display='none'; document.getElementById('overlay').style.display='none';">
	</div>
	
	<div id = "navbar" class = "container-navbar">
		<ul>
			<li class = "active">
				<a onclick="document.getElementById('sidebar').style.display='block'; document.getElementById('overlay').style.display='block';">Thi Trắc Nghiệm Online</a>
			</li>
			<li style="float:right"><a href = "LogoutServlet">Đăng xuất</a></li>
			<li style="float:right">
				<a href = "#Accout">Xin Chào: <%=(String)session.getAttribute("userName") %></a>
			</li>
		</ul>	
	</div>
	
	<form>
		<div class = "container-bar-1">
			<label style="color:white">Kiểm tra IP gian lận(trùng)</label>
			<button style="float:right">Kiểm tra</button>
		</div>
	</form>
	
	<form action="CheckIPServlet" method="post">
		<div class = "container-bar-2">
			<label>Tên lớp:&nbsp;</label>
			<select name="classID">
				<option value="null">----Chọn lớp----</option>
			<%
				ArrayList<Class> listClass = (ArrayList<Class>)request.getAttribute("listClass");
				for(Class classes:listClass){
			%>
				<option value="<%=classes.getClassID() %>"><%=classes.getClassName() %></option>
			<%
				}
			%>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
			<label>Tên topic:&nbsp;</label>
			<select name="topicID">
				<option value="null">----Chọn topic----</option>
			<%
				ArrayList<Topic> listTopic = (ArrayList<Topic>)request.getAttribute("listTopic");
				for(Topic topic:listTopic){
			%>
				<option value="<%=topic.getTopicID() %>"><%=topic.getTopicName() %></option>
			<%
				}
			%>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="topicID" value="<%=request.getAttribute("topicID") %>" style=" display:none">
			<button type="submit" value="submit" name="checkIP">OK</button>
		</div>
	</form>
	<br>
	
	<div class = "container-table-result table-result">
		<table border="1" width="100%">
           	<tbody>
          	 	<tr>
          	 		<th>Tên học viên</th>
              	  	<th>Địa chỉ IP trùng</th>
            	</tr>
            	<tr>
              	  <td>10.133.228.183</td>
              	  <td>2</td>
            	</tr>
           	</tbody>
       	</table>
	</div>
	
</body>
</html>