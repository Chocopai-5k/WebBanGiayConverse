using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;

namespace WebBanGiayConverse.Controllers
{
    public class GioHangController : Controller
    {
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        public List<ItemGioHang> LayGioHang() 
        {
            /*Giỏ hàng đã tồn tại*/
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if(lstGioHang == null)
            {
                /*Chưa tồn tại giỏ session thì khởi tạo*/
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        /*Thêm giỏ hàng*/
        public ActionResult ThemGioHang(int MaSp, string strURL)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.ID == MaSp);
            if(sp == null)
            {
                /*Đường dẫn không hợp lệ*/
                Response.StatusCode = 404;
                return null;
            }
            /*Lấy giỏ hàng*/
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.IDSanPham == MaSp);

            if(spCheck != null)
            {
                if(sp.CoSan == false)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.Gia * spCheck.SoLuong;
                return Redirect(strURL);
            }
            if (sp.CoSan == false)
            {
                return View("ThongBao");
            }
            ItemGioHang itemGH = new ItemGioHang(MaSp);
            lstGioHang.Add(itemGH);
            return Redirect(strURL);
        }
        //Tính tổng số lượng
        public double TinhTongSoLuong()
        {
            //Lấy giỏ hàng
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if(lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong);
        }
        //Tính tổng tiền
        public decimal TinhTongTien()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.ThanhTien);
        }
        // GET: GioHang
       
        public ActionResult GiohangPartial()
        {
            if(TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                ViewBag.TongTien= 0;

                return PartialView();

            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return PartialView();
        }
        public ActionResult XemGioHang()
        {
            List<ItemGioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
    }
}