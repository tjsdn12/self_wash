<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm" 
			action="/user/user/list" method="get">
			<input type="hidden" name="memId" value='<c:out value="${manageUserVO.memId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">UserDetail Page</h4>
					<div class="form-group row">
						<label for="memId"
							class="col-sm-3 text-end control-label col-form-label">아이디</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.memId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="memName"
							class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.memName }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="phone"
							class="col-sm-3 text-end control-label col-form-label">전화번호</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.phone }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="kakaoAuthorizationKey"
							class="col-sm-3 text-end control-label col-form-label">카카오인증</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.kakaoAuthorizationKey }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.pw }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="memStatus"
							class="col-sm-3 text-end control-label col-form-label">회원상태</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${manageUserVO.memStatus =='HUMEN' }">휴면회원
							</c:when>
								<c:otherwise>탈퇴회원</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group row">
						<label for="joinDate"
							class="col-sm-3 text-end control-label col-form-label">가입날자</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.joinDate }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="amoutCharge"
							class="col-sm-3 text-end control-label col-form-label">충전금액</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.amountCharge }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="point"
							class="col-sm-3 text-end control-label col-form-label">회원포인트</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.point }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="dateOfUse"
							class="col-sm-3 text-end control-label col-form-label">이용일자</label>
						<div class="col-sm-9">
							<c:out value='${manageUserVO.dateOfUse }'></c:out>
						</div>
					</div>
				</div>
		</div>
		<div class="border-top">
			<div class="card-body">
				<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
				<button type="button" id="tablesBtn" class="btn btn-primary"
					onclick="goList()">목록</button>
			</div>
		</div>
		</form>
	</div>
</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>



<script type="text/javascript">
	function goList() {
		let form = document.querySelector("#actionForm");
		form.action = "/user/user/list";
		form.method = "get";
		form.innerHTML = "";
		form.submit();
	}

	document
			.querySelector("#modifyBtn")
			.addEventListener(
					"click",
					function(e) {
						const form = document.querySelector("#actionForm");
						form.action = "/user/user/form";
						document.querySelector("#actionForm").submit();
					});

</script>



