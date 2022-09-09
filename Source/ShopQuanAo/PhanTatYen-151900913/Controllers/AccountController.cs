using PhanTatYen_151900913.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        private QLyShopEntities db = new QLyShopEntities();
        private KHACHHANG tk = new KHACHHANG();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignIn(AccountModels model)
        {
            if (model.NhapLaiMatKhau == model.MatKhau && model.MatKhau != null)
            {
                tk.MaKH = model.MaKH;
                tk.HoTen = model.HoTen;
                tk.MatKhau = model.MatKhau;
                tk.NgaySinh = model.NgaySinh;
                tk.TaiKhoan = model.TaiKhoan;
                tk.DienThoai = model.DienThoai;
                tk.Email = model.Email;

                db.KHACHHANGs.Add(tk);
                db.SaveChanges();
                var login = db.KHACHHANGs
                .Where(x => x.TaiKhoan == model.TaiKhoan && x.MatKhau == model.MatKhau)
                .FirstOrDefault();
                if (tk != null)
                {
                    Session["USER"] = tk;
                    return Content("<script language='javascript' type='text/javascript'>alert('Đăng nhập thành công!'); window.location = '../../Products/Home';</script>");
                    return RedirectToAction("Home", "Products");
                }
            }

            return View();
        }
        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }
       
        [HttpPost]
        public ActionResult LogIn(AccountModels model)
        {
            var tk = db.KHACHHANGs
                 .Where(x => x.TaiKhoan == model.TaiKhoan && x.MatKhau == model.MatKhau)
                 .FirstOrDefault();
            if(tk != null)
            {
                Session["USER"] = tk;
                return Content("<script language='javascript' type='text/javascript'>alert('Đăng nhập thành công!');window.location = '../../Products/Home' ;</script>");
                return RedirectToAction("Home", "Products");
            }
            return RedirectToAction("SignIn", "Account");
        }
        
        public ActionResult _LogOut()
        {
            Session["USER"] = null;
            return RedirectToAction("Home", "Products");
        }
      
        public ActionResult _NameUser()
        {
            var user = Session["USER"];
            ViewBag.User = user;
            return PartialView();
        }

        public ActionResult _LogOutPati()
        {
            var user = Session["USER"];
            ViewBag.User = user;
            return PartialView();
        }
    }
}