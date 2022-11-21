using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiayConverse.Models;
using PagedList;

namespace WebBanGiayConverse.Controllers
{
    public class TimKiemController : Controller
    {
        ShopGiayConverseEntities db = new ShopGiayConverseEntities();
        // GET: TimKiem
        [HttpGet]
        public ActionResult KQTimKiem(string sTuKhoa, int? page )
        {
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            int pageSize = 2;
            //Số trang hiện tại
            int pageNumber = (page ?? 1);
            var lstSP = db.SanPhams.Where(n => n.Ten.Contains(sTuKhoa));
            ViewBag.TuKhoa = sTuKhoa;
            return View(lstSP.OrderBy(n => n.Ten).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult LayTuKhoaTimKiem(string sTuKhoa)
        {

            return RedirectToAction("KQTimKiem", new { @sTuKhoa = sTuKhoa });
        }
    }
}