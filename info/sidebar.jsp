<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = request.getParameter("menu");
%>
	<div>
		<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
		<h4>카테고리</h4>
			<hr>
    		<ul class="nav nav-pills flex-column mb-auto">
      			<li class="nav-item">
	        		<a class="nav-link <%="myhome".equals(menu) ? "active" : "" %>" href="../info/infohome.jsp" >
		         	 <svg class="bi me-2" width="16" height="16"></svg>
		          	 일정관리
		       		 </a>
		     	 </li>
			     <li class="nav-item">
			        <a class="nav-link <%="info".equals(menu) ? "active" : "" %>" href="../info/info.jsp">
			          <svg class="bi me-2" width="16" height="16"></svg>
			          내 정보관리
			        </a>
			      </li>
			     <li class="nav-item">
			       <a class="nav-link <%="meetlist".equals(menu) ? "active" : "" %>" href="../info/meetlist.jsp">
			         <svg class="bi me-2" width="16" height="16"></svg>
			         나의 참여모임
			       </a>
			     </li>
			     <li class="nav-item">
			       <a class="nav-link <%="hostlist".equals(menu) ? "active" : "" %>" href="../info/hostlist.jsp">
			         <svg class="bi me-2" width="16" height="16"></svg>
			         나의 개설모임
			       </a>
			     </li>
			     <li class="nav-item">
			       <a class="nav-link <%="wish".equals(menu) ? "active" : "" %>" href="../info/wishlist.jsp">
			         <svg class="bi me-2" width="16" height="16"></svg>
			         내가 찜한모임
			       </a>
		      	 </li>
		      	 <li class="nav-item">
			       <a class="nav-link <%="home".equals(menu) ? "active" : "" %>" href="결제내역 페이지 링크">
			         <svg class="bi me-2" width="16" height="16"></svg>
			         결제내역
			       </a>
		      	 </li>
			      <li class="nav-item">
			        <a class="nav-link <%="delete".equals(menu) ? "active" : "" %>" href="../info/deleteform.jsp">
			          <svg class="bi me-2" width="16" height="16"></svg>
			          회원탈퇴
			        </a>
		      	  </li>
		    </ul>
    	<hr>
	</div>
</div>
