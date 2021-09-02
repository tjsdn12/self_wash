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
			<form class="form-horizontal" id="actionForm" action="/info/storeinfo/list"
				method="get">
				<div class="card-body">
					<h4 class="card-title">StoreInfoDetailPage</h4>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">매장번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="sId"
								id="sId"
								value="<c:out value='${StoreInfoDTO.sId }'></c:out>"
								readonly="readonly">
						</div>
					</div>

					<div class="form-group row">
						<label for="sName"
							class="col-sm-3 text-end control-label col-form-label">상호명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="sName"
								id="sName"
								value="<c:out value='${StoreInfoDTO.sName }'></c:out>"
								>
						</div>
					</div>

					<div class="form-group row">
						<label for="sLocation"
							class="col-sm-3 text-end control-label col-form-label">가게주소</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="sLocation"
								name="sLocation"
								value="<c:out value='${StoreInfoDTO.sLocation }'></c:out>"
								>
						</div>
					</div>

					<div class="form-group row">
						<label for="manager"
							class="col-sm-3 text-end control-label col-form-label">관리자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="manager"
								name="manager"
								value="<c:out value='${StoreInfoDTO.manager }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="attemptClassification"
							class="col-sm-3 text-end control-label col-form-label">시도구분</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="attemptClassification"
								name="attemptClassification"
								value="<c:out value='${StoreInfoDTO.attemptClassification }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="cityCountyClassification"
							class="col-sm-3 text-end control-label col-form-label">시군구분</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="cityCountyClassification"
								name="cityCountyClassification"
								value="<c:out value='${StoreInfoDTO.cityCountyClassification }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="businessNumber"
							class="col-sm-3 text-end control-label col-form-label">사업자 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="businessNumber"
								name="businessNumber"
								value="<c:out value='${StoreInfoDTO.businessNumber }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="managerResidentNumber"
							class="col-sm-3 text-end control-label col-form-label">관리자 주민번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="managerResidentNumber"
								name="managerResidentNumber"
								value="<c:out value='${StoreInfoDTO.managerResidentNumber }'></c:out>"
								>
						</div>
					</div>
					<div class="form-group row">
						<label for="postCode"
							class="col-sm-3 text-end control-label col-form-label">우편번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="postCode"
								name="postCode"
								value="<c:out value='${StoreInfoDTO.postCode }'></c:out>"
								>
						</div>
					</div>

				</div>

				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="goTable()">취소</button>
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
		form.action = "/info/storeinfo/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#sId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='sId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>

