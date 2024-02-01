<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	Calendar cal = Calendar.getInstance();


	int year = 0; 
	int month = 0; // 0 ~ 11
	
	// 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
	if(request.getParameter("year") == null || request.getParameter("month") == null) {
		Calendar today = Calendar.getInstance();
		year = today.get(Calendar.YEAR);
		month = today.get(Calendar.MONTH);
	} else {
		// 출력하고자 하는 달력의 년도와 월
		year = Integer.parseInt(request.getParameter("year")); // 2022,..
		month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11
		
		// 이전달 클릭 year, month-1 / 다음달 클릭 year, month+1
		// -1 -> 11,year--  12 -> 0,year++
		if(month == -1) {
			month = 11;
			year = year-1;
		}
		if(month == 12) {
			month = 0;
			year = year+1;
		}
	}
	// 출력하고자 달의 1일 객체 + 1일 요일 + 마지막 날짜
	Calendar firstDate = Calendar.getInstance();
	firstDate.set(Calendar.YEAR, year);
	firstDate.set(Calendar.MONTH, month);
	firstDate.set(Calendar.DATE, 1);
	int firstDay = firstDate.get(Calendar.DAY_OF_WEEK); // 1일의 요일 정보(1일,2월,....,7토)
	int lastDate = firstDate.getActualMaximum(Calendar.DATE);
	
	// 출력 알고리즘(td의 개수 구하기)
	int startBlankCnt = firstDay - 1;
	int endBlankCnt = 0;
	if((startBlankCnt+lastDate)%7 != 0) {
		endBlankCnt = 7 - (startBlankCnt+lastDate) % 7;
	}
	int tdCnt = startBlankCnt + lastDate + endBlankCnt;
%>    
  
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		<style>
			 html, body{ 
			 	height:100%;
			 	margin:0px;
			 }
			 td{
			 	width:100px;
			 	height:100px;
			 }
			 th{
			 	height:30px;
			 	font-weight: normal;
			 }
		</style>
	</head>


</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>




<title>마이페이지::내일정관리</title>
</head>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="mypage" name="menu"/>
</jsp:include>
<body>
<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1>일정관리</h1>
		</div>
	</div>
		
	<div class="row pt-4 mb-3">
		<div class="col-3">
			<jsp:include page="sidebar.jsp">
				<jsp:param value="myhome" name="menu"/>
			</jsp:include>
		</div>
	
		<div class="col-9">
			<div class="row m-3">
				<div class="col-12">
					<h3>나의 캘린더</h3>
					
					<div class="container mt-3">
			<div class="mt-3 mb-3 p-3 d-flex justify-content-between">
				<span >
					<a class="btn btn-outline-dark btn-sm" href="/info/infohome.jsp?year=<%=year%>&month=<%=month-1%>">
						[이전달]
					</a>
				</span>
				<span class="fw-bold fs-3"><%=year%>년 <%=month+1%>월</span>
				<span>
					<a class="btn btn-outline-dark btn-sm" href="/info/infohome.jsp?year=<%=year%>&month=<%=month+1%>">
						[다음달]
					</a>
				</span>
			</div>
			<div>
				<table class="table text-left table-bordered">
					<tr class="table-light text-center fs-5 tr-h">
						<th class="text-danger">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="text-primary">토</th>
					</tr>
					<tr>
						<%
							for(int i=1; i<=tdCnt; i++) {
						%>
								<td>
									<%
										if(i>startBlankCnt && i<=startBlankCnt+lastDate) {
											if(i%7 == 0) {
									%>
												<span class="text-primary"><%=i-startBlankCnt%></span>
									<%			
											} else if(i%7 == 1) {
									%>
												<span class="text-danger"><%=i-startBlankCnt%></span>
									<%																
											}else {
									%>
												<%=i-startBlankCnt%>
									<%			
											}	
										} else {
									%>
											&nbsp;
									<%
										}
									%>		
								</td>
						<%	
								if(i!=tdCnt && i%7 == 0) {
						%>
									</tr><tr>
						<%			
								}
							}
						%>
					</tr>
				</table>
			</div>
			<!--  
				1. bootstrap 적용
				2. 첫번줄 일 월 화 수 목 금 토 
				3. 토요일 파란색 / 일요일 빨간색
			-->
			
		</div>	
						
						
					

				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-6">
					<div class="card bg-info-subtle" >
						<div class="card-header">
							나의 참여모임
							<a href="../info/meetlist.jsp" class="btn btn-outline-primary btn-sm float-end">더보기</a>
						</div>
					  	<table class="table">
					  		<colgroup>
								<col width="50%">	
								<col width="50%">	
							</colgroup>
					  		<thead>
					  			<tr>
					  				<th>모임이름</th>
					  				<th>날짜</th>
					  			</tr>
					  		</thead>
					  		<tbody>
					  			<tr>
					  				<td>볼링모임</td>
					  				<td>2024.02.10</td>
					  			</tr>
					  			<tr>
					  				<td>볼링모임</td>
					  				<td>2024.02.10</td>
					  			</tr>
					  		</tbody>
					  	</table>
					</div>
				</div>
				<div class="col-6">
					<div class="card bg-danger-subtle">
						<div class="card-header">
							내가 만든모임
							<a href="../info/hostlist.jsp" class="btn btn-outline-primary btn-sm float-end">더보기</a>
						</div>
					   	<table class="table">
					  		<colgroup>
								<col width="75%">	
							</colgroup>
					  		<thead>
					  			<tr>
					  				<th>모임이름</th>
					  				<th>날짜</th>
					  			</tr>
					  		</thead>
					  		<tbody>
					  			<tr>
					  				<td>볼링모임</td>
					  				<td>2024.02.10</td>
					  			</tr>
					  		</tbody>
					  	</table>
					</div>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							내가 찜한모임
							<a href="../info/wishlist.jsp" class="btn btn-outline-primary btn-sm float-end">더보기</a>
						</div>
						<table class="table">
					  		<colgroup>
								<col width="50%">	
								<col width="50%">	
							</colgroup>
					  		<thead>
					  			<tr>
					  				<th>모임이름</th>
					  				<th>날짜</th>
					  			</tr>
					  		</thead>
					  		<tbody>
					  			<tr>
					  				<td>볼링모임</td>
					  				<td>2024.02.10</td>
					  			</tr>
					  		</tbody>
					  	</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>