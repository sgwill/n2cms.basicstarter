@model $rootnamespace$.N2.Models.Pages.ContentPage
@{
    ViewBag.Title = "ContentPage";
}

<h2>@Model.Title</h2>

@Html.Raw(@Model.Text)
