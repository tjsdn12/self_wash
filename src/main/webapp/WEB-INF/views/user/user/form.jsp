<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">UserformPage</h4>
					<div class="form-group row">
						<label for="memId"
							class="col-sm-3 text-end control-label col-form-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memId" id="memId"
								value="<c:out value='${manageUserVO.memId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="memName"
							class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="memName" id="memName"
								value="<c:out value='${manageUserVO.memName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="phone"
							class="col-sm-3 text-end control-label col-form-label">전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone"
								value="<c:out value='${manageUserVO.phone }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="kakaoAuthorizationKey"
							class="col-sm-3 text-end control-label col-form-label">카카오
							인증</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="kakaoAuthorizationKey" name="kakaoAuthorizationKey"
								value="<c:out value='${manageUserVO.kakaoAuthorizationKey }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="pw" name="pw"
								value="<c:out value='${manageUserVO.pw }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="joinDate"
							class="col-sm-3 text-end control-label col-form-label">가입일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="joinDate" name="joinDate" 
								value="<c:out value='${manageUserVO.joinDate }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="amountCharge"
							class="col-sm-3 text-end control-label col-form-label">충전금액</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="amountCharge"
								name="amountCharge"
								value="<c:out value='${manageUserVO.amountCharge }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="point"
							class="col-sm-3 text-end control-label col-form-label">회원포인트</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="point" name="point"
								value="<c:out value='${manageUserVO.point }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="dateOfUse"
							class="col-sm-3 text-end control-label col-form-label">이용일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="dateOfUse" name="dateOfUse" 
								value="<c:out value='${manageUserVO.dateOfUse }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="memStatus"
							class="col-sm-3 text-end control-label col-form-label">회원상태</label>
						<div class="col-sm-9">
							<select name="memStatus" id="memStatus">
								<option value="HUMEN" selected="selected">휴먼회원</option>
								<option value="DROPOUT" selected="selected">탈퇴회원</option>
							</select>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="modifyBtn" class="btn btn-primary"
								onclick="save()">저장</button>
							<button type="button" id="cancelBtn" class="btn btn-primary"
								onclick="goList()">취소</button>
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
		$.ajax({
			url : '/user/user/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({
				manageUserVO : data
			}),
			success : function onData(data) {
				alert(data.message);
				if (data.success) {
					location.href = '/user/user/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	function goList() {
		const form = document.querySelector("#actionForm");
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