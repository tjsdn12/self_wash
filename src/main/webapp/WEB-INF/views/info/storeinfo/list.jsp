<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="dropdown">
					<button type="button"
						class="btn btn-success dropdown-toggle text-white"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Sheet</button>
					<div class="dropdown-menu" style="margin: 0px;">
						<a class="dropdown-item" href="10">10</a> <a class="dropdown-item"
							href="20">20</a> <a class="dropdown-item" href="50">50</a> <a
							class="dropdown-item" href="100">100</a>
					</div>
					<h3 class="card-title mb-0" style="margin-left: 50px">StoreList</h3>
				</div>
			</div>
			
			<div class="form-group row">
						<label for="sName"
							class="col-sm-3 text-end control-label col-form-label">매장찾기</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="sName" id="sName"
								value="<c:out value='${storeInfoVO.sName }'></c:out>">
								<button class="search" type="button" id="search" onclick="search();" value="N">검색</button>

						</div>
					</div>
			
			<div class="list-responsive">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<c:if test="${loginInfo.authorLevel == 'ADMIN' }">
							<th>
							<label class="customcheckbox mb-3"> <input
									type="checkbox" id="mainCheckbox" /> <span class="checkmark"></span>
							</label></th></c:if>
							<th scope="col">매장번호</th>
							<th scope="col">상호명</th>
							<th scope="col">가게주소</th>
							<th scope="col">관리자</th>
							<th scope="col">시도구분</th>
							<th scope="col">시군구분</th>
							<th scope="col">사업자 번호</th>
							<th scope="col">관리자 주민번호</th>
							<th scope="col">우편번호</th>
							<th scope="col">
							<c:if test="${loginInfo.authorLevel == 'ADMIN' }">
							<input type="button" value="매장등록"
								class="btn-info" onclick="location.href='/info/storeinfo/register'">
								</c:if>
							</th>
						</tr>
					</thead>

					<tbody class="customtable">
						<c:forEach items="${getAllStoreInfoList }" var="item2">
							<tr>
								<c:if test="${loginInfo.authorLevel == 'ADMIN' }">
								<td><label class="customcheckbox"> <input
										type="checkbox" class="listCheckbox" value="${item2.sId }" />
										<span class="checkmark"></span></c:if>
								</label></td>
								<td><a href="#" onclick="goSelect(this)">${item2.sId }</a></td>
								<td>${item2.sName }</td>
								<td>${item2.sLocation }</td>
								<td>${item2.manager }</td>
								<td>${item2.attemptClassification }</td>
								<td>${item2.cityCountyClassification }</td>
								<td>${item2.businessNumber }</td>
								<td>${item2.managerResidentNumber }</td>
								<td>${item2.postCode }</td>
								<td>
					<div class="card-body">
					<c:if test="${loginInfo.authorLevel == 'ADMIN'}">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="deletesId(<c:out value='${item2.sId }'/>)">삭제</button>
						</c:if>
					</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-5">
		<div class="dataTables_info" id="zero_config_info">
		<input type="button" class="btn btn-danger btn-sm text-white" value="Unabled toggle" onclick="" >
		</div>
	</div>
	<div class="col-sm-12 col-md-7">
		<div class="dataTables_paginate paging_simple_numbers"
			id="zero_config_paginate">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
				<li class="paginate_button page-item previous"
					id="zero_config_previous"><a href="${pageMaker.start-1 }"
					aria-controls="zero_config"  tabindex="0"
					class="page-link">Previous</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.start }" end="${pageMaker.end }" var="i">
					<li class="paginate_button page-item ${pageMaker.pageDTO.page==i ? 'active':''}"><a href="${i }"
						aria-controls="zero_config" data-dt-idx="${i }" tabindex="0"
						class="page-link">${i }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
				<li class="paginate_button page-item next" id="zero_config_next"><a
					href="${pageMaker.end +1}" aria-controls="zero_config"  tabindex="0"
					class="page-link">Next</a></li>
				</c:if>
				
			</ul>
			<h6>Showing ${pageMaker.start } to ${pageMaker.end } of ${pageMaker.realEnd } entries</h6>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/modal.jsp"%>

<form id="actionForm" action="/storeinfo/list" method="get" >
	<input type="hidden" name="page" value="${pageMaker.pageDTO.page }" class="current_page">
	<input type="hidden" name="perSheet" value="${pageMaker.pageDTO.perSheet }" class="current_perSheet">
</form>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>

<script type="text/javascript">

document.querySelectorAll(".page-link").forEach(a=>{
	   a.addEventListener("click",function (e){
	       e.preventDefault();
	       e.stopPropagation();
	       document.querySelector(".current_page").value = a.getAttribute('href');
	       document.querySelector("#actionu").submit();
	   },false)
	});
	function goSelect(dom){
		console.log(dom);
		const sId =dom.innerHTML;
		
		const form =document.querySelector("#actionForm");
		
		form.action ="/info/storeinfo/detail";
		
		form.method = "get";
		
		form.innerHTML = "<input type ='hidden' name ='sId' value='"+sId+"' />";
		
		form.submit();
		
	}
	
	function deletesId(sId) {
		const data = $('#actionForm').serializeObject();
		$.ajax({
			url : '/info/storeinfo/list',
			type : 'Delete',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({storeInfoVO: {sId:sId}}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.replace();
					//새로고침
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
	function search(){
		console.log();
		
		const sName =document.querySelector("#sName").value;
		
		const form =document.querySelector("#actionForm");
		
		form.action ="/info/storeinfo/list";
		
		form.method = "get";
		
		form.innerHTML = "<input type ='hidden' name ='sName' value='"+sName+"' />";
		
		form.submit();
		
	}
	

</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>