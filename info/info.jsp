<%@page import="utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="vo.Addresses"%>
<%@page import="dto.LoginUser"%>
<%@page import="dao.UserDao"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>마이페이지::회원정보</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="mypage" name="menu"/>
</jsp:include>
<%

	// session 에서 loginuser 정보조회
	//LoginUser loginuser = (LoginUser) session.getAttribute("LOGIN_USER");

	// userId에다가 로그인유저 아이디 조회
	//String userId = loginuser.getId();

	// userdao 객체생성
	UserDao userdao = new UserDao();
	
	// userDao객체에 userId정보를 기입해서 savedUser에 조회
	User saveduser = userdao.getUserById("kang");
	
	

%>

<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<h1>내 정보관리</h1>
		</div>
	</div>	
			
			
			<div class="row pt-4 mb-3">
				<div class="col-3">
					<jsp:include page="sidebar.jsp">
						<jsp:param value="info" name="menu"/>
					</jsp:include>				
				</div>
			
			
			<div class="col-9">
				<div class="m-3">
					<table class="table">

						<tbody>
							<tr>
						      <th>아이디</th>
						      <td><%=saveduser.getId() %></td>
						    </tr>
						    
						    <tr>
						      <th>비밀번호</th>
						      <td>********</td>
						    </tr>
						    <tr>
						      <th>이름</th>
						      <td><%=saveduser.getName() %></td>
						    </tr>
						    <tr>
						      <th>닉네임</th>
						      <td><%=saveduser.getNickname() %></td>
						    </tr>
						    <tr>
						      <th>생년월일</th>
						      <td><%=DateUtils.toText(saveduser.getBirthDate()) %></td>
						    </tr>
						    <tr>
						      <th>성별</th>
						      <td><%=saveduser.getGender() %></td>
						    </tr>
						    <tr>
						      <th>이메일</th>
						      <td><%=saveduser.getEmail() %></td>
						    </tr>
						    <tr>
						      <th>전화번호</th>
						      <td><%=saveduser.getTel() %></td>
						    </tr>
						    <tr>
						      <th>주소</th>
						      <td><%=saveduser.getAddresses().getCity_name() %> <%=saveduser.getAddresses().getGu_name() %></td>
						    </tr>
						    <tr>
						      <th>한줄소개</th>
						      <td><%=saveduser.getContent() %></td>
						    </tr>
						    <tr>
						      <th>가입일자</th>
						      <td><%=DateUtils.toText(saveduser.getCreateDate()) %></td>
						    </tr>
						    <tr>
						      <th>프로필사진</th>
						      <td><%=saveduser.getFilename() %></td>
						    </tr>
						</tbody>

					</table>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <a href="modifyform.jsp" class="btn btn-secondary">수정</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>