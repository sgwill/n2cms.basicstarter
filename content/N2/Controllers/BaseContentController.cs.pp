using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using N2.Web.Mvc;
using N2;

namespace $rootnamespace$.N2.Controllers
{
    public class BaseContentController<T> : ContentController<T> where T : ContentItem
    {
        /// <summary>By default the templates index method renders a view located in ~/Views/SharedPages/{ContentType}.aspx or partial view located in ¨~/Views/SharedPages/{ContentType}.ascx.</summary>
        /// <returns></returns>
        public override System.Web.Mvc.ActionResult Index()
        {
            if (CurrentItem.IsPage)
                return View(string.Format("PageTemplates/{0}", CurrentItem.GetContentType().Name), CurrentItem);
            else
                return PartialView(string.Format("PartTemplates/{0}", CurrentItem.GetContentType().Name), CurrentItem);
        }
    }
}