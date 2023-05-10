using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: ThongKe
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        public ActionResult Index()
        {
            //Lấy số ng truy cập
            ViewBag.PageView = HttpContext.Application["PageView"].ToString();
            ViewBag.Online = HttpContext.Application["Online"].ToString();
            ViewBag.TongDoanhThu = ThongKeDoanhThu();
            return View();
        }
        public decimal ThongKeDoanhThu()
        {
            decimal TongDoanhThu =db.ChiTietDonDatHangs.Sum(n => n.SoLuong * n.DonGia).Value;
            return TongDoanhThu;
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if(db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}