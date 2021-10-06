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
						<label for="mgrId"
							class="col-sm-3 text-end control-label col-form-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="mgrId" id="mgrId"
								value="<c:out value='${manageManagerVO.mgrId }'></c:out>" readonly="readonly"> 
						</div>
					</div>
					<div class="form-group row">
						<label for="pw"
							class="col-sm-3 text-end control-label col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="pw" name="pw"
								value="<c:out value='${manageManagerVO.pw }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="mgrName"
							class="col-sm-3 text-end control-label col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="mgrName" id="mgrName"
								value="<c:out value='${manageManagerVO.mgrName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="phone"
							class="col-sm-3 text-end control-label col-form-label">번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone"
								value="<c:out value='${manageManagerVO.phone }'></c:out>">
							<button class="phoneChk" type="button" id="phoneChk" onclick="phoneChking();" value="N">중복확인</button>
						</div>
					</div>
					<div class="form-group row">
						<label for="email"
							class="col-sm-3 text-end control-label col-form-label">메일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="email" name="email"
								value="<c:out value='${manageManagerVO.email }'></c:out>">
						</div>
					</div>
				<div class="form-group row">
					<label for="sId"
						class="col-sm-3 text-end control-label col-form-label">지점명</label>
					<div class="col-sm-9">
						<select name="sId" id="sId" >
	 						<option>::: 지점 선택하기 :::</option>
								<c:forEach items="${getStoreList }" var="item2">
									<option value="${item2.sId }">${item2.sName }</option>
								</c:forEach>
							</select>
					</div>
				</div>
				</div>
				<div class="form-group row">
					<label for="authorLevel"
						class="col-sm-3 text-end control-label col-form-label">관리자 등급</label>
					<div class="col-sm-9">
						<select name="authorLevel" id="authorLevel">
							<option value="ADMIN" <c:if test="${manageManagerVO.authorLevel == 'ADMIN'}">selected="selected"</c:if>>관리자</option>
							<option value="MANAGER" <c:if test="${manageManagerVO.authorLevel == 'MANAGER'}">selected="selected"</c:if>>지점 매니저</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="approvalStatus"
						class="col-sm-3 text-end control-label col-form-label">승인여부</label>
					<div class="col-sm-9">
						<select name="approvalStatus" id="approvalStatus">
							<option value="0" <c:if test="${manageManagerVO.approvalStatus == '0'}">selected="selected"</c:if>>대기</option>
							<option value="1" <c:if test="${manageManagerVO.approvalStatus == '1'}">selected="selected"</c:if>>승인</option>
							<option value="2" <c:if test="${manageManagerVO.approvalStatus == '2'}">selected="selected"</c:if>>거절</option>
						</select>
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" id="cancelBtn" class="btn btn-primary"
							onclick="goList()">목록</button>
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
			url : '/user/manager/register',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({manageManagerVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/user/manager/list';
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
						form.action = "/user/manager/register";
						document.querySelector("#actionForm").submit();
					});
	
	
	function phoneChking() {
		const data = $('#actionForm').serializeObject();
		$.ajax({
			url : '/user/manager/register',
			type : 'POST',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({manageManagerVO: data}),
			success : function onData(data) {
				alert(data.message);
				
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	


</script>