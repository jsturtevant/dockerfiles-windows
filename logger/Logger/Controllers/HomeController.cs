using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Logger.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Console.WriteLine("Hello world from console out");
            Trace.WriteLine("Hello world from trace out");
            return View();
        }

        public ActionResult About()
        {
            Console.WriteLine("About Page from console out");
            Trace.WriteLine("About Page from trace out");

            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}