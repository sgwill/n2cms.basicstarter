using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using N2.Web.Mvc;
using N2.Web;
using System.Text;
using N2.Engine.Globalization;
using N2;
using $rootnamespace$.N2.Models.Pages;

namespace $rootnamespace$.N2.Controllers
{
    [Controls(typeof(StartPage))]
    public class StartPageController : BaseContentController<StartPage>
    {
        public override System.Web.Mvc.ActionResult Index()
        {
            var item = this.CurrentItem;

            return base.Index();
        }

        public ActionResult NotFound()
        {

            Response.TrySkipIisCustomErrors = true;
            Response.Status = "404 Not Found";

            return View();
        }
       
        [ContentOutputCache]
        public ActionResult Translations(int id)
        {
            StringBuilder sb = new StringBuilder();
            Dictionary<string, ContentItem> items = new Dictionary<string, ContentItem>();

            // Get Start page
            EngineAngel.N2.Models.Pages.StartPage currentStartPage;
            if (CurrentItem is EngineAngel.N2.Models.Pages.StartPage)
                currentStartPage = CurrentItem as EngineAngel.N2.Models.Pages.StartPage;
            else
                currentStartPage = Find.EnumerateParents(Find.CurrentPage).ToList().FirstOrDefault(IsCurrentStartPage) as EngineAngel.N2.Models.Pages.StartPage;

            var item = Engine.Persister.Get(id);
            var lg = Engine.Resolve<LanguageGatewaySelector>().GetLanguageGateway(item);

            // Find translations of current item
            var translations = lg.FindTranslations(item);
            foreach (var translation in translations)
            {
                string lang = lg.GetLanguage(translation).LanguageCode;
                if (!items.ContainsKey(lang))
                    items.Add(lang, translation);
            }

            // Find all languages
            var allLanguages = lg.FindTranslations(currentStartPage);
            foreach (var language in allLanguages)
            {
                string lang = lg.GetLanguage(language).LanguageCode;
                if (!items.ContainsKey(lang))
                    items.Add(lang, language);
            }

            foreach (var language in items)
                sb.Append("<li role='presentation'>").Append(Link.To(language.Value).Text(lg.GetLanguage(language.Value).LanguageTitle).Class("menuitem")).Append("</li>");

            if (sb.Length == 0)
                return Content("<li role='presentation'>This page is not translated</li>");

            return Content(sb.ToString());
        }
        Func<ContentItem, bool> IsCurrentStartPage = a => a is EngineAngel.N2.Models.Pages.StartPage;
    }
}
