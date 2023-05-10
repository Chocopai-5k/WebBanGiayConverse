using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    [Authorize(Roles = "Quantri")]

    public class QuanLyPhieuNhapController : Controller
    {
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [HttpGet]
        public ActionResult NhapHang()
        {
            ViewBag.MaNCC = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;
            return View();
        }
        [HttpPost]
        public ActionResult NhapHang(PhieuNhap model,IEnumerable<ChiTietPhieuNhap> LstModel)
        {
            ViewBag.MaNCC = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;

            model.DaXoa = false;
            db.PhieuNhaps.Add(model);
            db.SaveChanges();
            foreach(var item in LstModel)
            {
                item.MaPN = model.MaPN;

            }
            db.ChiTietPhieuNhaps.AddRange(LstModel);
            db.SaveChanges();
            return View();
        }
    }
}