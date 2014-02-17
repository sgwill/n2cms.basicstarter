﻿using System.Web.Mvc;
using System.Web.Routing;
using N2.Definitions.Runtime;
using N2.Engine;
using N2.Plugin;
using N2.Web.Mvc;
using N2Cms = N2;
using $rootnamespace$.N2.Controllers;

namespace $rootnamespace$.Presentation.App_Start
{
    /// <summary>
    /// This initialization code is placed in a separate file not to overwrite existing global config when adding dinamico as library package (nuget)
    /// </summary>
    [AutoInitialize]
    public class N2CmsInitializer : IPluginInitializer
    {
        #region IPluginInitializer Members

        public void Initialize(N2Cms.Engine.IEngine engine)
        {
            //log4net.Config.XmlConfigurator.ConfigureAndWatch(new System.IO.FileInfo(Server.MapPath("~/N2/Installation/log4net.config")));

            RegisterControllerFactory(ControllerBuilder.Current, engine);
            RegisterRoutes(RouteTable.Routes, engine);
            RegisterViewEngines(ViewEngines.Engines);
            RegisterViewTemplates(engine);
        }

        #endregion

        private void RegisterViewTemplates(IEngine engine)
        {
            engine.RegisterViewTemplates<PageController>().Add<StartPageController>();
        }

        public static void RegisterControllerFactory(ControllerBuilder controllerBuilder, IEngine engine)
        {
            // Registers controllers in the solution for dependency injection using the IoC container provided by N2
            engine.RegisterAllControllers();

            var controllerFactory = engine.Resolve<ControllerFactoryConfigurator>()
                .NotFound<StartPageController>(sc => sc.NotFound())
                .ControllerFactory;

            controllerBuilder.SetControllerFactory(controllerFactory);
        }

        public static void RegisterRoutes(RouteCollection routes, IEngine engine)
        {
            routes.MapContentRoute("Content", engine);
        }

        public static void RegisterViewEngines(ViewEngineCollection viewEngines)
        {
            viewEngines.DecorateViewTemplateRegistration();
        }
    }
}