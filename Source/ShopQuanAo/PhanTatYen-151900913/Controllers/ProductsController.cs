using PhanTatYen_151900913.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913.Controllers
{
    public class ProductsController : Controller
    {
        private QLyShopEntities db = new QLyShopEntities();
        // GET: Products
        public ActionResult Home()
        {
            var listProd = db.SANPHAMs.Where(sp => sp.DaXoa == false)
                .Select(sp => new Models.ProductsModels
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    Anhbia = sp.Anhbia,
                    Giaban = sp.Giaban,
                    Mota = sp.Mota,
                    Soluongton = sp.Soluongton,
                    MaNCC = sp.MaNCC,
                    MaLoai = sp.MaLoai,
                    Anhbia2 = sp.Anhbia2,
                    DanhGia = sp.DanhGia,
                    DaXoa = sp.DaXoa,
                    GiamGia = sp.GiamGia,
                    TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                    GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
                }
                )
                .ToList();
            ViewBag.SanPham = listProd;

            var listVay = db.SANPHAMs.Where(x => x.MaLoai == 1).Select(sp => new Models.ProductsModels
            {
                MaSanPham = sp.MaSanPham,
                TenSanPham = sp.TenSanPham,
                Anhbia = sp.Anhbia,
                Giaban = sp.Giaban,
                Mota = sp.Mota,
                Soluongton = sp.Soluongton,
                MaNCC = sp.MaNCC,
                MaLoai = sp.MaLoai,
                Anhbia2 = sp.Anhbia2,
                DanhGia = sp.DanhGia,
                DaXoa = sp.DaXoa,
                GiamGia = sp.GiamGia,
                TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
            }
                )
                .ToList();
            ViewBag.Vay = listVay;

            var listSoMi = db.SANPHAMs.Where(sps => sps.MaLoai == 2).Select(sp => new Models.ProductsModels
            {
                MaSanPham = sp.MaSanPham,
                TenSanPham = sp.TenSanPham,
                Anhbia = sp.Anhbia,
                Giaban = sp.Giaban,
                Mota = sp.Mota,
                Soluongton = sp.Soluongton,
                MaNCC = sp.MaNCC,
                MaLoai = sp.MaLoai,
                Anhbia2 = sp.Anhbia2,
                DanhGia = sp.DanhGia,
                DaXoa = sp.DaXoa,
                GiamGia = sp.GiamGia,
                TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
            }
                )
                .ToList();
            ViewBag.SoMi = listSoMi;

            var listDam = db.SANPHAMs.Where(spv => spv.MaLoai == 3).Select(sp => new Models.ProductsModels
            {
                MaSanPham = sp.MaSanPham,
                TenSanPham = sp.TenSanPham,
                Anhbia = sp.Anhbia,
                Giaban = sp.Giaban,
                Mota = sp.Mota,
                Soluongton = sp.Soluongton,
                MaNCC = sp.MaNCC,
                MaLoai = sp.MaLoai,
                Anhbia2 = sp.Anhbia2,
                DanhGia = sp.DanhGia,
                DaXoa = sp.DaXoa,
                GiamGia = sp.GiamGia,
                TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
            }
                )
                .ToList();
            ViewBag.Dam = listDam;
            var listSpHot = db.SANPHAMs.Where(spv => spv.GiamGia > 35).Select(sp => new Models.ProductsModels
            {
                MaSanPham = sp.MaSanPham,
                TenSanPham = sp.TenSanPham,
                Anhbia = sp.Anhbia,
                Giaban = sp.Giaban,
                Mota = sp.Mota,
                Soluongton = sp.Soluongton,
                MaNCC = sp.MaNCC,
                MaLoai = sp.MaLoai,
                Anhbia2 = sp.Anhbia2,
                DanhGia = sp.DanhGia,
                DaXoa = sp.DaXoa,
                GiamGia = sp.GiamGia,
                TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
            }
                )
                .ToList();
            ViewBag.SpHot = listSpHot;
            return View();
        }
        public ActionResult Detail(int id)
        {
            var Prod = db.SANPHAMs.Where(sp => sp.DaXoa == false && sp.MaSanPham == id)
                .Select(sp => new Models.ProductsModels
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    Anhbia = sp.Anhbia,
                    Giaban = sp.Giaban,
                    Mota = sp.Mota,
                    Soluongton = sp.Soluongton,
                    MaNCC = sp.MaNCC,
                    MaLoai = sp.MaLoai,
                    Anhbia2 = sp.Anhbia2,
                    DanhGia = sp.DanhGia,
                    DaXoa = sp.DaXoa,
                    GiamGia = sp.GiamGia,
                    TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                    GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100),
                    TenLoaiSanPham = sp.LoaiSP.TenLoaiSp
                }
                )
                .FirstOrDefault();
            ViewBag.Prod1 = Prod;
          
            return View();
        }
        public ActionResult Catelogy()
        {
            var listProd = db.SANPHAMs.Where(sp => sp.DaXoa == false)
                .Select(sp => new Models.ProductsModels
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    Anhbia = sp.Anhbia,
                    Giaban = sp.Giaban,
                    Mota = sp.Mota,
                    Soluongton = sp.Soluongton,
                    MaNCC = sp.MaNCC,
                    MaLoai = sp.MaLoai,
                    Anhbia2 = sp.Anhbia2,
                    DanhGia = sp.DanhGia,
                    DaXoa = sp.DaXoa,
                    GiamGia = sp.GiamGia,
                    TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                    GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
                }
                )
                .ToList();
            ViewBag.SanPham = listProd;
            return View();
        }
        public ActionResult Catelogy2(int Maloai)
        {
            var listProd = db.SANPHAMs.Where(sp => sp.MaLoai == Maloai && sp.DaXoa ==false)
                .Select(sp => new Models.ProductsModels
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    Anhbia = sp.Anhbia,
                    Giaban = sp.Giaban,
                    Mota = sp.Mota,
                    Soluongton = sp.Soluongton,
                    MaNCC = sp.MaNCC,
                    MaLoai = sp.MaLoai,
                    Anhbia2 = sp.Anhbia2,
                    DanhGia = sp.DanhGia,
                    DaXoa = sp.DaXoa,
                    GiamGia = sp.GiamGia,
                    TenNhaCungCap = sp.NHACUNGCAP.TenNCC,
                    GiaKM = (double)sp.Giaban * ((100 - ((double)sp.GiamGia)) / 100)
                }
                )
                .ToList();
            ViewBag.SanPham = listProd;
            return View();
        }

    }
}