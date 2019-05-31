<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html> 
<html> 
<head>
  <title>회원가입</title>
  <META CHARSET="UTF-8">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                                 
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
  
  <style type="text/css">
  #need{
  		color : red;
  }
  </style>
  <script type="text/javascript">
  			function idCheck(id){
  				if(id==""){
  					alert("아이디를 입력해주세요");
  					document.frm.id.focus();
  				}else{
  					var url = "idProc.jsp";
  					url += "?id="+id;
  					
  					wr=window.open(url,"아이디검색","width=500,height=500");  
  					wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
  					
  				}
  			    }

  			function emailCheck(email){
  				if(email==""){
  					alert("email을 입력해주세요");
  					document.frm.email.focus();
  				}else{
  					var url = "emailProc.jsp";
  					url += "?email="+email;
  					
  					wr=window.open(url,"email 검색","width=500,height=500");  
  					wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
  					
  				}
  			    }
  			
  
  </script>
  <script type="text/javascript">
			function incheck(f){
				if(f.id.value==""){
					alert("아이디를 입력하세요");
					f.id.focus();
					return false;
				}
				if(f.passwd.value==""){
					alert("패스워드를 입력하세요");
					f.passwd.focus();
					return false;
				}
				if(f.repasswd.value==""){
					alert("패스워드 확인을 입력하세요");
					f.repasswd.focus();
					return false;
				}
				if(f.passwd.value!=f.repasswd.value){
					alert("패스워드와 패스워드 확인이 일치하지 않습니다");
					f.repasswd.focus();
					return false;
				}
				if(f.mname.value==""){
					alert("이름을 입력하세요");
					f.mname.focus();
					return false;
				}
				if(f.tel.value==""){
					alert("전화번호를 입력하세요");
					f.tel.focus();
					return false;
				}
				if(f.email.value==""){
					alert("이메일을 입력하세요");
					f.email.focus();
					return false;
				}
				if(f.job.selectedIndex==0){
					alert("직업을 선택하세요");
					f.job.focus();
					return false;
				}
		}
</script>
  
</head>
<body>
<jsp:include page ="/menu/top.jsp" />
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원가입</h1>
<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 필수입력 사항입니다.)</label>

 <form class="form-horizontal" method="post" 
       action="prcreateProc.jsp" name="frm"
       onsubmit="return incheck(this)"
       enctype="multipart/form-data">
  
<div class="form-group">
    <label class="control-label col-sm-2" for="fname">사진</label>
    <div class="col-sm-6">
      <input type="file" accept=".jsp, .gif, .png" name="fname" id="fname" class="form-control">
    </div>
</div>
  
<div class="form-group">
    <label class="control-label col-sm-2" for="id"><span id="need">*</span>ID</label>
    <div class="col-sm-3">
      <input type="text" name="id" id="id" class="form-control">
     </div>
     <button class="btn col-sm-2" type="button" onclick="idCheck(document.frm.id.value)">ID 중복확인</button>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="passwd"><span id="need">*</span>PASSWORD</label>
    <div class="col-sm-4">
      <input type="password" name="passwd" id="passwd" class="form-control">
     </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="repasswd"><span id="need">*</span>PASSWORD 확인</label>
    <div class="col-sm-4">
      <input type="password" name="repasswd" id="repasswd" class="form-control">
     </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="mname"><span id="need">*</span>NAME</label>
    <div class="col-sm-4">
      <input type="text" name="mname" id="mname" class="form-control">
     </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="tel"><span id="need">*</span>PHONE</label>
    <div class="col-sm-4">
      <input type="text" name="tel" id="tel" class="form-control">
     </div>
</div>
  
<div class="form-group">
    <label class="control-label col-sm-2" for="email"><span id="need">*</span>EMAIL</label>
    <div class="col-sm-4">
      <input type="email" name="email" id="email" class="form-control">
     </div>
     <button type="button" class="btn col-sm-2"
                       onclick="emailCheck(document.frm.email.value)">EMAIL 중복확인</button>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="sample6_postcode">ZIPCODE</label>
    <div class="col-sm-3">
      <input type="text" name="zipcode" class="form-control"
                     id="sample6_postcode" placeholder="zipcode">
     </div>
     <button type="button" class="btn col-sm-2" onclick="sample6_execDaumPostcode()">ZIPCODE 검색</button>
</div>
    
<div class="form-group">
    <label class="control-label col-sm-2" for="sample6_address">ADDRESS</label>
    <div class="col-sm-6">
      <input type="text" name="address1" id="sample6_address" class="form-control" placeholder="주소">
      <input type="text" name="address2" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2" for="job"><span id="need">*</span>JOB</label>
    <div class="col-sm-2">
      <select name="job" class="form-control">
       <option value="0">선택하세요</option>
       <option value="A01">회사원</option>
       <option value="A02">전산관련직</option>
       <option value="A03">연구전문직</option>
       <option value="A04">각종학교학생</option>
       <option value="A05">일반자영업</option>
       <option value="A06">공무원</option>
       <option value="A07">의료인</option>
       <option value="A08">법조인</option>
       <option value="A09">종교/언론/예술인</option>
       <option value="A10">기타</option>      
      </select>
    </div>
</div>
    
    
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
  </div> 

</form>  
</div>
</body> 
</html> 