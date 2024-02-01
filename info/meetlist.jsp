<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>마이페이지::나의 참여모임 목록</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="mypage" name="menu"/>
</jsp:include>
	<div class="container">
		<div class="row mt-3">
			<div class="col-12">
				<h1>나의 참여모임</h1>
			</div>
		</div>

		<div class="row pt-4 mb-3">
			<div class="col-3">
				<jsp:include page="sidebar.jsp">
					<jsp:param value="meetlist" name="menu"/>
				</jsp:include>
			</div>
			<div class="col-9">
				 <div class="cards">
			      <div class="row row-cols-1 row-cols-md-2 g-4">
			        <div class="col">
			          <div class="card h-100">
			            <img src="../resources/images/LOGO.png" class="card-img-top"
			            style="width: 470px; height: 300px;" alt="..." />
			            <div class="card-body">
			              <h5 class="card-title">
			              <a href="../info/infohome.jsp">
			              모임이름
			              </a>
			              </h5>
			              <p class="card-text">
			                위치<br>
			                날짜<br>
			              </p>
			            </div>
			          </div>
			        </div>
			        
			        
			        
			        
			        <div class="col">
			          <div class="card h-100">
			            <img src="../resources/images/user/user_1077114.png" class="card-img-top" 
			            style="width: 470px; height: 300px;"alt="..." />
			            <div class="card-body">
			              <h5 class="card-title">
			               <a href="../info/infohome.jsp">
			              모임이름
			              </a>
			              </h5>
			              <p class="card-text">This is a short card.</p>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card h-100">
			            <img src="../resources/images/user/user_1077114.png" class="card-img-top" 
			            style="width: 470px; height: 300px;"alt="..." />
			            <div class="card-body">
			              <h5 class="card-title">
			               <a href="../info/infohome.jsp">
			              모임이름
			              </a>
			              </h5>
			              <p class="card-text">
			                This is a longer card with supporting text below as a natural
			                lead-in to additional content.
			              </p>
			            </div>
			          </div>
			        </div>
			        <div class="col">
			          <div class="card h-100">
			            <img src="../resources/images/LOGO.png" class="card-img-top" 
			            style="width: 470px; height: 300px;"alt="..." />
			            <div class="card-body">
			              <h5 class="card-title">
			               <a href="../info/infohome.jsp">
			              모임이름
			              </a>
			              </h5>
			              <p class="card-text">
			                This is a longer card with supporting text below as a natural
			                lead-in to additional content. This content is a little bit
			                longer.
			              </p>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			</div>

		</div>
	</div>
</body>
</html>