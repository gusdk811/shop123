<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 사항 조회하기</title>

<style type="text/css">

	* {
		box-sizing: border-box;
		font-family: 'Nanum Gothic', 'sans-serif';
	}

	#warpForm{
		width: 100%;
		height: 1417px;
	}
	#headerForm{
		width: 100%;
		height: 300px;
	}
	#contentForm{
		width: 80%;
		margin:0 auto;
	}
/* 헤드 타이틀 부분 CSS */
	#headTitle{
		font-size: 30px;
		text-align: left;
		font-weight: bolder;
		color:#3BBD5A;
	}
/* 페이지 상세 내역 부분 CSS */
	.infoForm{
		float:left;
		width:20%;
		height:35px;
		border:1px solid #e4e4e4;
		border-left:none;
		line-height: 30px;
		font-weight: bold;
	}
	.inputForm{
		float:left;
		width:80%;
		height:35px;
		border:1px solid #e4e4e4;
		border-right:none;
		line-height: 30px;
	}
	#infoContent{
		float:left;
		width:20%;
		height:400px;
		border:1px solid #e4e4e4;
		border-left:none;
		line-height: 300px;
		font-weight: bold;
	}
	#inputContent{
		float:left;
		width:80%;
		height:400px;
		border:1px solid #e4e4e4;
		border-right:none;
		padding:10px;
	}
/* 본문 부분 CSS */
	.content{
		width:100%;
		height:100%;
		resize: none;
		border:none;
		font-size: 16px;
		text-align: left;
		background-color: white;
	}
	#imgWrap{
		width:49.5%;
		height:100%;
		float:left;
		
	}
	#imgWrap>img{
		width:100%;
		height:100%;
		object-fit:contain;
	}
	#textWrap{
		width:49.5%;
		height:100%;
		float:left;
	}
	#contentSpace{
		width:1%;
		height:100%;
		float:left;
	}
/* 버튼 부분 CSS */
	#btnWrap{
		width:100%;
		height:40px;
	}
	.btn{
		float:right;
		margin-left: 5px;
		margin-right: 5px;
		width:100px;
		height:100%;
		border:1px solid #198754;
		border-radius:20px;
		background-color: white;
		color:#198754;
		cursor: pointer;
	}
	.btn:hover{
		border:none;
		background-color: #3BBD5A;
		color:white;
	}
/* 답변 부분 */
	#answerWrap{
		width:100%;
		height:200px;
	}
	#infoAnswer{
		float:left;
		width:20%;
		height:100%;
		border:1px solid #e4e4e4;
		border-left:none;
		border-bottom:none;
		line-height: 200px;
		font-weight: bold;
	}
	#inputAnswer{
		float:left;
		width:80%;
		height:100%;
		border:1px solid #e4e4e4;
		border-right:none;
		line-height: 30px;
		border-bottom:none;
		padding:10px;
	}
	#inputAnswer textarea{
		width:100%;
		height:100%;
		resize:none;
		background-color: white;
		border:1px solid #e4e4e4;
		border-radius: 10px;
		padding:5px;
		font-size:16px;
	}
	#inputAnswer textarea:focus{
		outline: none;
	}
	#answerForm{
		width:100%;
		height:100%;
	}
