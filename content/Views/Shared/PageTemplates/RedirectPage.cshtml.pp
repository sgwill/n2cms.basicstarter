@model $rootnamespace$.N2.Models.Pages.RedirectPage

@{
    var url = Model.GetDetail("Destination", "/");
    if (!Model.IsEditor)
    {
        Response.Redirect(url);
    }
    else
    { 
		<div class="alert alert-warning">
			<p>Auto-redirect is disabled because the current user is an editor. </p>
			<p><a href="@url">Continue to @url</a></p>
		</div>
    }
}

@Html.Partial("PageTemplates/ContentPage")
