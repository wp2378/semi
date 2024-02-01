<%@page import="vo.Addresses"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="dao.AddressesDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	/*
	요청 URL
		localhost/gulist.jsp>서울특별시
	요청 파라미터
		id=xxxx
		
	응답 데이터
		JSON Object 구조의 텍스트
		{"exist":true, "id":"hong"}
		{"exist":false, "id":"hong"}
	*/

	
	int no = Integer.parseInt(request.getParameter("no"));

	AddressesDao addressesDao = new AddressesDao();
	List<Addresses> guList =  addressesDao.getAddressesByguName(no);
	Gson gson = new Gson();
	String text = gson.toJson(guList);

	out.write(text);

%>