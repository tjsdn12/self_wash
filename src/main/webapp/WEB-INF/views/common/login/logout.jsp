<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<form class="form-horizontal" id="actionForm">
					<div class="card-body">
						<h4 class="card-title">LogoutPage</h4>
						<div class="form-group row">
							<label for="phone"
								class="col-sm-3 text-end control-label col-form-label">휴대폰번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="phone"
									id="phone">
							</div>
						</div>
						<div class="form-group row">
							<label for="pw"
								class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="pw" id="pw">
							</div>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="logoutBtn" class="btn btn-primary"
								onclick="logout()">로그아웃</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>

function logout() {
	const data = $('#actionForm').serializeObject();
	$.ajax({
		url : '/common/login/logout',
		type : 'POST',
		//응답 받고 
		headers : { // Http header
			// 요청 보낼때 내가 보낼 data의 타입
			"Content-Type" : "application/json",
		},
		//
		dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
		data : JSON.stringify(data),
		success : function onData(data) {
			alert(data.message);
			if(data.success) {
				location.href = '/info/storeinfo/list';
			}
		},
		error : function onError(error) {
			console.log("AA");
			console.error(error);
		}
	});
}



</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
