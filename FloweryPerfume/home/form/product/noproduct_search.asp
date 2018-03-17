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
  var sProductCode = Request.Querystring("productCode");
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT * FROM Products where ProductCode = " + sProductCode;
	rs.Open(sSQL, cnn);
%>
<body>
	
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- MENU -->

	<div w3-include-html="../nav.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!-- DONG SAN PHAM-->
	<div class="container"> 
    	<div class="jumbotron">
        	<h2 class="text-center">Không Tìm Thấy Kết Quả Nào </h2><A HREF="index.asp">Bấm Vào Để Trờ Về Trang Chủ</A></CENTER>

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
