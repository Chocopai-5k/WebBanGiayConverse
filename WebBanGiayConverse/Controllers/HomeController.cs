using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        public ActionResult Index()
        {
            var lstConverse = db.SanPhams.Where(n => n.IDLoaiSanPham == 1);
            ViewBag.ListConverse = lstConverse;

            var lstVan = db.SanPhams.Where(n => n.IDLoaiSanPham == 2);
            ViewBag.ListVan = lstVan;
            return View();
        }
        public ActionResult MenuPartial()
        {
            var lstSP = db.SanPhams;
            return PartialView(lstSP);
        }
    }
}