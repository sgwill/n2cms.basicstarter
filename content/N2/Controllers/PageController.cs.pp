using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using N2.Web;
using N2.Web.Mvc;
using $rootnamespace$.N2.Models.Pages;

namespace $rootnamespace$.N2.Controllers
{
    [Controls(typeof(PageBase))]
    public class PageController : BaseContentController<PageBase>
    {
        public override System.Web.Mvc.ActionResult Index()
        {
            return base.Index();
        }
    }
}