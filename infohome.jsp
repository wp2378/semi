<%@page import="vo.Meeting"%>
<%@page import="dao.MeetingDao"%>
<%@page import="vo.Wish"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.ApplyUser"%>
<%@page import="dto.Pagination"%>
<%@page import="utils.NumberUtils"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha512-KJ3oMOYRgF13b4hqfZcDLje1dYKAWPQLs3NJhZ+YOOhM3fu9U9EkgufDAKe4utj5X3OK3ZAQ7J6vG3blYb3PexHg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>마이페이지::내일정관리</title>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
   font-family: 'SUIT-Regular';
}

#box-1 {
	width:250px;
    padding:0 5px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
</style>
</head>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="mypage" name="menu"/>
</jsp:include>
<body>
<%
	// 현재 로그인한 유저의 정보를 loginUser에 저장
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	// 현재 로그인한 유저의 정보들을 저장
	String userId = loginUser.getId();
	int userNo = loginUser.getNo();
	// userdao 객체생성
	UserDao userDao = new UserDao();
	// userDao객체에 userId정보를 기입해서 savedUser에 조회
	User saveduser = userDao.getUserById(userId);

	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	int meetListTotalRows = userDao.getMeetingTotalRows(userNo);
	int wishListTotalRows = userDao.getWishTotalRows(userNo);
	int hostListTotalRows = userDao.getHostTotalRows(userNo);

	// 나의 참여모임 리스트
	Pagination meetpagination = new Pagination(currentPage, meetListTotalRows, 2);
	Map<String, Object> meetparam = new HashMap<>();
	meetparam.put("userNo", userNo);
	meetparam.put("begin", meetpagination.getBegin());
	meetparam.put("end", meetpagination.getEnd());
	List<ApplyUser> userMeetingList = userDao.getMeetListByNo(meetparam);

	// 내가 찜한모임 리스트
	Pagination wishpagination = new Pagination(currentPage, wishListTotalRows, 2);
	Map<String, Object> wishparam = new HashMap<>();
	wishparam.put("userNo", userNo);
	wishparam.put("begin", wishpagination.getBegin());
	wishparam.put("end", wishpagination.getEnd());
	List<Wish> userWishList = userDao.getWishListByNo(wishparam);

	// 내가 만든모임 리스트
	Pagination hostpagination = new Pagination(currentPage, hostListTotalRows, 2);
	Map<String, Object> hostparam = new HashMap<>();
	hostparam.put("userNo", userNo);
	hostparam.put("begin", hostpagination.getBegin());
	hostparam.put("end", hostpagination.getEnd());
	List<Meeting> usetHostList = userDao.getHostListByNo(hostparam);
%>

<div class="container">
	<div class="row pt-4 mb-3">
		<div class="col-3">
			<jsp:include page="sidebar.jsp">
				<jsp:param value="myhome" name="menu"/>
			</jsp:include>
		</div>

		<div class="col-9">
			<div class="container" style="max-width: 900px">
	<div class="row">
		<div class="col-12">
		</div>
	</div>

	<div class="row">
		<div class="col-12 mb-5">
			<div class="category-section2" >
				<h3 class="best meeting category">
	    			<i class="bi bi-calendar-check display-3" style="margin-right: 10px;"></i>
	    			모임 일정 달력
				</h3>
			</div>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-12">
			<div id="calendar"></div>
			<div class="text-end">
				<button type="button" class="btn btn-primary mt-2" id="toggleViewBtn" onclick="toggleView()">리스트 보기</button>
			</div>
		</div>
	</div>
</div>

<div id="modal-event-detail" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">일정정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<h4>[New] 예술적인 공간, 예술 그 이상의 티 코스 [SQNC 010]</h4>
					<ul>
						<li>모임기간 : 24.02.01 ~ 24.02.05</li>
						<li>모임장소 : 서울시 종로구 율곡로 디아망 쥬얼리</li>
					</ul>
				</div>
 				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				</div>
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
<%
	if(userMeetingList.isEmpty()) {

%>
					  			<tr>
					  				<td>참여예정인 모임이 없습니다.</td>
					  			</tr>
<%
	} else {
		for(ApplyUser applyUser : userMeetingList) {
%>
								<tr>
					  				<td id="box-1"><a class="text-black text-decoration-none " href="../meeting/detail.jsp?meetNo=<%=applyUser.getMeeting().getNo() %>"><%=applyUser.getMeeting().getTitle() %></a></td>
					  				<td ><%=DateUtils.toTextKorean(applyUser.getMeeting().getStartDate()) %>~<%=DateUtils.toTextKorean(applyUser.getMeeting().getEndDate()) %></td>
					  			</tr>
<%
		}
	}
%>
						</tbody>
					  	</table>
					</div>
				</div>
				<div class="col-6">
					<div class="card bg-danger-subtle">
						<div class="card-header">
							내가 만든모임
							<a href="/host/management.jsp" class="btn btn-outline-primary btn-sm float-end">더보기</a>
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
<%
	if(usetHostList.isEmpty()) {
%>
								<tr>
					  				<td>개설한 모임이 없습니다.</td>
					  			</tr>
<%
	} else {
		for(Meeting hostList : usetHostList) {


%>
					  			<tr>
					  				<td id="box-1"><a class="text-black text-decoration-none " href="../meeting/detail.jsp?meetNo=<%=hostList.getNo() %>"> <%=hostList.getTitle() %></td>
					  				<td><%=DateUtils.toTextKorean(hostList.getStartDate()) %>~<%=DateUtils.toTextKorean(hostList.getEndDate()) %></td>
					  			</tr>
<%
		}
	}
%>
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
<%
	if(userWishList.isEmpty()) {
%>
								<tr>
					  				<td>찜한 모임이 없습니다.</td>
					  			</tr>
<%
	} else {
		for(Wish userWish : userWishList) {


%>
					  			<tr>
					  				<td id="box-1"><a class="text-black text-decoration-none " href="../meeting/detail.jsp?meetNo=<%=userWish.getMeeting().getNo() %>"> <%=userWish.getMeeting().getTitle() %></td>
					  				<td><%=DateUtils.toTextKorean(userWish.getMeeting().getStartDate()) %>~<%=DateUtils.toTextKorean(userWish.getMeeting().getEndDate()) %></td>
					  			</tr>
<%
		}
	}
%>



					  		</tbody>
					  	</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
    $(document).ready(function() {
        var isCalendarView = true;

        const eventDetailModal = new bootstrap.Modal('#modal-event-detail')

        $('#toggleViewBtn').on('click', function() {
            var calendar = $('#calendar');

            if (isCalendarView) {
                // 현재 캘린더 뷰인 경우
                calendar.fullCalendar('changeView', 'listWeek');
                $('#toggleViewBtn').text('리스트 보기');
            } else {
                // 현재 리스트 뷰인 경우
                calendar.fullCalendar('changeView', 'month');
                $('#toggleViewBtn').text('캘린더 보기');
            }

            // 상태 토글
            isCalendarView = !isCalendarView;
        });

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'month',
            events: [
                {
                	id: 100,
                    title: '[New] 예술적인 공간, 예술 그 이상의 티 코스 [SQNC 010]',
                    start: '2024-02-01',
                    end: '2024-02-05',
                    color: '#007BFF'
                }
            ],
            eventClick: function(info) {
            	// info에서 일정번호를 조회한다.

            	// ajax로 일정번호에 해당하는 정보를 서버에서 받아온다.

            	// 조회된 정보를 모달창의 테이블 셀에 표현한다

            	// 모달창을 표시한다.
            	eventDetailModal.show();
            }
        });


    });
</script>

</html>