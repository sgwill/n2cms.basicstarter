using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N2.Definitions;
using N2.Definitions.Runtime;
using N2;
using N2.Details;
using N2.Collections;

namespace $rootnamespace$.N2.Models.Pages
{
    [PageDefinition(
        Title = "Content Page"
    )]
    [WithEditableTemplateSelection(ContainerName = Defaults.Containers.Metadata)]
    public class ContentPage : PageBase, IContentPage, IStructuralPage
    {
        public virtual string Text { get; set; }

        #region Child Find / Traverse
        /// <summary>
        /// Get children of a specific type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public virtual IList<T> GetChildren<T>() where T : ContentItem
        {
            return new ItemList<T>(Children, new AccessFilter(), new TypeFilter(typeof(T)));
        }

        /// <summary>
        /// Get children of a specific type that are defined within a zone
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="zoneName"></param>
        /// <returns></returns>
        public virtual IList<T> GetChildren<T>(string zoneName) where T : ContentItem
        {
            return new ItemList<T>(Children, new AccessFilter(), new TypeFilter(typeof(T)), new ZoneFilter(zoneName));
        }
        #endregion
    }
}   