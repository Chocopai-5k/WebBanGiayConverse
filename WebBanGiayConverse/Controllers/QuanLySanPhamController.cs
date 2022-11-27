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
            return View(db.SanPhams.ToList());
        }
        [HttpGet]
        public ActionResult Them()
        {
            ViewBag.LoaiSP = new SelectList(db.TheLoais.OrderBy(n => n.ID), "ID", "Ten");
            return View();
        }
        [HttpPost]
        public ActionResult Them(SanPham sp)
        {
            try
            {
                ViewBag.LoaiSP = new SelectList(db.TheLoais.ToList(), "ID", "Ten");

                if (sp.imageUpdate.ContentLength > 0)
                {
                    string filename = Path.GetFileNameWithoutExtension(sp.imageUpdate.FileName);
                    string extension = Path.GetExtension(sp.imageUpdate.FileName);
                    filename = filename + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss"))+ extension;
                    sp.Anh = filename;
                    sp.imageUpdate.SaveAs(Path.Combine(Server.MapPath("~/Content/HinhAnhSP/"), filename));
                }
                    db.SanPhams.Add(sp);
                    db.SaveChanges();
                    return RedirectToAction("Index");
            }catch(Exception )
            {
                return RedirectToAction("Index");
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
            SanPham sp = db.SanPhams.Find(id);
            ViewBag.LoaiSP = new SelectList(db.TheLoais.OrderBy(n => n.ID), "ID", "Ten", sp.IDLoaiSanPham);

            if (sp == null)
            {
                return HttpNotFound();
            }
            
            return View(sp);
        }
        [HttpPost]

        public ActionResult ChinhSua(SanPham model)
        {
            ViewBag.LoaiSP = new SelectList(db.TheLoais.OrderBy(n => n.ID), "ID", "Ten", model.IDLoaiSanPham);
            if (model.imageUpdate.ContentLength > 0)
            {
                string filename = Path.GetFileNameWithoutExtension(model.imageUpdate.FileName);
                string extension = Path.GetExtension(model.imageUpdate.FileName);
                filename = filename + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                model.Anh = filename;
                model.imageUpdate.SaveAs(Path.Combine(Server.MapPath("~/Content/HinhAnhSP/"), filename));
            }
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "QuanLySanPham");
        }
        [HttpGet]
        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.LoaiSP = new SelectList(db.TheLoais.OrderBy(n => n.ID), "ID", "Ten", sp.IDLoaiSanPham);

            return View(sp);
        }
        [HttpPost]
        public ActionResult Xoa(int id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            SanPham model = db.SanPhams.SingleOrDefault(n => n.ID == id);
            if(model == null)
            {
                return HttpNotFound();
            }
            db.SanPhams.Remove(model);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}