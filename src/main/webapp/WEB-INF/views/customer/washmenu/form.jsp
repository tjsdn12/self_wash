<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">WashMenuformPage</h4>
					<div class="form-group row">
						<label for="washMenuId"
							class="col-sm-3 text-end control-label col-form-label">주문메뉴 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="washMenuId" id="washMenuId"
								value="<c:out value='${washMenuVO.washMenuId }'></c:out>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuPrice"
							class="col-sm-3 text-end control-label col-form-label">상품가격</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="menuPrice" id="menuPrice"
								value="<c:out value='${washMenuVO.menuPrice }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="menuName" name="menuName"
								value="<c:out value='${washMenuVO.menuName }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">헹굼횟수</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="rinsingCnt" name="rinsingCnt"
								value="<c:out value='${washMenuVO.rinsingCnt }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">세탁기 용량</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="weight" name="weight"
								value="<c:out value='${washMenuVO.weight }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">탈수 횟수</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="dehydrationCnt" name="dehydrationCnt"
								value="<c:out value='${washMenuVO.dehydrationCnt }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">물 종류</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="waterType" name="waterType"
								value="<c:out value='${washMenuVO.waterType }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">소요 시간</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="time" name="time"
								value="<c:out value='${washMenuVO.time }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="menuName"
							class="col-sm-3 text-end control-label col-form-label">메뉴 설명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="menuDesc" name="menuDesc"
								value="<c:out value='${washMenuVO.menuDesc }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="equipmentType"
							class="col-sm-3 text-end control-label col-form-label">장비 유형</label>
						<div class="col-sm-9">
							<select name="equipmentType" id="equipmentType">
								<option value="1" <c:if test="${washMenuVO.equipmentType == '1'}">selected="selected"</c:if>>세탁기</option>
								<option value="2" <c:if test="${washMenuVO.equipmentType == '2'}">selected="selected"</c:if>>건조기</option>
								<option value="3" <c:if test="${washMenuVO.equipmentType == '3'}">selected="selected"</c:if>>신발세탁기</option>
								<option value="4" <c:if test="${washMenuVO.equipmentType == '4'}">selected="selected"</c:if>>세탁건조기</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="sId"
							class="col-sm-3 text-end control-label col-form-label">카테고리</label>
						<div class="col-sm-9">
							<select name="categoryId" id="categoryId" >
		 						<option>::: 카테고리 선택하기 :::</option>
									<c:forEach items="${getCategoryList }" var="item2">
										<option value="${item2.categoryId }" <c:if test="${item2.categoryId==washMenuVO.categoryId}">selected="selected"</c:if>>
										${item2.largeCategoryName } > ${item2.middleCategoryName }
										<c:if test="${item2.smallCategoryName != null and item2.smallCategoryName != '' }"> 
										>
										${item2.smallCategoryName }
										</c:if>
										</option>
									</c:forEach>
								</select>
						</div>
					</div>
					<div class="border-top">
						<div class="card-body">
							<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
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
		$.ajax({
			url : '/customer/washmenu/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({washMenuVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/customer/washmenu/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	function change(style) {
	    
		   if( style == "selectBox01" )
			   {
		       view1.style.display = "inline"
			   view2.style.display = "none"
			   view3.style.display = "none"
			   }
		   if( style == "selectBox02" )
		      {
		       view1.style.display = "none"
			   view2.style.display = "inline"
			   view3.style.display = "none"
			   }
			if( style == "selectBox04" )
		      {
		       view1.style.display = "none"
			   view2.style.display = "none"
			   view3.style.display = "none"
			   }
		   	}
	
	function goList() {
		const form = document.querySelector("#actionForm");
		form.action = "/customer/washmenu/list";
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
						form.action = "/customer/washmenu/form";
						document.querySelector("#actionForm").submit();
					});

	
</script>