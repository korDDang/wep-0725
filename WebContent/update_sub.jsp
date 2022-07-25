
<%@page import="java.time.temporal.WeekFields"%>
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
<%
String id=request.getParameter("id");
try{
	String sql="select * from sub0725 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String subject_name=rs.getString(2);
		String credit=rs.getString(3);
		String lecturer=rs.getString(4);
		String week=rs.getString(5);
		String start_hour=rs.getString(6);
		String end_hour=rs.getString(7);
	
	
%>
<section id="sec1">
<h2>교과목 수정</h2>
<form name="form" method="post" action="update_subProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">교과목 코드</th>
		<td>
			<input type="text" name="id" value="<%=id%>">
		</td>
</tr>
<tr>
	<th class="th1">과 목 명</th>
		<td>
			<input type="text" name="subject_name" value="<%=subject_name%>">
		</td>
</tr>
<tr>
	<th class="th1">학 점</th>
		<td>
			<input type="text" name="credit" value="<%=credit%>">
		</td>
</tr>
<tr>
	<th class="th1">담 당 강 사</th>
		<td>
			<select name="lecturer">
		<option value="0" <%=lecturer.equals("0")?"selected":"" %>>선택하세요</option>
		  <option value="1" <%=lecturer.equals("1")?"selected":"" %>>김교수</option>
		  <option value="2" <%=lecturer.equals("2")?"selected":"" %>>이교수</option>
		  <option value="3" <%=lecturer.equals("3")?"selected":"" %>>박교수</option>
		  <option value="4" <%=lecturer.equals("4")?"selected":"" %>>우교수</option>
		  <option value="5" <%=lecturer.equals("5")?"selected":"" %>>최교수</option>
		  <option value="6" <%=lecturer.equals("6")?"selected":"" %>>강교수</option>
		  <option value="7" <%=lecturer.equals("7")?"selected":"" %>>황교수</option>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">요일</th>
		<td>
			<input type="radio" name="week" value="1" <%=week.equals("1")?"checked":"" %>>월
			<input type="radio" name="week" value="2" <%=week.equals("2")?"checked":"" %>>화
			<input type="radio" name="week" value="3" <%=week.equals("3")?"checked":"" %>>수
			<input type="radio" name="week" value="4" <%=week.equals("4")?"checked":"" %>>목
			<input type="radio" name="week" value="5" <%=week.equals("5")?"checked":"" %>>금
			<input type="radio" name="week" value="6" <%=week.equals("6")?"checked":"" %>>토
		</td>
</tr>
<tr>
	<th class="th1">시 작</th>
		<td>
			<input type="text" name="start_hour" value="<%=start_hour%>">
		</td>
</tr>
<tr>
	<th class="th1">종 료</th>
		<td>
			<input type="text" name="end_hour" value="<%=end_hour%>">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="목록" onclick="location.href='subSelect.jsp'" class="bt2">
		<input type="button" value="수정" onclick="check()" class="bt2">
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