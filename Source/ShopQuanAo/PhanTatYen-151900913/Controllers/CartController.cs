using PhanTatYen_151900913.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public QLyShopEntities db = new QLyShopEntities();
        public ActionResult Index()
        {
            var cart = Session["CART"] as List<ProductsModels>;
            if (cart == null)
            {
                cart = new List<ProductsModels>();
                Session["CART"] = cart;
            }
            ViewBag.GioHang = cart;
            return View();
        }
        public ActionResult AddCart(int id)
        {
            var cart = Session["CART"] as List<ProductsModels>;
            
            if (cart == null)
            {
                cart = new List<ProductsModels>();
                Session["CART"] = cart;
            }
            var search = cart.Find(x => x.MaSanPham == id);            
            var prod = new ProductsModels();
            if(search == null)
            {
                var temp = db.SANPHAMs.Where(x => x.MaSanPham == id).FirstOrDefault();
                prod.MaSanPham = temp.MaSanPham;
                prod.Mota = temp.Mota;
                prod.Anhbia = temp.Anhbia;
                prod.TenSanPham = temp.TenSanPham;
                prod.GiamGia = temp.GiamGia;
                prod.GiaKM = (double)temp.Giaban * ((100 - ((double)temp.GiamGia)) / 100);
                prod.GiaTong = (double)temp.Giaban * ((100 - ((double)temp.GiamGia)) / 100);
                prod.SL = 1;
                prod.Sum = prod.SL;
                cart.Add(prod);
            }
            else
            {
                search.SL += 1;
                search.GiaTong = search.GiaKM * search.SL;
            }
            return RedirectToAction("Index");

        }
        public ActionResult RemoveCart(int id)
        {
            var cart = Session["CART"] as List<ProductsModels>;
            var search = cart.Find(x => x.MaSanPham == id);
            if (search != null)
            {
                cart.RemoveAll(x => x.MaSanPham == id);
            }
            
            return RedirectToAction("Index");
        }
        public ActionResult Remove1Item(int id)
        {
            var cart = Session["CART"] as List<ProductsModels>;

            if (cart == null)
            {
                cart = new List<ProductsModels>();
                Session["CART"] = cart;
            }
            var search = cart.Find(x => x.MaSanPham == id);
            var prod = new ProductsModels();
            if (search == null)
            {
                var temp = db.SANPHAMs.Where(x => x.MaSanPham == id).FirstOrDefault();
                prod.MaSanPham = temp.MaSanPham;
                prod.Mota = temp.Mota;
                prod.Anhbia = temp.Anhbia;
                prod.TenSanPham = temp.TenSanPham;
                prod.GiamGia = temp.GiamGia;
                prod.GiaKM = (double)temp.Giaban * ((100 - ((double)temp.GiamGia)) / 100);
                prod.GiaTong = (double)temp.Giaban * ((100 - ((double)temp.GiamGia)) / 100);
                cart.Add(prod);
            }
            else if(search.SL >= 1)
            {
                search.SL -= 1;
            }
            else
            {
                search.SL = 0;
                search.GiaTong = search.GiaKM * search.SL;
            }    
            return RedirectToAction("Index");
        }
        public ActionResult MiniCart()
        {
           
            var cart = Session["CART"] as List<ProductsModels>;
           
           
            ViewBag.Cart = cart;

            return PartialView("_MiniCart");
        }
        public ActionResult Sum()
        {
            var cart = Session["CART"] as List<ProductsModels>;
            double? temp = 0;
            foreach (var  i in cart)
            {
                i.Sum = i.SL * i.GiaKM;
                temp = i.Sum;
            }
            ViewBag.SUM = temp;
            return PartialView();
        }
    }
}