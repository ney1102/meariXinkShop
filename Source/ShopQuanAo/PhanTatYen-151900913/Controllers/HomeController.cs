using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913.Controllers
{
    public class HomeController : Controller
    {
        private QLyShopEntities db = new QLyShopEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [ChildActionOnly]
        public ActionResult ListProducts()
        {
            var listType = db.LoaiSPs.ToList();
            ViewBag.list = listType;

            return PartialView("_ListProducts");
        }
        public ActionResult NoInfo()
        {
            return View();
        }
    }
}