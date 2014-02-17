using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N2;
using N2.Integrity;
using N2.Definitions;
using N2.Details;
using N2.Web;
using N2.Web.UI;
using N2.Security;
using N2.Engine.Globalization;
using System.Globalization;
using N2Cms = N2;

namespace $rootnamespace$.N2.Models.Pages
{
    /// <summary>
    /// Redirects to the child start page that matches the user agent's language.
    /// </summary>
    [PageDefinition(IconClass = "n2-icon-globe n2-gold", InstallerVisibility = N2Cms.Installation.InstallerHint.PreferredStartPage)]
    [RestrictParents(typeof(IRootPage))]
    [TabContainer(Defaults.Containers.Site, "Languages", 1000, ContainerName = "LanguagesContainer")]
    [RecursiveContainer("LanguagesContainer", 1000, RequiredPermission = Permission.Administer)]
    public class LanguageIntersection : PageBase, IRedirect
    {
        #region IRedirect Members

        public string RedirectUrl
        {
            get { return Children.OfType<StartPage>().Select(sp => sp.Url).FirstOrDefault() ?? this.Url; }
        }

        public ContentItem RedirectTo
        {
            get { return Children.OfType<StartPage>().FirstOrDefault(); }
        }

        #endregion
    }
}