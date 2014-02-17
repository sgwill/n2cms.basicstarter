@using N2.Web.Mvc.Html
@using N2

@{
    Func<ContentItem, bool> IsCurrentStartPage = a => a is $rootnamespace$.N2.Models.Pages.StartPage;
    $rootnamespace$.N2.Models.Pages.StartPage currentStartPage;
    if (Find.CurrentPage is $rootnamespace$.N2.Models.Pages.StartPage)
    {
        currentStartPage = Find.CurrentPage as $rootnamespace$.N2.Models.Pages.StartPage;
    }
    else
    {
        currentStartPage = Find.EnumerateParents(Find.CurrentPage).ToList().FirstOrDefault(IsCurrentStartPage) as $rootnamespace$.N2.Models.Pages.StartPage;
    }
}

    <nav class="navbar navbar-default navbar-inverse" role="navigation">
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            @if (currentStartPage != null)
            {
            <a class="navbar-brand" href="@currentStartPage.Url" style="color:#FFCC00;">Engine Angel</a>
            }
            else
            {
                <a class="navbar-brand" href="#" style="color:#FFCC00;">Engine Angel</a>
            }
	    </div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				@*<li class="active"><a href="#">Home</a></li>*@
            @if (currentStartPage != null)
            {
                foreach ($rootnamespace$.N2.Models.Pages.ContentPage baseItem in currentStartPage.GetChildren<$rootnamespace$.N2.Models.Pages.ContentPage>().Where(a => a.Visible && a.ShowInTopNavigation))
                {
                    string active = Find.CurrentPage == baseItem ? "active" : "";
                    <li class="@active"><a href="@baseItem.Url">@baseItem.Title</a></li>
                }
            }
			</ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
					<a href="@Url.Action("Login", "Logon")">Log in</a>
				</li>
			</ul>
		</div>
	</nav>