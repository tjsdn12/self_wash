<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.draggable-aside {
	position:fixed;
	width:150px;
	height:650px;
	overflow-y:scroll;
	}
	.draggable-aside ul {
	list-style: none;
	padding:0px;
	}
	.draggable-aside li {
	background:#EDEDED;
	border: #4444 solid 1px;
	width:120px;
	height:100px;
	}
	.draggable-table{
		padding: 10px;
		position:relative;
		margin-left:170px;
	}
	.draggable-table td {
	width:150px;
	height:150px;
	border: #4444 solid 1px;
	}
</style>
<aside class="draggable-aside" draggable="true">
	<nav>
		<ul>
			<c:forEach items="${equipmentList}" var="item">
			<li draggable="true" data-equipment-code="${item.equipmentCode}"><h4>${item.equipmentCode}. ${item.equipmentName}</h4>${item.equipmentTypeName}</li>
			</c:forEach>
		</ul>
	</nav>
</aside>
<div>
				<table class="draggable-table">
					<tbody>
						
						<c:forEach begin="1" end="${storeInfoVO.storeHeight}" var="y">
							<tr>
							<c:forEach begin="1" end="${storeInfoVO.storeWidth}" var="x">
							<td draggable="true" data-x-coord="${x}" data-y-coord="${y}">
								<c:forEach items="${equipmentPlacementList}" var="item">
								<c:if test="${item.xCoord == x and item.yCoord == y}">
								<h4>${item.equipmentCode}. ${item.equipmentName}</h4>${item.equipmentTypeName}
								</c:if>
								</c:forEach>
							</td>
							</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
</div>
<script>
function init() {


	var dragSrcEl = null;
	
	function handleDragStart(e) {
	  this.style.opacity = '0.4';
	  
	  dragSrcEl = this;
	
	  e.dataTransfer.effectAllowed = 'move';
	  e.dataTransfer.setData('text/html', this.innerHTML);
	}
	
	function handleDragOver(e) {
	  if (e.preventDefault) {
	    e.preventDefault();
	  }
	
	  e.dataTransfer.dropEffect = 'move';
	  
	  return false;
	}
	
	function handleDragEnter(e) {
	  this.classList.add('over');
	}
	
	function handleDragLeave(e) {
	  this.classList.remove('over');
	}
	function handleDropAside(e) {
	 console.log('handleDrop');
	 console.log(this);
	  if (e.stopPropagation) {
	    e.stopPropagation(); // stops the browser from redirecting.
	  }
	  
	  if (dragSrcEl != this) {
	  	const li = document.createElement("li");
	  	li.innerHTML = e.dataTransfer.getData('text/html');
	  	li.draggable = true;
    	li.dataset.equipmentCode = dragSrcEl.dataset.equipmentCode;
	  	$('.draggable-aside ul').append(li);
	  	addEventListenerLi(li);
	  	dragSrcEl.innerHTML = '';
    	deleteEquipmentPlacement(dragSrcEl.dataset.equipmentCode, dragSrcEl.dataset.xCoord, dragSrcEl.dataset.yCoord);
	  	dragSrcEl =null;
	  }
	  
	  return false;
	}
	function deleteEquipmentPlacement(equipmentCode, xCoord, yCoord) {
		$.ajax({
			url : '/info/storeinfo/popup/detail',
			type : 'DELETE',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({equipmentCode, xCoord, yCoord}),
			success : function onData(data) {
			},
			error : function onError(error) {
				console.error(error);
			}
		});
		
	}
	function insertEquipmentPlacement(equipmentCode, xCoord, yCoord) {
		const sId = $('#sId').val();
		$.ajax({
			url : '/info/storeinfo/popup/detail',
			type : 'PUT',
			//응답 받고 
			headers : { // Http header
				// 요청 보낼때 내가 보낼 data의 타입
				"Content-Type" : "application/json",
			},
			//
			dataType : 'JSON', // 데이터 타입 (html, xml, json, text 등등)
			data : JSON.stringify({equipmentCode, xCoord, yCoord, sId}),
			success : function onData(data) {
			},
			error : function onError(error) {
				console.error(error);
			}
		});
		
	}
	function handleDropTable(e) {
	  if (e.stopPropagation) {
	    e.stopPropagation(); // stops the browser from redirecting.
	  }
	  if (dragSrcEl != this && this.innerHTML.trim() == '') {
	    this.innerHTML = e.dataTransfer.getData('text/html');
    	this.dataset.equipmentCode = dragSrcEl.dataset.equipmentCode;
	    if(dragSrcEl.tagName != 'TD')
	    	dragSrcEl.remove();
	    else {
	    	dragSrcEl.innerHTML = '';
	    	dragSrcEl.dataset.equipmentCode = '';
	    	deleteEquipmentPlacement(dragSrcEl.dataset.equipmentCode, dragSrcEl.dataset.xCoord, dragSrcEl.dataset.yCoord);
	    }
	    insertEquipmentPlacement(this.dataset.equipmentCode, this.dataset.xCoord, this.dataset.yCoord);
	  }
	  
	  return false;
	}
	
	function handleDragEnd(e) {
	  this.style.opacity = '1';
	}
	
	function addEventListenerLi(item) {
	   item.addEventListener('dragstart', handleDragStart, false);
	   item.addEventListener('dragenter', handleDragEnter, false);
	   item.addEventListener('dragover', handleDragOver, false);
	   item.addEventListener('dragleave', handleDragLeave, false);
	   item.addEventListener('dragend', handleDragEnd, false);
	}
	document.querySelectorAll('.draggable-aside').forEach((item) => {
	    item.addEventListener('dragover', handleDragOver, false);
	    item.addEventListener('drop', handleDropAside, false);
	});
	document.querySelectorAll('.draggable-aside li').forEach((item) => {
		addEventListenerLi(item);
	});
	document.querySelectorAll('.draggable-table td').forEach((item) => {
	    item.addEventListener('dragstart', handleDragStart, false);
	    item.addEventListener('dragenter', handleDragEnter, false);
	    item.addEventListener('dragover', handleDragOver, false);
	    item.addEventListener('dragleave', handleDragLeave, false);
	    item.addEventListener('drop', handleDropTable, false);
	    item.addEventListener('dragend', handleDragEnd, false);
	});
}


$(document).ready( () => {
	init();
});




</script>
