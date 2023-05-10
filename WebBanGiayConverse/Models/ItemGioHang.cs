using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanGiayConverse.Models
{
    public class ItemGioHang
    {
        public int IDSanPham { get; set; }
        public string TenSp { get; set; }   
        public decimal Gia { get; set; }
        public int SoLuong { get; set; }
        public string HinhAnh { get; set; }

        public decimal ThanhTien { get; set; }
        public ItemGioHang(int IMaSP)
        {
            using (ShopGiayConverseEntities db = new ShopGiayConverseEntities())
            {
                this.IDSanPham = IMaSP;
                SanPham sp = db.SanPhams.Single(n => n.MaSP == IDSanPham);
                this.TenSp = sp.TenSP;
                this.HinhAnh = sp.Anh;
                this.Gia = sp.Gia.Value;
                this.SoLuong = 1;
                this.ThanhTien = Gia * SoLuong;
            }
        }
        public ItemGioHang(int IMaSP, int sl)
        {
            using (ShopGiayConverseEntities db = new ShopGiayConverseEntities())
            {
                this.IDSanPham = IMaSP;
                SanPham sp = db.SanPhams.Single(n => n.MaSP == IDSanPham);
                TenSp = sp.TenSP;
                HinhAnh = sp.Anh;
                Gia = sp.Gia.Value;
                this.SoLuong = sl;
                ThanhTien = Gia * SoLuong;

            }
        }
        public ItemGioHang()
        {

        }
    }
}