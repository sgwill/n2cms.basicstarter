using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using N2.Definitions;
using N2.Definitions.Runtime;
using N2.Engine.Globalization;
using N2.Web.Mvc;
using N2.Security;
using N2.Details;
using N2Cms = N2;
using $rootnamespace$.N2.Models.Pages;
using $rootnamespace$.N2.Controllers;

namespace $rootnamespace$.N2.Registrations
{
    [Registration]
    public class StartPageRegisterer : FluentRegisterer<StartPage>
    {
        public override void RegisterDefinition(IContentRegistration<StartPage> register)
        {
            register.ControlledBy<StartPageController>();

            register.Page(title: "Start Page", description: "The topmost node of a site. This can be placed below a language intersection to also represent a language");
            register.IconClass("n2-icon-globe");
            register.Definition.Installer =  N2Cms.Installation.InstallerHint.PreferredStartPage;
            register.RestrictParents(typeof(IRootPage), typeof(LanguageIntersection));

            register.On(c => c.Text)
               .FreeText("Text")
               .SortOrder(500);
        }
    }
}