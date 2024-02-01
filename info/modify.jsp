<%@page import="vo.Addresses"%>
<%@page import="vo.User"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="dao.UserDao"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	요청URL
		localhost/comn/modify.jsp
	요청파라미터(요청메세지의 바디부)
		id=xxx&password=xxx&name=xxx&email=xxx&tel=xxx
	*/
	
	
	
	
	
	
	// 1.요청파라미터 값 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	Date birthDate =DateUtils.toDate(request.getParameter("birthdate"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	int cityNo = Integer.parseInt(request.getParameter("cityNo"));
	int guNo = Integer.parseInt(request.getParameter("guNo"));
	String content = request.getParameter("content");
	
	Addresses addresses = new Addresses();
	addresses.setNo(guNo);
	addresses.setAddress_no2(cityNo);
	
	
	// 2. userDao 생성
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	// 3. 비밀번호 암호화
	String sha1Password = DigestUtils.sha256Hex(password);
	
	// 4. 유저객체에 값 저장
	user.setId(id);
	user.setPassword(sha1Password);
	user.setName(name);
	user.setNickname(nickname);
	user.setBirthDate(birthDate);
	user.setGender(gender);
	user.setEmail(email);
	user.setTel(tel);
	user.setAddresses(addresses);
	user.setContent(content);
	
	// 5. updateUser에 user에 저장된 값 저장
	userDao.updateUser(user);
	
	// 6. 회원정보 창으로 이동
	response.sendRedirect("info.jsp");
%>














