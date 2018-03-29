using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace whoami_iis.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.MachineName = HttpContext.Server.MachineName;
            ViewBag.HostName = Request.Url.Host;
            ViewBag.DnsHostName = Dns.GetHostName();
            ViewBag.EnvHostName = System.Environment.MachineName;
            return View();
        }
    }
}