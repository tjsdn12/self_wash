<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">ManagerRegisterPage</h4>
					<div class="form-group row">
						<label for="mgrName"
							class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="mgrName" id="mgrName">
						</div>
					</div>
					<div class="form-group row">
						<label for="phone"
							class="col-sm-3 text-end control-label col-form-label">전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone">
						</div>
					</div>
					<div class="form-group row">
						<label for="email"
							class="col-sm-3 text-end control-label col-form-label">이메일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="email" name="email">
						</div>
					</div>
					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pw" name="pw">
						</div>
					</div>
					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호 확인</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwConrim" name="pwConfirm">
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="modifyBtn" class="btn btn-primary"
								onclick="save()">신청</button>
							<button type="button" id="cancelBtn" class="btn btn-primary"
								onclick="goList()">취소</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
<script>
	function save() {
		const data = $('#actionForm').serializeObject();
		if(data.pw != data.pwConfirm) {
			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return false;
		}
		$.ajax({
			url : '/common/login/register',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({
				manageManagerVO : data
			}),
			success : function onData(data) {
				alert('회원가입 요청이 완료되었습니다. 관리자 수락 후 로그인 바랍니다.');
				if (data.success) {
					location.href = '/common/login/login';
				}
			},
			error : function onError(error) {
				console.error(error);
			}
		});
	}
	
	function goList() {
		location.href= 'common/login/login';
	}
</script>