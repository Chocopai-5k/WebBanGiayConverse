using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;
using System.Web.Security;

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
            if (this.IsCaptchaValid("Captcha không hợp lệ "))
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
            string sMatKhau = f["txtMatKhau"].ToString();

            NguoiDung nd = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (nd != null)
            {
                var lstQuyen = db.PhanQuyens.Where(n => n.ID == nd.PhanQuyenID);
                string Quyen = "";
                foreach (var item in lstQuyen)
                {
                    Quyen += item.Name + ","; //Lấy quyền trong bảng chi tiết quyền và loại thành viên
                }
                Quyen = Quyen.Substring(0, Quyen.Length - 1); //Cắt đi dấu , cuối cùng (Chuỗi sau khi cắt:
                PhanQuyen(sTaiKhoan, Quyen); //Xử lý phương thức phân quyền
                //return RedirectToAction("Index", "Home");
                Session["TaiKhoan"] = nd;
                return Content("<script>window.location.reload();</script>");
                //return RedirectToAction("Index");
            }

            //return RedirectToAction("Index");
            return Content("Tài khoản hoặc mật khẩu không đúng");

        }
        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1,
            TaiKhoan,
            DateTime.Now,
            DateTime.Now.AddHours(3),
            false,
            Quyen,
            FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);
        }
        public ActionResult LoiPhanQuyen()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }
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
    }
}