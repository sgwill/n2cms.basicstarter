using System;
using System.Web;
using N2.Definitions;
using N2.Definitions.Runtime;
using N2.Engine.Globalization;
using N2.Web.Mvc;
using N2.Details;
using $rootnamespace$.N2.Models.Pages;

namespace $rootnamespace$.N2.Registrations
{
    [Registration]
    public class ContentPageRegisterer : FluentRegisterer<ContentPage>
    {
        public override void RegisterDefinition(IContentRegistration<ContentPage> register)
        {
            register.Page(title: "Content Page", description: "This is a basic content page");
            register.IconClass("n2-icon-file");
            register.RestrictParents(typeof(IStructuralPage));

            register.On(c => c.Text)
                .FreeText("Text");
        }
    }
}