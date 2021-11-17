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
			<div class="card-body">
			<form class="form-horizontal" id="actionForm" 
				action="/equipment/model/list" method="get">
				<input type="hidden" id="equipmentType" name="equipmentType" value='<c:out value="${equipmentModelVO.equipmentType }"></c:out>' />
				<input type="hidden" id="equipmentModelId" name="equipmentModelId" value='<c:out value="${equipmentModelVO.equipmentModelId }"></c:out>' />
					<h4 class="card-title">EquipmentModelDetailPage</h4>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비관리번호</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentModelId }'></c:out>
					</div>
				</div>
					<div class="form-group row">
						<label for="equipmentName"
							class="col-sm-3 text-end control-label col-form-label">장비명</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentName }'></c:out>
						</div>
					</div>
						<div class="form-group row">
						<label for="manufacturingCompany"
							class="col-sm-3 text-end control-label col-form-label">제조회사이름</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.manufacturingCompany }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="manufacturerNumber"
							class="col-sm-3 text-end control-label col-form-label">제조회사전화번호</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.manufacturerNumber }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="categoryId"
							class="col-sm-3 text-end control-label col-form-label">카테고리번호</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.categoryId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="repairer"
							class="col-sm-3 text-end control-label col-form-label">수리처</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.repairer }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="repairerNumber"
							class="col-sm-3 text-end control-label col-form-label">수리처 전화번호</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.repairerNumber }'></c:out>
						</div>
					</div>
				
					<div class="form-group row">
						<label for="equipmentPhoto"
							class="col-sm-3 text-end control-label col-form-label">장비사진</label>
						<div class="col-sm-9">
							<img src="<c:out value='${equipmentModelVO.equipmentPhoto }'></c:out>" style="width:300px" />
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentSpec"
							class="col-sm-3 text-end control-label col-form-label">장비스펙</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentSpec }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentSpec"
							class="col-sm-3 text-end control-label col-form-label">용량</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.capacityGbName }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentSpec"
							class="col-sm-3 text-end control-label col-form-label">장비유형</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentTypeName }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">세탁메뉴</label>
						<div class="col-sm-9">
						<input type="button" value="세탁메뉴 관리"
								class="btn-info" onclick="washModalShow()">
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
</div>

<%@include file="/WEB-INF/views/includes/modal.jsp"%>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>


<script type="text/javascript">
	function washMenuAdd() {
		const equipmentType = $('#equipmentType').val();
		$('#modalSubmitBtn').show();
		$('#modalAddBtn').hide();
		$('#modalAddBtn2').show();
		$('.modal .modal-body').load('/equipment/model/popup/register?equipmentType='+equipmentType);
	}
	function washSave() {
		const checkedList = $('.listCheckbox').filter((idx,obj) => $(obj).prop('checked')).map((a,b)=>$(b).val()).toArray();
		const equipmentModelId = $('#equipmentModelId').val();
		$.ajax({
			url : '/equipment/model/popup/insert',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({equipmentModelId,addEquipmentWashMenuList: checkedList}),
			success : function onData(data) {
				if(data.success) {
					washModalShow();
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
		
	}
	function init() {
		$('.modal-body').css('overflow-y','scroll');
		//$('.modal-body').css('overflow-y','hidden');
		$('.modal-body').css('height','700px');
		$('.modal-dialog').css('max-width','800px');
		$('.modal-dialog').css('width','800px');
		$('#modalSubmitBtn').html('저장');
		$('#modalAddBtn').html('추가');
		$('#modalAddBtn2').html('목록');
		$('#modalSubmitBtn').click(washSave);
		$('#modalAddBtn').click(washMenuAdd);
		$('#modalAddBtn2').click(washModalShow);
	}
	
	$(document).ready( () => {
		init();
	});
	
	function washModalShow() {
		$('#modalSubmitBtn').hide();
		$('#modalAddBtn').show();
		$('#modalAddBtn2').hide();
		const equipmentModelId = $('#equipmentModelId').val();
		$('.modal .modal-body').load('/equipment/model/popup/list?perSheet=100&equipmentModelId='+equipmentModelId);
		$('.modal').show();
	}
	function modalHide() {
		$('.modal').hide();
	}
	
	function deleteWashMenuMapping(id) {
		$.ajax({
			url : '/equipment/model/popup/list',
			type : 'DELETE',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({menuEquipmentMappingId: id}),
			success : function onData(data) {
				if(data.success) {
					washModalShow();
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
		
	}
	

	function goList(){
		const form = document.querySelector("#actionForm");
		form.action = "/equipment/model/list";
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
				form.action = "/equipment/model/form";
				document.querySelector("#actionForm").submit();
			});


	</script>

