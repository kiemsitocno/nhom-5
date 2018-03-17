<!DOCTYPE HTML>

<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../cnn.asp" -->
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost/FloweryPerfume/admin/style/font-awesome.css">
  <link rel="stylesheet" href="/FloweryPerfume/admin/style/style.css">
  <script src="http://localhost/FloweryPerfume/admin/style/jquery.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/bootstrap.min.js"></script>
  <script src="http://localhost/FloweryPerfume/admin/style/w3.js"></script>
</head>
<%
  var sCUsername = Request("sCUsernamesu");
  cnn=Server.CreateObject("ADODB.Connection");
  cnn.Open(cStr);
  rs=Server.CreateObject("ADODB.Recordset");
  sSQL = "SELECT * FROM Customer WHERE CUsername = '" + sCUsername + "'";
  rs.Open(sSQL, cnn);

%>
<body>
	
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- MENU -->

	<div w3-include-html="nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- DONG SAN PHAM-->
	<div class="container"> 
    	<div class="jumbotron">
        	<h2 class="text-center">Thông Tin Chi Tiết Về Thành Viên</h2>
          <hr>
            	<%
              var sCCode=rs.Fields.Item("CCode").Value;
              var sCName=rs.Fields.Item("CName").Value;
              var sCUsername=rs.Fields.Item("CUsername").Value;
              var sCPhone=rs.Fields.Item("CPhone").Value;
              var sCAddress =rs.Fields.Item("CAddress").Value;
              var sCSex=rs.Fields.Item("CSex").Value;
              var sCEmail=rs.Fields.Item("CEmail").Value;
				%>
          <div class="row">
            <div class="col-md-9">
              <p><strong>Mã thành viên:</strong>  <%=sCCode%> </p>
              <p><strong>Họ và tên:</strong>  <%=sCName%> </p>
              <p><strong>Tên đăng nhập:</strong>  <%=sCUsername%> </p>
              <p><strong>Số điện thoại:</strong>  <%=sCPhone%> </p>
              <p><strong>Địa chỉ:</strong> <%=sCAddress%>  </p>
              <p><strong>Giới tính:</strong> <%=sCSex%>  </p>
              <p><strong>Email:</strong> <%=sCEmail%>  </p>
            </div>  
            <div class="col-md-3">
              <form action="showupdate.asp">
                <button type="submit" name="sCCode" class="btn btn-default btn-lg glyphicon glyphicon-edit" value="<%=sCCode%>"> Sửa</button>
              </form>
            </div>
          </div>
        </div>
        </div>
    </div>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!--FOOTER-->
    <div w3-include-html="../footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
   	<!---------------------------------------------------------------------------------------------------------------------------------------->
    
</body>
</html>
 <script>
    function backdamin() {
      window.location.assign("../../../index.asp")
    };
  </script>

