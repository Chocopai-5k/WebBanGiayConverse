using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;

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
        //tạo trang đăng kí
        [HttpGet]
        public ActionResult DangKi()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKi(NguoiDung nd, FormCollection f)
        {
            //Kiểm tra captcha hơp lệ
            if(this.IsCaptchaValid("Captcha không hợp lệ "))
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ThongBao = "Đăng kí thành công";
                    //Thêm khách hàng vào csdl
                    db.NguoiDungs.Add(nd);
                    db.SaveChanges();
                }
                else
                {
                    ViewBag.ThongBao = "Đăng kí thất bại";
                }
                return View();
            }
            ViewBag.ThongBao = "Mã captcha không đúng";
           
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string sTaiKhoan = f["txtDangNhap"].ToString();
            string sMatKhau= f["txtMatKhau"].ToString();

            NguoiDung nd = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan==sTaiKhoan && n.MatKhau==sMatKhau);
            if (nd != null)
            {
                Session["TaiKhoan"] = nd;
                return Content("<script>window.location.reload();</script>");
                //return RedirectToAction("Index");
            }

            //return RedirectToAction("Index");
            return Content("Tài khoản hoặc mật khẩu không đúng");
        }
        //[ChildActionOnly]
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index");
        }
    }
}