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
			<form class="form-horizontal" id="actionForm" action="/inquiry/form" method="get" >
				<div class="card-body">
					<h4 class="card-title">InquiryDetail Page</h4>
					<div class="form-group row">
						<label for="inquiryId" class="col-sm-3 text-end control-label col-form-label">일대일 문의번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="inquiryId" id="inquiryId" value="<c:out value='${InquiryDTO.inquiryId }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="mgrId" class="col-sm-3 text-end control-label col-form-label">관리자 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="mgrId" id="mgrId" value="<c:out value='${InquiryDTO.mgrId }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaTitle" class="col-sm-3 text-end control-label col-form-label">문의제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="<c:out value='${InquiryDTO.qnaTitle }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaContents" class="col-sm-3 text-end control-label col-form-label">문의 내용</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="qnaContents" name="qnaContents" value="<c:out value='${InquiryDTO.qnaContents }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
					<label for="classification"
						class="col-sm-3 text-end control-label col-form-label">문의 사항 분류</label>
					<div class="col-sm-9">
						<select name="classification" id="classification">
							<option value="MANAGER">매니져 회원문의</option>
							<option value="USER">사용자 회원문의</option>
						</select>
					</div>
				</div>
					<div class="form-group row">
						<label for="inquiryId" class="col-sm-3 text-end control-label col-form-label">회원아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="inquiryId" name="inquiryId" value="<c:out value='${InquiryDTO.inquiryId }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="replyContent" class="col-sm-3 text-end control-label col-form-label">답변제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="replyContent" name="replyContent" value="<c:out value='${InquiryDTO.replyContent }'></c:out>"
							>
						</div>
						</div>
						<div class="form-group row">
						<label for="replyTitle" class="col-sm-3 text-end control-label col-form-label">답변내용</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="replyTitle" name="replyTitle" value="<c:out value='${InquiryDTO.replyTitle }'></c:out>"
							>
						</div>
					</div>
					<div class="form-group row">
						<label for="dateOfInquiry" class="col-sm-3 text-end control-label col-form-label">등록일시</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="dateOfInquiry" name="dateOfInquiry" value="<c:out value='${InquiryDTO.dateOfInquiry }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="answerDate" class="col-sm-3 text-end control-label col-form-label">답변일시</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="answerDate" name="answerDate" value="<c:out value='${InquiryDTO.answerDate }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="answerId" class="col-sm-3 text-end control-label col-form-label">관리자 아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="answerId" name="answerId" value="<c:out value='${InquiryDTO.answerId }'></c:out>"
							readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
					<label for="whetherItIsPrivate"
						class="col-sm-3 text-end control-label col-form-label">비공개 여부</label>
					<div class="col-sm-9">
						<select name="whetherItIsPrivate" id="whetherItIsPrivate">
							<option value="0">공개</option>
							<option value="1">비공개</option>
						</select>
					</div>
				</div>
					</div>
				</div>
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" >수정</button>
						<button type="button" id="tablesBtn" class="btn btn-primary" onclick="goTables()">확인</button>
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
		form.action = "/customer/inquiry/list";
		form.method = "get";
		form.innerHTML="";
		form.submit();
	}
	
	
	
	document.querySelector("#modifyBtn").addEventListener("click",function(e){
		const value = document.querySelector("#inquiryId").value;
		document.querySelector("#actionForm").innerHTML = 
			"<input type='hidden' name='inquiryId' value='"+value+"' />"
		
		document.querySelector("#actionForm").submit();
	})
	
	
	document.querySelector("#tablesBtn").addEventListener("click",function (e){
		goTable();
	},false);
	</script>



