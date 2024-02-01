<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="dto.LoginUser"%>
<%@page import="dao.UserDao"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
	요청URL
		localhost/comn/delete.jsp
	요청파라미터(요청메세지의 바디부)
		id=xxx&password=xxx&name=xxx&email=xxx&tel=xxx
	*/
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserDao userDao = new UserDao();
		
		// 전달받은 아이디로 유저정보 검색
		User savedUser = userDao.getUserById(id);
		int userid = savedUser.getNo();
		
		// savedUser에 담겨있는 비밀번호와 입력받은 비밀번호가 일치하는지 검색
		String shapassword = DigestUtils.sha256Hex(password);
		if (!savedUser.getPassword().equals(shapassword)) {
			response.sendRedirect("deleteform.jsp?error=fail");
			return;
		}
		
		// 유저정보삭제
		userDao.deleteUserByNo(userid);
		
		// 메인페이지를 재요청
		response.sendRedirect("../info/index.jsp");
		
		
		
		
		
	
	
	
%>