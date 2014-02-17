<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Site Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="@Url.Content("~/Content/less/bootstrap.less")" type="text/css" /-->
	<!--link rel="stylesheet/less" href="@Url.Content("~/Content/less/responsive.less")" type="text/css" /-->
	<!--script src="@Url.Content("~/Scripts/js/less-1.3.3.min.js")"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	
    <link rel="stylesheet" type="text/css" href="@Url.Content("~/Content/css/bootstrap.min.css")" type="text/css" />    <link rel="stylesheet" type="text/css" href="@Url.Content("~/Content/css/style.css")" type="text/css" />
	
    <script src="@Url.Content("~/Scripts/modernizr-2.6.2.js")"></script>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="@Url.Content("~/Scripts/html5shiv.js")"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="@Url.Content("~/Content/img/apple-touch-icon-144-precomposed.png")">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="@Url.Content("~/Content/img/apple-touch-icon-114-precomposed.png")">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="@Url.Content("~/Content/img/apple-touch-icon-72-precomposed.png")">
    <link rel="apple-touch-icon-precomposed" href="@Url.Content("~/Content/img/apple-touch-icon-57-precomposed.png")">
    <link rel="shortcut icon" href="@Url.Content("~/Content/img/favicon.png")">  
  
    <script src="@Url.Content("~/Scripts/jquery-1.8.2.min.js")"></script>
	<script src="@Url.Content("~/Scripts/bootstrap.min.js")"></script>
    <script src="@Url.Content("~/Scripts/scripts.js")"></script>
</head>

<body>
<div class="container">
	
    @{ Html.RenderPartial("LayoutPartials/Header"); }

    <div class="row clearfix">
        <div class="col-md-12 column"></div>
    </div>
  
    <div class="row clearfix">
  
		<div class="col-md-12 column">
			<div class="row clearfix">
                    @RenderBody()
			</div>

            @{ Html.RenderPartial("LayoutPartials/Footer"); }
           
		</div>
	</div>
</div>
    @RenderSection("scripts", required: false)
</body>
</html>
