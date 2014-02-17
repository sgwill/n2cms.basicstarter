<div class="panel">
    <div class="btn-group">
        <button class="btn btn-default"  type="button" data-toggle="dropdown" contenteditable="true">Language</button>
        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu">
            @Html.Action("Translations", "StartPage", new { id = N2.Find.CurrentPage.ID })
        </ul>
    </div>
</div>

