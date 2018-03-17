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
  
<div class="header">
      <div class="container">
            <nav class="navbar navbar-default">
                <div class="nav-header">
                    <h1>Flowery Perfume</h1>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left main-nav">
                        <li><a class="navbar-brand" href="/floweryperfume/admin/form/product/productshow.asp">Quản lý sản phẩm</a></li>
                        <li><a class="navbar-brand" href="/floweryperfume/admin/form/manu/manushow.asp">Quản lý hãng</a></li>
                        <li><a class="navbar-brand" href="/floweryperfume/admin/form/user/usershow.asp">Quản lý thành viên</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <form action="index.asp">
                        <li>
                            <button type="button" class="btn btn-primary btn-md glyphicon glyphicon-log-in" > Xin chao, <%= Session("sUser") %></button>
                            <a href="/floweryperfume/admin/Logout.asp" class="btn btn-default btn-md glyphicon glyphicon-log-in" > Logout</a>
                        </li>
                        </form>
                        <!-------------------------------------------------------------------------------------------------------------------->
                    </ul>
                    
                </div>
            </nav>
      </div>
    </div>
</body>
</html>