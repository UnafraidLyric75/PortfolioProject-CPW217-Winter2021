using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using NationalParksAcrossAmerica.Data;
using NationalParksAcrossAmerica.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;


/// <summary>
/// nothing is finsihed here as i cant get does not exist to works at all,
/// dont know why my logic it bad
/// </summary>
namespace NationalParksAcrossAmerica.Controllers
{
    public class CartController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IHttpContextAccessor _httpContext;

        public CartController(ApplicationDbContext context, IHttpContextAccessor httpContext)
        {
            _context = context;
            _httpContext = httpContext;
        }

        /// <summary>
        /// Adds item to visited list
        /// </summary>
        /// <param name="id"></param>
        /// <param name="previosUrl"></param>
        /// <returns></returns>
        public async Task<IActionResult> AddVisited(int id, string previosUrl)
        {

            // Get product from the database
            ParkModel p = await ParkDB.GetProductAsync(_context, id);
            List<ParkModel> parks =  CookieHelper.GetCartProducts(_httpContext);
            // stops same park from ebing added again
            if (parks.Contains(p))
            {
                TempData["Message"] = p.ParkName + " was already added successfully";
            }
            else
            {
                CookieHelper.AddProductToCart(_httpContext, p);
                TempData["Message"] = p.ParkName + " was added successfully";
            }
            // redirct back to prevoius page
            return Redirect(previosUrl);
        }

        /// <summary>
        /// adds item to wish to vist list
        /// </summary>
        /// <param name="id"></param>
        /// <param name="previosUrl"></param>
        /// <returns></returns>
        public async Task<IActionResult> AddWishToVisit(int id, string previosUrl)
        {

            // Get product from the database
            ParkModel p = await ParkDB.GetProductAsync(_context, id);

            // redirct back to prevoius page
            return Redirect(previosUrl);
        }

        public IActionResult Summary()
        {
            List<ParkModel> cartProducts = CookieHelper.GetCartProducts(_httpContext);
            return View(cartProducts);
        }
    }
}
