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
	String sql="select count(*) from sub0725";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>교과목 목록</h2>
<div class="div1">총 <%=cnt %>개의 교과목이 있습니다.</div>
<table border="1" id="tab1">
<tr>
	<th class="th1">과목코드</th>
	<th class="th1">과목명</th>
	<th class="th1">학점</th>
	<th class="th1">담당강사</th>
	<th class="th1">요일</th>
	<th class="th1">시작시<br>간</th>
	<th class="th1">종료시<br>간</th>
	<th class="th1">관리</th>
</tr>
<%
try{
	String sql="select s.id,s.subject_name,s.credit,l.name,s.week,s.start_hour,s.end_hour from sub0725 s,lecturer0725 l where s.lecturer=l.idx order by id";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String subject_name=rs.getString(2);
		String credit=rs.getString(3);
		String name=rs.getString(4);
		String week=rs.getString(5);
		switch(week){
		case "1": week="월";
		break;
		case "2": week="화";
		break;
		case "3": week="수";
		break;
		case "4": week="목";
		break;
		case "5": week="금";
		break;
		case "6": week="토";
		break;
		}
		String start_hour=rs.getString(6);
		String end_hour=rs.getString(7);
	
%>
<tr>
<td class="td1"><%=id%></td>
<td class="td1"><%=subject_name %></td>	
<td class="td1"><%=credit %></td>	
<td class="td1"><%=name %></td>	
<td class="td1"><%=week %></td>	
<td class="td1"><%=start_hour %></td>	
<td class="td1"><%=end_hour %></td>	
<td class="td1"><a href="update_sub.jsp?id=<%=id %>">수정</a> /
<a href="delete_sub.jsp?id=<%=id %>"onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a> 
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
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_sub.jsp?'" class="bt2"></div>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>