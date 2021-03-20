using Microsoft.AspNetCore.Http;
using NationalParksAcrossAmerica.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NationalParksAcrossAmerica.Models
{
    public class CookieHelper
    {
        const string CartCookie = "CartCookie";

        /// <summary>
        ///  gets all parks from the cookies
        /// </summary>
        /// <param name="http"></param>
        /// <returns></returns>
        public static List<ParkModel> GetCartProducts(IHttpContextAccessor http)
        {

            string existingItems = http.HttpContext.Request.Cookies[CartCookie];

            List<ParkModel> cartProducts = new List<ParkModel>();
            if (existingItems != null)
            {
                cartProducts = JsonConvert.DeserializeObject<List<ParkModel>>(existingItems);
            }

            return cartProducts;
        }

        /// <summary>
        /// add new park to cookie
        /// includes duplicates for some reason
        /// </summary>
        /// <param name="http"></param>
        /// <param name="p"></param>
        public static void AddProductToCart(IHttpContextAccessor http, ParkModel p)
        {
            List<ParkModel> cartProducts = GetCartProducts(http);
            cartProducts.Add(p);

            CookieOptions options = new CookieOptions()
            {
                Expires = DateTime.Now.AddYears(1),
                Secure = true,
                IsEssential = true
            };

            string data = JsonConvert.SerializeObject(cartProducts);

            http.HttpContext.Response.Cookies.Append(CartCookie, data, options);
        }

        /// <summary>
        /// gets all products from the cookie
        /// </summary>
        /// <param name="http"></param>
        /// <returns></returns>
        public static int GetTotalCartProducts(IHttpContextAccessor http)
        {
            List<ParkModel> cartProducts = GetCartProducts(http);
            return cartProducts.Count;
        }
    }
}