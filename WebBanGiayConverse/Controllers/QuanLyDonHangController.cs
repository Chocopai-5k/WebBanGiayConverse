using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    [Authorize(Roles = "Quantri")]

    public class QuanLyDonHangController : Controller
    {
        // GET: QuanLyDonHang
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
        public ActionResult ChuaThanhToan()
        {
            var lst = db.DonDatHangs.Where(n => n.DaThanhToan == false).OrderBy(n => n.NgayDat);
            return View(lst);
        }
        public ActionResult ChuaGiao()
        {
            var LstDHCG = db.DonDatHangs.Where(n => n.TinhTrangGiaoHang== false&& n.DaThanhToan==true).OrderBy(n => n.NgayGiao);
            return View(LstDHCG);
        }
        public ActionResult DaGiaoDaThanhToan()
        {
            var lstDHCG = db.DonDatHangs.Where(n => n.DaThanhToan == true && n.DaThanhToan==true);            
            return View(lstDHCG);
        }
        [HttpGet]
        public ActionResult DuyetDonHang(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest); 
            }
            DonDatHang model = db.DonDatHangs.SingleOrDefault(n => n.MaDDH == id);
            if(model == null)
            {
                return HttpNotFound();

            }
            var lstChiTietDH = db.ChiTietDonDatHangs.Where(n => n.MaDDH == id);
            ViewBag.ListChiTietDH = lstChiTietDH;
            return View(model);
        }
        [HttpPost]
        public ActionResult DuyetDonHang(DonDatHang ddh)
        {
            DonDatHang ddhUpdate = db.DonDatHangs.Single(n => n.MaDDH == ddh.MaDDH);
            ddhUpdate.DaThanhToan = ddh.DaThanhToan;
            ddhUpdate.TinhTrangGiaoHang = ddh.TinhTrangGiaoHang;
            db.SaveChanges();
            var lstChiTietDH = db.ChiTietDonDatHangs.Where(n => n.MaDDH == ddh.MaDDH);
            ViewBag.ListChiTietDH = lstChiTietDH;
            return View(ddhUpdate);
        }
    }
}