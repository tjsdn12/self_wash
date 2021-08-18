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
			<form class="form-horizontal" id="actionForm" action="/equipment/manage/list"
				method="get">
				<div class="card-body">
					<h4 class="card-title">EquipmentManageDetailPage</h4>
					<div class="form-group row">
						<label for="equipmentCode"
							class="col-sm-3 text-end control-label col-form-label">장비코드</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="equipmentCode"
								id="equipmentCode"
								value="<c:out value='${EquipmentManageDTO.equipmentCode }'></c:out>"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group row">
						<label for="tptb"
							class="col-sm-3 text-end control-label col-form-label">책임자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="tptb"
								id="tptb"
								value="<c:out value='${EquipmentManageDTO.tptb }'></c:out>"
								>
						</div>
					</div>

						<div class="form-group row">
					<label for="authorLevel"
						class="col-sm-3 text-end control-label col-form-label">장비관리유무</label>
					<div class="col-sm-9">
						<select name="authorLevel" id="authorLevel">
							<option value="ADMIN">관리유</option>
							<option value="MANAGER">관리무</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="equipmentStatus"
						class="col-sm-3 text-end control-label col-form-label">장비상태</label>
					<div class="col-sm-9">
						<select name="equipmentStatus" id="equipmentStatus">
							<option value="0">대기</option>
							<option value="1">사용</option>
							<option value="2">거절</option>
						</select>
					</div>
				</div>
					<div class="form-group row">
						<label for="equipmentModelId"
							class="col-sm-3 text-end control-label col-form-label">장비모델</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="equipmentModelId"
								name="equipmentModelId"
								value="<c:out value='${EquipmentManageDTO.equipmentModelId }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="regularInspectionDate"
							class="col-sm-3 text-end control-label col-form-label">장비정기점검일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="regularInspectionDate"
								name="regularInspectionDate"
								value="<c:out value='${EquipmentManageDTO.regularInspectionDate }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="purchasePrice"
							class="col-sm-3 text-end control-label col-form-label">장비구매가격</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="purchasePrice"
								name="purchasePrice"
								value="<c:out value='${EquipmentManageDTO.purchasePrice }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="purchaseDatetime"
							class="col-sm-3 text-end control-label col-form-label">장비구매일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="purchaseDatetime"
								name="purchaseDatetime"
								value="<c:out value='${EquipmentManageDTO.purchaseDatetime }'></c:out>"
								>
						</div>
					</div>
				
					

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goTables()">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>


<script type="text/javascript">
	
	function goTable(){
		let form = document.querySelector("#actionForm");
		form.action = "/equipment/manage/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#equipmentCode").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='equipmentCode' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>

