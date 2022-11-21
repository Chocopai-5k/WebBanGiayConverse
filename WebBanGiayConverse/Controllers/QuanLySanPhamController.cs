using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        // GET: QuanLySanPham
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        public ActionResult Index()
        {
            return View(db.SanPhams);
        }
        [HttpGet]
        public ActionResult Them()
        {
            ViewBag.LoaiSP = new SelectList(db.TheLoais.ToList(), "ID", "Ten");
            return View();
        }
        [HttpPost]
        public ActionResult Them(HttpPostedFileBase Anh, SanPham sp)
        {
            ViewBag.LoaiSP = new SelectList(db.TheLoais.ToList(), "ID", "Ten");
            //Kiểm tra xem ảnh tồn tại chưa
            if(Anh.ContentLength > 0)
            {
                var fileName = Path.GetFileName(Anh.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/images"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                }
                else
                {
                    Anh.SaveAs(path);
                    sp.Anh = fileName;
                }
            }
            db.SanPhams.Add(sp);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

    }
}