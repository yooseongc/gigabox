function sendIt(){
//아이디 입력여부 검사
if(document.form-horizontal.userID.value=="")
{
 alert("아이디를 입력하지 않았습니다.")
 document.f.id.focus();
 return false;
}
//아이디 유효성 검사 (영문소문자, 숫자만 허용)
for (i=0;i<document.form-horizontal.userID.value.length ;i++ )
{
 ch=document.form-horizontal.userID.value.charAt(i)
  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z'))
  {
  alert ("아이디는 소문자, 숫자만 입력가능합니다.")
  document.form-horizontal.userID.focus();
  document.form-horizontal.userID.select();
  return false;
  }
}
//아이디에 공백 사용하지 않기
if (document.form-horizontal.userID.value.indexOf(" ")>=0)
{
 alert("아이디에 공백을 사용할 수 없습니다.")
 document.form-horizontal.userID.focus();
 document.form-horizontal.userID.select();
 return false;
}
//아이디 길이 체크 (6~12자)
if (document.form-horizontal.userID.value.length<8 || document.form-horizontal.userID.value.length>12)
{
 alert ("아이디를 8~12자까지 입력해주세요.")
 document.form-horizontal.userID.focus();
 document.form-horizontal.userID.select();
 return false;
}
//비밀번호 입력여부 체크
if(document.form-horizontal.userPassword.value=="")
{
 alert("비밀번호를 입력하지 않았습니다.")
 document.form-horizontal.userPassword.focus();
 return false;
}
//비밀번호 길이 체크(4~8자 까지 허용)
if (document.form-horizontal.userPassword.value.length<8)
{
 alert ("비밀번호를 8자 이상 입력해주세요.")
 document.form-horizontal.userPassword.focus();
 document.form-horizontal.userPassword.select();
 return false;
}

//비밀번호와 비밀번호 확인 일치여부 체크
if (document.form-horizontal.userPassword.value!=document.form-horizontal.userPasswordCheck.value)
{
 alert("비밀번호가 일치하지 않습니다")
 /*document.form-horizontal.userPassword.value="";
 document.form-horizontal.userPasswordCheck.value="";*/
 document.form-horizontal.userPassword.focus();
 return false;
}

//성별 체크 유무 확인
if (document.form-horizontal.gender[0].checked==false && document.form-horizontal.gender[1].checked==false)
{
 alert("성별을 체크해 주세요")
 return false;
}
 
//이메일 입력여부 검사
if(document.form-horizontal.userEmail.value=="")
{
 alert("이메일을 입력하지 않았습니다.")
 document.form-horizontal.userEmail.focus();
 return false;
}

//전화번호 입력여부 검사
if(document.form-horizontal.userTel.value=="")
{
 alert("휴대폰번호를 입력하지 않았습니다.")
 document.form-horizontal.userTel.focus();
 return false;
}

document.form-horizontal.submit();
}
