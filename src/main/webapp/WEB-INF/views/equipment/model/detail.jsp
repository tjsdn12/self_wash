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
				action="/equipment/manage/list" method="get">
				<input type="hidden" name="equipmentModelId" value='<c:out value="${equipmentModelVO.equipmentModelId }"></c:out>' />
				<div class="card-body">
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
					<label for="exposureYesNo"
						class="col-sm-3 text-end control-label col-form-label">소비자 노출여부</label>
					<div class="col-sm-9">
						<c:choose>
						<c:when test="${equipmentModelVO.exposureYesNo == 'nonexpose'} }">
						비노출</c:when>
						<c:otherwise>노출</c:otherwise>
						</c:choose>
					</div>
				</div>
				
					<div class="form-group row">
						<label for="equipmentPhoto"
							class="col-sm-3 text-end control-label col-form-label">장비사진</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentPhoto }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentSpec"
							class="col-sm-3 text-end control-label col-form-label">장비스펙</label>
						<div class="col-sm-9">
							<c:out value='${equipmentModelVO.equipmentSpec }'></c:out>
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

