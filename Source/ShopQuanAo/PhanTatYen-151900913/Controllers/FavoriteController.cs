using PhanTatYen_151900913.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913.Controllers
{
    public class FavoriteController : Controller
    {
        // GET: Favorite
        public QLyShopEntities db = new QLyShopEntities();
        public ActionResult Index()
        {
            var fav = Session["LIKE"] as List<ProductsModels>;
            if (fav == null)
            {
                fav = new List<ProductsModels>();
                Session["LIKE"] = fav;
            }
            ViewBag.ListFav = fav;
            return View();
        }
        public ActionResult AddItem(int id)
        {
            var fav = Session["LIKE"] as List<ProductsModels>;

            if (fav == null)
            {
                fav = new List<ProductsModels>();
                Session["LIKE"] = fav;
            }
            var search = fav.Find(x => x.MaSanPham == id);
            var prodFav = new ProductsModels();
            if (search == null)
            {
                var temp = db.SANPHAMs.Where(x => x.MaSanPham == id).FirstOrDefault();
                prodFav.MaSanPham = temp.MaSanPham;
                prodFav.Mota = temp.Mota;
                prodFav.Anhbia = temp.Anhbia;
                prodFav.TenSanPham = temp.TenSanPham;
                prodFav.GiamGia = temp.GiamGia;
                prodFav.GiaKM = (double)temp.Giaban * ((100 - ((double)temp.GiamGia)) / 100);                
                fav.Add(prodFav);
            }
            else
            {
                fav.RemoveAll(x => x.MaSanPham == id);
            }
            return RedirectToAction("Index");

        }
        public ActionResult RemoveItem(int id)
        {
            var fav = Session["LIKE"] as List<ProductsModels>;
            var search = fav.Find(x => x.MaSanPham == id);
            if (search != null)
            {
                fav.RemoveAll(x => x.MaSanPham == id);
            }

            return RedirectToAction("Index");
        }
    }
}