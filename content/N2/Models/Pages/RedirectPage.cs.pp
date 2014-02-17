using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using N2;
using N2.Details;
using N2.Definitions;

namespace $rootnamespace$.N2.Models.Pages
{
    [PageDefinition(
        Title = "Redirect Page"
    )]
    [WithEditableTemplateSelection(ContainerName = Defaults.Containers.Metadata)]
    public class RedirectPage : ContentPage, IStructuralPage
    {
        public virtual string Destination { get; set; }

        public virtual bool IsEditor { get; set; }
    }
}