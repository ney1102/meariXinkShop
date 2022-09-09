using System.Web;
using System.Web.Mvc;

namespace PhanTatYen_151900913
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
