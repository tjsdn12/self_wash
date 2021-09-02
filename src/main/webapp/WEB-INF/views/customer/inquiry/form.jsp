<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-md-6">
		<div class="card">
			<form class="form-horizontal" id="actionForm">
				<div class="card-body">
					<h4 class="card-title">InquiryformPage</h4>
					<div class="form-group row">
						<label for="inquiryId"
							class="col-sm-3 text-end control-label col-form-label">일대일 문의번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="inquiryId" readonly="readonly" id="inquiryId"
								value="<c:out value='${InquiryDTO.inquiryId }'></c:out>" >
						</div>
					</div>
					<div class="form-group row">
						<label for="mgrId"
							class="col-sm-3 text-end control-label col-form-label">관리자 번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="mgrId" id="mgrId"
								placeholder="<c:out value='${InquiryDTO.mgrId }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaTitle"
							class="col-sm-3 text-end control-label col-form-label">문의 제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="qnaTitle" name="qnaTitle"
								placeholder="<c:out value='${InquiryDTO.qnaTitle }'></c:out>">
						</div>
					</div>
					<div class="form-group row">
						<label for="qnaContents"
							class="col-sm-3 text-end control-label col-form-label">문의 내용</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="qnaContents" name="qnaContents"
								placeholder="<c:out value='${InquiryDTO.qnaContents }'></c:out>">
						</div>
					</div>
			<div class="form-group row">
					<label for="classification"
						class="col-sm-3 text-end control-label col-form-label">문의사항 분류</label>
					<div class="col-sm-9">
						<select name="classification" id="classification">
							<option value="MANAGER">매니져 회원문의</option>
							<option value="USER">사용자 회원문의</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="memId"
						class="col-sm-3 text-end control-label col-form-label">회원 아이디</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="joinDate" name="memId" readonly="memId"
							placeholder="<c:out value='${InquiryDTO.memId }'></c:out>">							
					</div>
				</div>
					<div class="form-group row">
					<label for="replyContent"
						class="col-sm-3 text-end control-label col-form-label">답변 제목</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="replyContent" name="replyContent"
							placeholder="<c:out value='${InquiryDTO.replyContent }'></c:out>">
					</div>
				</div>
					<div class="form-group row">
					<label for="replyTitle"
						class="col-sm-3 text-end control-label col-form-label">답변 내용</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="replyTitle" name="replyTitle"
							placeholder="<c:out value='${InquiryDTO.replyTitle }'></c:out>">
					</div>
				</div>
					<div class="form-group row">
					<label for="dateOfInquiry"
						class="col-sm-3 text-end control-label col-form-label">등록일시</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="dateOfInquiry" name="dateOfInquiry" readonly="readonly"
							placeholder="<c:out value='${InquiryDTO.dateOfInquiry }'></c:out>">
					</div>
				</div>
					</div>
					<div class="form-group row">
					<label for="answerDate"
						class="col-sm-3 text-end control-label col-form-label">답변일시</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="answerDate" name="answerDate" readonly="readonly"
							placeholder="<c:out value='${InquiryDTO.answerDate }'></c:out>">
					</div>
				</div>
							<div class="form-group row">
					<label for="answerId"
						class="col-sm-3 text-end control-label col-form-label">관리자 아이디</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="answerId" name="answerId" readonly="readonly"
							placeholder="<c:out value='${InquiryDTO.answerId }'></c:out>">
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
				<div class="border-top">
					<div class="card-body">
						<button type="button" id="modifyBtn" class="btn btn-primary" onclick="save()">저장</button>
						<button type="button" id="cancelBtn" class="btn btn-primary"
							onclick="goLists()">취소</button>
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
			url : '/customer/inquiry/form',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({inquiryVO: data}),
			success : function onData(data) {
				alert(data.message);
				if(data.success) {
					location.href = '/customer/inquiry/list';
				}
			},
			error : function onError(error) {
				console.log("AA");
				console.error(error);
			}
		});
	}
	
</script>