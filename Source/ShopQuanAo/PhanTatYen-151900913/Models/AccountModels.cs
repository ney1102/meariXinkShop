using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PhanTatYen_151900913.Models
{
    public class AccountModels
    {
        public int MaKH { get; set; }
        public string HoTen { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập tài khoản . . .")]
        [StringLength(20, ErrorMessage = "Tải khoản chỉ được tối đa là 20 ký tự !")]
        [MinLength(6, ErrorMessage = "Tải khoản không được ít hơn 6 ký tự !")]
        public string TaiKhoan { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu . . .")]
        [MinLength(6, ErrorMessage = "Mật khẩu không được ít hơn 6 ký tự !")]
        public string MatKhau { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập lại mật khẩu . . .")]
        [MinLength(6, ErrorMessage = "Bạn chưa nhập lại mật khẩu . . .")]
        public string NhapLaiMatKhau { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string DienThoai { get; set; }
    }
}