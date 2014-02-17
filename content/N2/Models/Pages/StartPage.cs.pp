using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using N2.Definitions;
using N2.Definitions.Runtime;
using N2.Engine.Globalization;
using N2.Web.Mvc;
using N2.Details;

namespace $rootnamespace$.N2.Models.Pages
{
    //[PageDefinition(
    //    Title="Start Page",
    //    Description="Start page for each unique language"
    //)]
    public class StartPage : ContentPage, IStartPage, IStructuralPage, ILanguage
    {
        #region ILanguage Members

        [EditableLanguagesDropDown(Title = "Language", ContainerName = Defaults.Containers.Content, SortOrder = 200)]
        public virtual string LanguageCode { get; set; }

        public string LanguageTitle
        {
            get
            {
                if (string.IsNullOrEmpty(LanguageCode))
                    return "";
                else
                    return new CultureInfo(LanguageCode).DisplayName;
            }
        }

        #endregion
    }

   
}