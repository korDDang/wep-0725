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
String id=request.getParameter("id");
String subject_name=request.getParameter("subject_name");
String credit=request.getParameter("credit");
String lecturer=request.getParameter("lecturer");
String week=request.getParameter("week");
String start_hour=request.getParameter("start_hour");
String end_hour=request.getParameter("end_hour");

try{
	String sql="insert into sub0725 values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, subject_name);
			pstmt.setString(3, credit);
			pstmt.setString(4, lecturer);
			pstmt.setString(5, week);
			pstmt.setString(6, start_hour);
			pstmt.setString(7, end_hour);
			pstmt.executeUpdate();
			%>
			<script>
			alert("완료되었습니다.");
			location.href="subSelect.jsp"
			</script>
			<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>