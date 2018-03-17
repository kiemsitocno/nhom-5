<!DOCTYPE HTML>

<%@LANGUAGE="JAVASCRIPT"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://www.w3schools.com/lib/w3.js"></script>
</head>

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
			
					<div class="panel panel-primary">
						<div class="panel-heading">Báo cáo</div>
						<div class="panel-body">
							<ul class="list-group">
							  <li class="list-group-item">Số lượng thành viên đăng ký trong tháng:</li>
							  <li class="list-group-item">Số lượng sản phẩm nhập về trong tháng:</li>
							  <li class="list-group-item">Số lượng sản phẩm tồn từ tháng trước:</li>
							  
							</ul>
						</div>
					</div>
				
    </div>
    <!---------------------------------------------------------------------------------------------------------------------------------------->
    <!--FOOTER-->
    <div w3-include-html="footer.asp"></div> 
	<script>
		w3.includeHTML();
	</script>
   	<!---------------------------------------------------------------------------------------------------------------------------------------->
    
</body>
</html>
