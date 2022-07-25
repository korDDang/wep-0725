
<%@page import="java.sql.*"%>
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
	if(doc.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		doc.id.focus();
		return false;
	}if(doc.subject_name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		doc.subject_name.focus();
		return false;
	}if(doc.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		doc.credit.focus();
		return false;
	}if(doc.lecturer.value=="0"){
		alert("담당강사가 입력되지 않았습니다.");
		doc.lecturer.focus();
		return false;
	}if(doc.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		doc.start_hour.focus();
		return false;
	}if(doc.end_hour.value==""){
		alert("종료시간이이 입력되지 않았습니다.");
		doc.end_hour.focus();
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
<h2>교과목 추가</h2>
<form name="form" method="post" action="insert_subProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">교과목 코드</th>
		<td>
			<input type="text" name="id">
		</td>
</tr>
<tr>
	<th class="th1">과 목 명</th>
		<td>
			<input type="text" name="subject_name">
		</td>
</tr>
<tr>
	<th class="th1">학 점</th>
		<td>
			<input type="text" name="credit">
		</td>
</tr>
<tr>
	<th class="th1">담 당 강 사</th>
		<td>
			<select name="lecturer">
			<option value="0">선택하세요</option>
			<%
		
			try{
				String sql="select idx,name from lecturer0725 ";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String idx=rs.getString(1);
					String name=rs.getString(2);
					%>
					<option value="<%=idx%>"><%=name %></option>
					<% 
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">요일</th>
		<td>
			<input type="radio" name="week" value="1" checked>월
			<input type="radio" name="week" value="2">화
			<input type="radio" name="week" value="3">수
			<input type="radio" name="week" value="4">목
			<input type="radio" name="week" value="5">금
			<input type="radio" name="week" value="6">토
		</td>
</tr>
<tr>
	<th class="th1">시 작</th>
		<td>
			<input type="text" name="start_hour">
		</td>
</tr>
<tr>
	<th class="th1">종 료</th>
		<td>
			<input type="text" name="end_hour">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="목록" onclick="location.href='subSelect.jsp'" class="bt1">
		<input type="button" value="등록" onclick="check()" class="bt1">
 	</td>
</tr>	
</table>
</form>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>