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
String studno=request.getParameter("studno");
String name=request.getParameter("name");
String dept=request.getParameter("dept");
String position=request.getParameter("position");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String hobby[]=request.getParameterValues("hobby");
String hobbysum="";
try{
	String sql="update stud0725 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(7, studno);
			pstmt.setString(1, name);
			pstmt.setString(2, dept);
			pstmt.setString(3, position);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			for(int i=0;i<hobby.length;i++){
				if(i==0){
						hobbysum=hobby[i];
				}else{
					hobbysum+=","+hobby[i];
				}
			}
			pstmt.setString(6, hobbysum);
			pstmt.executeUpdate();
			%>
			<script>
			alert("수정이 완료되었습니다!");
			location.href="studSelect.jsp"
			</script>
			<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>