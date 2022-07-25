<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.idx.value==""){
		alert("강사 ID가 입력되지 않았습니다.");
		doc.idx.focus();
		return false;
	}if(doc.name.value==""){
		alert("강사명이 입력되지 않았습니다.");
		doc.name.focus();
		return false;
	}if(doc.major.value==""){
		alert("전공이 입력되지 않았습니다.");
		doc.major.focus();
		return false;
	}if(doc.field.value==""){
		alert("세부전공이 입력되지 않았습니다.");
		doc.field.focus();
		return false;
}else{
	doc.submit();
}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
String idx=request.getParameter("idx");
try{
	String sql="select * from lecturer0725 where idx=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, idx);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString(2);
		String major=rs.getString(3);
		String field=rs.getString(4);
	
%>
<h2>강사 수정</h2>
<form name="form" method="post" action="update_lecturerProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">강사 ID</th>
		<td>
			<input type="text" name="idx" value="<%=idx %>">
		</td>
</tr>
<tr>
	<th class="th1">강 사 명</th>
		<td>
			<input type="text" name="name" value="<%=name %>">
		</td>
</tr>
<tr>
	<th class="th1">전 공</th>
		<td>
			<input type="text" name="major" value="<%=major %>">
		</td>
</tr>
<tr>
	<th class="th1">세부 전공</th>
		<td>
			<input type="text" name="field" value="<%=field%>">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="목록" onclick="location.href='lecturerSelect.jsp'" class="bt1">
		<input type="button" value="수정" onclick="check()" class="bt1">
 	</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>	
</table>
</form>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>