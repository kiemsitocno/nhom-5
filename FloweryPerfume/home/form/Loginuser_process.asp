<!DOCTYPE HTML>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="cnn.asp" -->

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
	var sesUser="";
	aName=Request("txtName");
	aPass=Request("txtPass");
	sesUser += aName
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	sSQL = "SELECT CUsername, CPassword FROM Customer WHERE CUsername='" + aName + "' AND CPassword='" + aPass + "'";
	rs.Open(sSQL,cnn);
%>
<body>
<%
	if (rs.EOF) {
		%>
		<div id="mydelProduct" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1>Bạn đã nhập sai username hoặc password !</h1>
					</div>
					<div class="modal-footer">
		            	<button type="button" class="btn btn-default" onclick="backdamin()">Oke</button>
		            </div>
				</div>
			</div>
		</div>
		<%
	}else{
		%>
		<div id="mydelProduct" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<form action="user/showuser.asp">
							<div class="form-group">
								<input type="hidden" name="sCUsernamesu" value="<%=aName%>">
								<button type="button" class="close" data-dismiss="modal"></button>
								<h4 class="modal-title">Chào bạn <%=aName%></h4>
							</div>
							<button type="submit" class="btn btn-default">Oke</button>
						</form>
					</div>
					
					
				</div>
			</div>
		</div>
		<%
	}
	
	rs.Close();
	cnn.Close();
	rs=null;
	cnn=null;
%>
</body>
</html>
  <script>
  $(document).ready(function(){
    $("#mydelProduct").modal("show");
    $('.btnAdd').prop('disabled', true);

    $(".add-confirm").change(function() {
        if(this.checked) {
            $('.btnAdd').prop('disabled', false);
        }else{
          $('.btnAdd').prop('disabled', true);
        }
    });
  });
  		function backdamin() {
			window.location.assign("../../index.asp")
		}
  </script>