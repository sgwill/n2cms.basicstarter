using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N2.Definitions;
using N2.Details;
using N2.Integrity;
using N2.Web.UI;
using N2;

namespace $rootnamespace$.N2.Models.Pages
{
    [WithEditableTitle]
    [WithEditableName(ContainerName = Defaults.Containers.Metadata)]
    [WithEditableVisibility(ContainerName = Defaults.Containers.Metadata)]
    [SidebarContainer(Defaults.Containers.Metadata, 100, HeadingText = "Metadata")]
    [TabContainer(Defaults.Containers.Content, "Content", 10)]
    [TabContainer(Defaults.Containers.SEO, "SEO", 20)]
    [RestrictParents(typeof(IPage))]
    public abstract class PageBase : ContentItem, IPage
    {

    }
}