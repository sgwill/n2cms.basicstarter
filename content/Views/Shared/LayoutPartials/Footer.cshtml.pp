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
        
@if (currentStartPage != null)
{
    string active = Find.CurrentPage == currentStartPage ? "active" : "";
<div class="row clearfix">
    <div class="col-md-12 column">  
        <div class="well well-lg">
			<nav class="navbar-default panel" role="navigation">
				<ul class="nav nav-pills nav-justified">
					<li class="@active"><a href="@currentStartPage.Url">@currentStartPage.Title</a></li>
                     @foreach ($rootnamespace$.N2.Models.Pages.ContentPage baseItem in currentStartPage.GetChildren<$rootnamespace$.N2.Models.Pages.ContentPage>().Where(a => a.Visible && a.ShowInTopNavigation))
                     {
                         active = Find.CurrentPage == baseItem ? "active" : "";
					    <li class="@active"><a href="@baseItem.Url">@baseItem.Title</a></li>
                     }
				</ul>			
			</nav>
            <p class="text-center">© Angel Enterprise Systems, Inc. All rights reserved.</p>
            <p class="text-center">Created By: Angel Development</p>
        </div>
    </div>
</div>		
}