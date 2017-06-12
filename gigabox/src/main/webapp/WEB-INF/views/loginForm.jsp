<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <center>
        <form action="login.do">
            <table>
                <tr>
                    <td width="150px" align="center">아이디 :</td>
                    <td width="150px" align="center">
                        <input type="text" name="id">
                    </td>
                </tr>
                <tr>
                    <td width="150px" align="center">비밀번호 :</td>
                    <td width="150px" align="center">
                        <input type="password" name="pwd">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="로그인">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
