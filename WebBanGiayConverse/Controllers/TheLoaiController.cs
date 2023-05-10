using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    public class TheLoaiController : Controller
    {
        // GET: TheLoai
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

        public ActionResult Index()
        {
            return View(db.TheLoais);
        }
        [HttpGet]
        public ActionResult Them()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Them(TheLoai tl)
        {
            try
            {
                db.TheLoais.Add(tl);
                db.SaveChanges();
                return RedirectToAction("Index", "TheLoai");
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "TheLoai");
            }
        }
        [HttpGet]
        public ActionResult ChinhSua(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            TheLoai sp = db.TheLoais.Find(id);
            if (sp == null)
            {
                return HttpNotFound();
            }

            return View(sp);
        }
        [HttpPost]

        public ActionResult ChinhSua(TheLoai model)
        {
            
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "TheLoai");
        }
        [HttpGet]
        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            TheLoai sp = db.TheLoais.SingleOrDefault(n => n.MaLoai == id);
            if (sp == null)
            {
                return HttpNotFound();
            }

            return View(sp);
        }
        [HttpPost]
        public ActionResult Xoa(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            TheLoai model = db.TheLoais.SingleOrDefault(n => n.MaLoai == id);
            if (model == null)
            {
                return HttpNotFound();
            }
            db.TheLoais.Remove(model);
            db.SaveChanges();

            return RedirectToAction("Index", "TheLoai");
        }
    }
}