</style>
</head>
<body>
<div id="warpForm" align="center">
	<div id="headerForm">
		<c:import url="/WEB-INF/views/commons/header.jsp"/>
	</div>
	<div id="contentForm">
		<H1 id="headTitle">내 문의 상세보기</H1>
		<hr style="border:1px solid black; margin-bottom:0px;">
		<div class="infoForm" style="border-top:none;">
			문의 제목
		</div>
		<div class="inputForm" style="border-top:none;">
			${map.qUser.questionUserTitle }
		</div>
		<div class="infoForm">
			문의 번호
		</div>
		<div class="inputForm">
			${map.qUser.questionUserNo }
		</div>
		<div class="infoForm">
			문의 날짜
		</div>
		<div class="inputForm">
			${map.qUser.questionUserRegdate }
		</div>
		<div class="infoForm">
			문의 대상
		</div>
		<div class="inputForm">
			<c:if test="${map.qUser.questionUserClassify eq 'A'.charAt(0)}">운영자</c:if>
			<c:if test="${map.qUser.questionUserClassify eq 'F'.charAt(0)}">농가 (농가 번호 : ${map.qUser.farmNo })</c:if>
		</div>
			<c:if test="${map.qUser.questionUserCode eq 'Q-1'}">
			<div class="infoForm">
				환불 현황
			</div>
			<div class="inputForm">
				<c:if test="${map.refund.farmYN eq 'X'.charAt(0) }">대기중</c:if>
				<c:if test="${map.refund.farmYN eq 'N'.charAt(0) }">거절</c:if>
				<c:if test="${map.refund.farmYN eq 'Y'.charAt(0) && map.refund.adminYN eq 'X'.charAt(0)}">가승인</c:if>
				<c:if test="${map.refund.farmYN eq 'Y'.charAt(0) && map.refund.adminYN eq 'N'.charAt(0)}">거절</c:if>
				<c:if test="${map.refund.farmYN eq 'Y'.charAt(0) && map.refund.adminYN eq 'Y'.charAt(0)}">환불 완료</c:if>
			</div>
			</c:if>
		<div class="infoForm">
			문의 유저
		</div>
		<div class="inputForm">
			${map.qUser.userNick }
		</div>
		<div id="infoContent" style="border-bottom:none;">
			문의 내용
		</div>
		<div id="inputContent" style="border-bottom:none;">
			<c:if test="${map.qUser.questionphotoNo==1 }">
				<textarea disabled="disabled" class="content">${map.qUser.questionUserContent }</textarea>
			</c:if>
			<c:if test="${map.qUser.questionphotoNo!=1 }">
				<div id="imgWrap">
					<img alt="" src="${map.qUser.questionPhotoFilePath }">
				</div>
				<div id="contentSpace"></div>
				<div id="textWrap">
					<textarea disabled="disabled" class="content">${map.qUser.questionUserContent }</textarea>
				</div>
			</c:if>
		</div>
		<hr style="border:1px solid black; margin-top:0px; margin-bottom:0px;">
		<div id="answerWrap">
			<div id="infoAnswer">
				답변내용
			</div>
			<div id="inputAnswer">
				<form action="/qustionUser/questionAnswer.do" method="post" id="answerForm">
					<input type="hidden" value="${map.qUser.questionUserNo}" name="questionBoardNo">
					<input type="hidden" value="U" name="questionBoardCode">
					<input type="hidden" value="${map.qUser.questionUserAnswerYN}" name="questionUserAnswerYN">
					<input type="hidden" value="${currentPage}" name="currentPage">
					<input type="hidden" value="${type}" name="type">
					<input type="hidden" value="${keyword}" name="keyword">
					<textarea name="questionAnswerContent" id="answerArea">${map.qAnswer.questionAnswerContent }</textarea>
				</form>
			</div>
		</div>
		<hr style="border:1px solid black; margin-top:0px; margin-bottom:10px;">
		<div id="btnWrap">
			<c:choose>
				<c:when test="${sessionScope.member!=null }">
					<button class="btn listBtn">목록</button>
					<c:if test="${map.qUser.questionUserCode eq 'Q-1'}">
					<c:if test="${map.qUser.questionUserAnswerYN eq 'N'.charAt(0) && map.refund.farmYN eq 'X'.charAt(0)}">
					<button class="btn updateBtn">수정</button>
					<button class="btn deleteBtn">삭제</button>
					</c:if>
					</c:if>
					<c:if test="${map.qUser.questionUserCode eq 'Q-2'}">
					<c:if test="${map.qUser.questionUserAnswerYN eq 'N'.charAt(0)}">
					<button class="btn updateBtn">수정</button>
					<button class="btn deleteBtn">삭제</button>
					</c:if>
					</c:if>
				</c:when>
				<c:otherwise>
					<button class="btn listBtn">목록</button>
					<button class="btn answerBtn">답변</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="footerFrom">
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
	</div>
</div>

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
<%-- 글 목록 버튼 --%>
	$('.listBtn').click(function(){
		var currentPage = ${currentPage};
		var type = "${type}";
		var keyword = "${keyword}";
		location.replace('/question/QuestionUserPage.do?currentPage='+currentPage+'&type='+type+'&keyword='+keyword);
	});
<%-- 삭제 버튼 로직 --%>
	$('.deleteBtn').click(function(){
		var questionUserNo=${map.qUser.questionUserNo};
		var code = "${map.qUser.questionUserCode}";
		
		location.replace('/question/questionUserDelete.do?questionUserNo='+questionUserNo+'&questionUserCode='+code);
	});
	$('.answerBtn').click(function(){
		$('#answerForm').submit();
	});
<%-- 수정 버튼 로직 --%>
	$('.updateBtn').click(function(){
		var questionUserNo=${map.qUser.questionUserNo};
		location.replace('/question/questionUserUpdatePage.do?questionUserNo='+questionUserNo);
	});
</script>
<c:if test="${member!=null }">
	<script>
		$(function(){
			$('#answerArea').prop('disabled',true);
		});
	</script>
</c:if>
</body>
</html>