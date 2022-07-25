<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
String idx=request.getParameter("idx");
String name=request.getParameter("name");
String major=request.getParameter("major");
String field=request.getParameter("field");

try{
	String sql="insert into lecturer0725 values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, field);
			pstmt.executeUpdate();
			%>
			<script>
			alert("저장완료");
			location.href="lecturerSelect.jsp"
			</script>
			<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>