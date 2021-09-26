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
				action="/user/manager/list" method="get">
				<input type="hidden" name="mgrId" value='<c:out value="${manageManagerVO.mgrId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">ManagerDetailPage</h4>
					<div class="form-group row">
						<label for="mgrId"
							class="col-sm-3 text-end control-label col-form-label">아이디</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.mgrId }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.pw }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="mgrName"
							class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.mgrName }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="phone"
							class="col-sm-3 text-end control-label col-form-label">전화번호</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.phone }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="email"
							class="col-sm-3 text-end control-label col-form-label">메일</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.email }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">지점명</label>
						<div class="col-sm-9">
							<c:out value='${manageManagerVO.sName }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="authorLevel"
							class="col-sm-3 text-end control-label col-form-label">관리자
							등급</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${manageManagerVO.authorLevel == 'ADMIN' }">
					관리자
					</c:when>
								<c:otherwise>
					매니저
					</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group row">
						<label for="approvalStatus"
							class="col-sm-3 text-end control-label col-form-label">승인여부</label>
						<div class="col-sm-9">
							<c:choose>
								<c:when test="${manageManagerVO.approvalStatus == '0'} }">
						대기
						</c:when>
								<c:when test="${manageManagerVO.approvalStatus == '2'} }">
						거절
						</c:when>
								<c:otherwise>
						승인
						</c:otherwise>
							</c:choose>
						</div>
					</div>


				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
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
		const form = document.querySelector("#actionForm");
		form.action = "/user/manager/list";
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
						form.action = "/user/manager/form";
						document.querySelector("#actionForm").submit();
					});
</script>

