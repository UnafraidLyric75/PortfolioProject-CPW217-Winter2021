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
        /// returns the current list of cart products. If cart is empty 
        /// an empty list will be returned
        /// </summary>
        /// <param name="http"></param>
        /// <returns>An empty list if cart is empty</returns>
        public static List<ParkModel> GetCartProducts(IHttpContextAccessor http)
        {

            // get existing cart items
            string existingItems = http.HttpContext.Request.Cookies[CartCookie];

            List<ParkModel> cartProducts = new List<ParkModel>();
            if (existingItems != null)
            {
                cartProducts = JsonConvert.DeserializeObject<List<ParkModel>>(existingItems);
            }

            return cartProducts;
        }

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

        public static bool DoesExists(IHttpContextAccessor _httpContext,ParkModel p)
        {
            List<ParkModel> list = GetCartProducts(_httpContext);

            if (list.Contains(p))
            {
                return true;
            }

            return false;
        }

        public static int GetTotalCartProducts(IHttpContextAccessor http)
        {
            List<ParkModel> cartProducts = GetCartProducts(http);
            return cartProducts.Count;
        }
    }
}