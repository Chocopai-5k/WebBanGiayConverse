﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;
using PagedList;

namespace WebBanGiayConverse.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
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
        //Tạo 1 partial view sản phẩm để hiên thị theo 2 style khac nhau
        [ChildActionOnly]
        public ActionResult SanPhamStyle1()
        {
            return PartialView();
        }
        //Xây dựng trang xem chi tiết
        public ActionResult XemChiTiet(int? id)
        {
            //Kiểm tra tham số truyền vào có rỗng hay không
            if(id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            if(sp == null)
            {
                return HttpNotFound();

            }
            return View(sp);
        }
        //Load sản phẩm theo mã loại sản phẩm
       public ActionResult SanPham(int? IDLoaiSP, int? page)
        {
            if(IDLoaiSP == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);

            }
            var lstSP = db.SanPhams.Where(n => n.IDLoaiSanPham == IDLoaiSP);
            if(lstSP.Count() == 0)
            {
                //Thông báo nếu không có sản phẩm 
                return HttpNotFound();
            }
            if(Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            int pageSize = 3;
            //Số trang hiện tại
            int pageNumber = (page ?? 1);
            ViewBag.MaLoaiSP = IDLoaiSP;
            return View(lstSP.OrderBy(n=>n.MaSP).ToPagedList(pageNumber, pageSize));
        }
    }
}