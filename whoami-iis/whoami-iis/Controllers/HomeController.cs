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
            // There are several ways to get the Machine Name
            // Using Dns.GetHostName will resolve the full 
            // name given.  In Kuberentes this will be the Pod Name
            // Replication ID and the Container Id.  Other options only 
            // print the Pod and Replications IDs.

            // ViewBag.MachineName = HttpContext.Server.MachineName;
            // ViewBag.HostName = Request.Url.Host;
            ViewBag.DnsHostName = Dns.GetHostName();
            // ViewBag.EnvHostName = System.Environment.MachineName;
            return View();
        }
    }
}