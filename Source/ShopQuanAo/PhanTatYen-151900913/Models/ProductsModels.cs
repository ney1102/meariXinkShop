using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhanTatYen_151900913.Models
{
    public class ProductsModels
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal? Giaban { get; set; }
        public string Mota { get; set; }
        public string Anhbia { get; set; }
        public DateTime? Ngaycapnhat { get; set; }
        public int? Soluongton { get; set; }
        public int? MaLoai { get; set; }
        public int? MaNCC { get; set; }
        public bool? DaXoa { get; set; }
        public string Anhbia2 { get; set; }
        public int? GiamGia { get; set; }
        public int? DanhGia { get; set; }
        public string Anhbia3 { get; set; }
        public string TenNhaCungCap { get; set; }
        public double? GiaKM { get; set; }
        public string TenLoaiSanPham { get; set; }
        public int SL { get; set; }
        public double? GiaTong { get; set; }
        public string GioiTinh { get; set; }
        public double? Sum { get; set; }
    }
}