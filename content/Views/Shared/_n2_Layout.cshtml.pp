<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="@Url.Content("~/Content/bootstrap.min.css")" type="text/css" />
    <link rel="stylesheet" type="text/css" href="@Url.Content("~/Content/site.css")" type="text/css" />

    <script src="@Url.Content("~/Scripts/modernizr-2.6.2.js")"></script>

    <script src="@Url.Content("~/Scripts/jquery-1.10.2.min.js")"></script>
    <script src="@Url.Content("~/Scripts/bootstrap.min.js")"></script>
</head>

<body>
    @{ Html.RenderPartial("LayoutPartials/Header"); }

    <div class="container">
        <div class="row">

            <div class="col-md-12 column">
                @RenderBody()

                @{ Html.RenderPartial("LayoutPartials/Footer"); }
            </div>
        </div>
    </div>
    @RenderSection("scripts", required: false)
</body>
</html>