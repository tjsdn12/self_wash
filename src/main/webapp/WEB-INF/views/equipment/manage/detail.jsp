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
			<input type="hidden" name="equipmentCode" value='<c:out value="${equipmentManageVO.equipmentCode }"></c:out>' />
				<div class="card-body">
					<h4 class="card-title">EquipmentManageDetailPage</h4>
					<div class="form-group row">
						<label for="equipmentCode"
							class="col-sm-3 text-end control-label col-form-label">장비코드</label>
						<div class="col-sm-9">
								<c:out value='${equipmentManageVO.equipmentCode }'></c:out>
						</div>
					</div>

					<div class="form-group row">
						<label for="tptb"
							class="col-sm-3 text-end control-label col-form-label">책임자</label>
						<div class="col-sm-9">
							<c:out value='${equipmentManageVO.tptb }'></c:out>
						</div>
					</div>
						<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비모델</label>
						<div class="col-sm-9">
							<c:out value='${equipmentManageVO.equipmentModelId }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="regularInspectionDate"
							class="col-sm-3 text-end control-label col-form-label">장비정기점검일자</label>
						<div class="col-sm-9">
							<c:out value='${equipmentManageVO.regularInspectionDate }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="purchasePrice"
							class="col-sm-3 text-end control-label col-form-label">장비구매가격</label>
						<div class="col-sm-9">
							<c:out value='${equipmentManageVO.purchasePrice }'></c:out>
						</div>
					</div>
					<div class="form-group row">
						<label for="purchaseDatetime"
							class="col-sm-3 text-end control-label col-form-label">장비구매일자</label>
						<div class="col-sm-9">
							<c:out value='${equipmentManageVO.purchaseDatetime }'></c:out>
						</div>
					</div>
						<div class="form-group row">
					<label for="regularInspection"
						class="col-sm-3 text-end control-label col-form-label">장비관리유무</label>
					<div class="col-sm-9">
						<c:choose>
						<c:when test="${equipmentManageVO.regularInspection == 'care' }">
						관리유</c:when>
						<c:otherwise>관리무</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="form-group row">
					<label for="equipmentStatus"
						class="col-sm-3 text-end control-label col-form-label">장비상태</label>
					<div class="col-sm-9">
						<c:choose>
						<c:when test="${equipmentManageVO.equipmentStatus == 'standby' }">대기</c:when>
						<c:when test="${equipmentManageVO.equipmentStatus == 'useable' }">사용</c:when>
						<c:otherwise>거절</c:otherwise>
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
	
	function goList(){
		let form = document.querySelector("#actionForm");
		form.action = "/equipment/manage/list";
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
				form.action = "/equipment/manage/form";
				document.querySelector("#actionForm").submit();
			});
	</script>

