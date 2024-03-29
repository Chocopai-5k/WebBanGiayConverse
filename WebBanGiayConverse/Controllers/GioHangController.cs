﻿using System;
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
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSp);
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
        //Chỉnh sửa giỏ hàng
        public ActionResult SuaGioHang(int MaSp)
        {
            //Kiểm tra session giỏ hàng tồn tại chưa
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSp);
            if (sp == null)
            {
                /*Đường dẫn không hợp lệ*/
                Response.StatusCode = 404;
                return null;
            }
            //Lấy list giỏ hàng từ session
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.IDSanPham == MaSp);
            if(spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //Lấy list gio hang bang tao giao dien
            ViewBag.GioHang = lstGioHang;
            return View(spCheck);
        }
        //Cập nhật giỏ hàng
        [HttpPost]
        public ActionResult CapNhatGioHang(ItemGioHang itemGH)
            {
            SanPham spCheck = db.SanPhams.Single(n => n.MaSP == itemGH.IDSanPham);
            if (spCheck.CoSan == false)
            {
                return View("ThongBao");
            }
            //Cập nhật sô lượng trong giỏ hàng
            List<ItemGioHang> lstGH = LayGioHang();

            ItemGioHang itemGHUpdate = lstGH.Find(n => n.IDSanPham == itemGH.IDSanPham);

            itemGHUpdate.SoLuong = itemGH.SoLuong;
            itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.Gia;
            return RedirectToAction("XemGioHang");
        }
        //Xóa giỏ hàng
        public ActionResult XoaGioHang(int MaSp)
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSp);
            if (sp == null)
            {
                /*Đường dẫn không hợp lệ*/
                Response.StatusCode = 404;
                return null;
            }
            //Lấy list giỏ hàng từ session
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.IDSanPham == MaSp);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang");
        }
        public ActionResult ThemGioHangAjax(int MaSp, string strURL)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSp);
            if (sp == null)
            {
                /*Đường dẫn không hợp lệ*/
                Response.StatusCode = 404;
                return null;
            }
            /*Lấy giỏ hàng*/
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.IDSanPham == MaSp);

            if (spCheck != null)
            {
                if (sp.CoSan == false)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.Gia * spCheck.SoLuong;
                ViewBag.TongSoLuong = TinhTongSoLuong();
                ViewBag.TongTien = TinhTongTien();
                return PartialView("GioHangPartial");
            }
            if (sp.CoSan == false)
            {
                return View("ThongBao");
            }
            ItemGioHang itemGH = new ItemGioHang(MaSp);
            lstGioHang.Add(itemGH);
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return PartialView("GioHangPartial");
        }
        public ActionResult DatHang(NguoiDung nd)
        {
            if(Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");

            }
            NguoiDung nguoiDung = new NguoiDung();
            if (Session["TaiKhoan"] == null)
            {
                nguoiDung = nd;
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
            }
            else
            {
                NguoiDung tv = Session["TaiKhoan"] as NguoiDung;
                nguoiDung.Ten = tv.Ten;
                nguoiDung.DiaChi = tv.DiaChi;
                nguoiDung.Email = tv.Email;
                nguoiDung.SoDienThoai = tv.SoDienThoai;
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
            }
            //Thêm đơn hàng
            DonDatHang ddh = new DonDatHang();
            ddh.MaND = nguoiDung.MaND;
            ddh.NgayDat = DateTime.Now;
            ddh.TinhTrangGiaoHang = false;
            ddh.DaThanhToan = false;
            ddh.UuDai = 0;
            db.DonDatHangs.Add(ddh);
            db.SaveChanges();
            //Thêm chi tiết đơn đặt hàng
            List<ItemGioHang> lstGH = LayGioHang();
            foreach(var item in lstGH)
            {
                ChiTietDonDatHang ctdh = new ChiTietDonDatHang();
                ctdh.MaDDH = ddh.MaDDH;
                ctdh.MaSP = item.IDSanPham;
                ctdh.TenSP = item.TenSp;
                ctdh.SoLuong = item.SoLuong;
                ctdh.DonGia = item.Gia;
                db.ChiTietDonDatHangs.Add(ctdh);
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XemGioHang");
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