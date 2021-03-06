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
			action="/info/storeinfo/list" method="get">
			<input type="hidden" id="sId" name="sId" value='<c:out value="${storeInfoVO.sId }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">StoreInfoDetailPage</h4>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">매장번호</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.sId }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="sName"
							class="col-sm-3 text-end control-label col-form-label">상호명</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.sName }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="sLocation"
							class="col-sm-3 text-end control-label col-form-label">가게주소</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.sLocation }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="manager"
							class="col-sm-3 text-end control-label col-form-label">관리자</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.manager }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="attemptClassification"
							class="col-sm-3 text-end control-label col-form-label">시도구분</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.attemptClassification }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="cityCountyClassification"
							class="col-sm-3 text-end control-label col-form-label">시군구분</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.cityCountyClassification }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="businessNumber"
							class="col-sm-3 text-end control-label col-form-label">사업자 번호</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.businessNumber }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="managerResidentNumber"
							class="col-sm-3 text-end control-label col-form-label">관리자 주민번호</label>
						<div class="col-sm-9">
						<c:out value='${StoreInfoDTO.managerResidentNumber }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="postCode"
							class="col-sm-3 text-end control-label col-form-label">우편번호</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.postCode }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="postCode"
							class="col-sm-3 text-end control-label col-form-label">매장 가로 크기</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.storeWidth }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="postCode"
							class="col-sm-3 text-end control-label col-form-label">매장 세로 크기</label>
						<div class="col-sm-9">
							<c:out value='${storeInfoVO.storeHeight }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentModelId" class="col-sm-3 text-end control-label col-form-label">매장 장비 배치</label>
						<div class="col-sm-9">
						<input type="button" value="장비 배치 수정" class="btn-info" onclick="modalShow()">
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
						<c:if test="${loginInfo.authorLevel == 'ADMIN' }">
							<button type="button" id="modifyBtn" class="btn btn-primary">수정</button></c:if>
							<button type="button" id="listBtn" class="btn btn-primary"
								onclick="goTable()">목록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>


	<script type="text/javascript">
	
	function init() {
		$('#modalSubmitBtn').hide();
		$('#modalAddBtn').hide();
		$('#modalAddBtn2').hide();
		$('.modal-body').css('overflow-y','scroll');
		//$('.modal-body').css('overflow-y','hidden');
		$('.modal-body').css('height','700px');
		$('.modal-dialog').css('max-width','1500px');
		$('.modal-dialog').css('width','1500px');
	}
	
	$(document).ready( () => {
		init();
	});
	
	function modalShow() {
		const sId = $('#sId').val();
		$('#modalSubmitBtn').hide();
		$('.modal .modal-body').load('/info/storeinfo/popup/detail?sId='+sId);
		$('.modal').show();
	}
	
	function modalHide() {
		$('.modal').hide();
	}
	
	function goTable(){
		let form = document.querySelector("#actionForm");
		form.action = "/info/storeinfo/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document
	.querySelector("#modifyBtn")
	.addEventListener(
			"click",
			function(e) {
				const form = document.querySelector("#actionForm");
				form.action = "/info/storeinfo/form";
				document.querySelector("#actionForm").submit();
			});
	</script>

