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
    public class RedirectPageRegisterer : FluentRegisterer<RedirectPage>
    {
        public override void RegisterDefinition(IContentRegistration<RedirectPage> register)
        {
            register.Page(title: "Redirect Page", description: "This is a basic redirect page");
            register.IconClass("n2-icon-link");
            register.RestrictParents(typeof(IStructuralPage));

            register.On(c => c.Destination)
                .Text("Redirect Url");
        }
    }
}