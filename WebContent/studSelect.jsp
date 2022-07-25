<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int cnt=0;
try{
	String sql="select count(*) from stud0725";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>학사정보 목록</h2>
<div class="div1">총 <%=cnt %>명의 학사정보가 있습니다.</div>
<table border="1" id="tab1">
<tr>
	<th class="th1">학번</th>
	<th class="th1">성명</th>
	<th class="th1">학과</th>
	<th class="th1">학년</th>
	<th class="th1">주소</th>
	<th class="th1">연락처</th>
	<th class="th1">취미</th>
	<th class="th1">관리</th>
</tr>
<%
try{
	String sql="select * from stud0725";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String studno=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		String position=rs.getString(4);
		String address=rs.getString(5);
		String phone=rs.getString(6);
		String hobby=rs.getString(7);
	
%>
<tr>
<td class="td1"><%=studno %></td>
<td class="td1"><%=name %></td>	
<td class="td1"><%=dept %></td>	
<td class="td1"><%=position %></td>	
<td class="td1"><%=address %></td>	
<td class="td1"><%=phone %></td>	
<td class="td1"><%=hobby %></td>	
<td class="td1"><a href="update_stud.jsp?studno=<%=studno %>">수정</a> /
<a href="delete_stud.jsp?studno=<%=studno %>"onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a> 
</td>
</tr>	
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>	
</table>
<br>
<div class="td1"><input type="button" value="학사정보 추가" onclick="location.href='insert_stud.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>