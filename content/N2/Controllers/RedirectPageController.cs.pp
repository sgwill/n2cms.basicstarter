using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using N2.Web.Mvc;
using N2;
using N2.Web;
using $rootnamespace$.N2.Models.Pages;

namespace $rootnamespace$.N2.Controllers
{
    [Controls(typeof(RedirectPage))]
    public class RedirectPageController : BaseContentController<RedirectPage>
    {
        public override System.Web.Mvc.ActionResult Index()
        {
            var item = this.CurrentItem;

            item.IsEditor = (HttpContext.User.Identity.IsAuthenticated && Content.Engine.SecurityManager.IsEditor(HttpContext.User));

            return base.Index();
        }
    }
}