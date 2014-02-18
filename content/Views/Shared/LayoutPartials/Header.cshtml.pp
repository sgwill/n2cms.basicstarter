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
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            @if (currentStartPage != null)
            {
                <a class="navbar-brand" href="@currentStartPage.Url">Home</a>
            }
            else
            {
                <a class="navbar-brand" href="#">Home</a>
            }
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                @*<li class="active"><a href="#">Home</a></li>*@
                @if (currentStartPage != null)
                {
                    foreach ($rootnamespace$.N2.Models.Pages.ContentPage baseItem in currentStartPage.GetChildren<$rootnamespace$.N2.Models.Pages.ContentPage>().Where(a => a.Visible))
                    {
                        string active = Find.CurrentPage == baseItem ? "active" : "";
                        <li class="@active"><a href="@baseItem.Url">@baseItem.Title</a></li>
                    }
                }
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Translations</a>
                    <ul class="dropdown-menu" role="menu">
                        @Html.Action("Translations", "StartPage", new { id = N2.Find.CurrentPage.ID })
                    </ul>
                </li>
            </ul>
        </div><!--/.navbar-collapse -->
    </div>
</div>