﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NationalParksAcrossAmerica.Data;
using NationalParksAcrossAmerica.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NationalParksAcrossAmerica.Controllers
{
    public class ParksController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ParksController(ApplicationDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// How mnay parks per page
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IActionResult> Index(int? id)
        {
            int pageNum = id ?? 1;
            const int PageSize = 20;
            ViewData["CurrentPage"] = pageNum;

            int numProducts = await ParkDB.GetTotalProductsAsync(_context);
            int totalPages = (int)Math.Ceiling((double)numProducts / PageSize);
            ViewData["MaxPage"] = totalPages;

            List<ParkModel> products = await ParkDB.GetProductsAsync(_context, PageSize, pageNum);


            
            return View(products);
        }

        /// <summary>
        ///  adds a new park but doesnt work as whos going to make a natinal park
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(ParkModel p)
        {
            if (ModelState.IsValid)
            {
                p = await ParkDB.AddProductAsync(_context, p);

                TempData["Message"] = $"{p.ParkName} was added successfully";

                
                return RedirectToAction("Index");
            }

            return View();
        }

        // The following actions are for admins only and have not been implemented yet

        /// <summary>
        /// lets you edit a 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            ParkModel p = await ParkDB.GetProductAsync(_context, id);
            return View(p);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ParkModel p)
        {
            if (ModelState.IsValid)
            {
                _context.Entry(p).State = EntityState.Modified;
                await _context.SaveChangesAsync();

                ViewData["Message"] = "Product updated successfully";
            }

            return View(p);
        }

        /// <summary>
        /// lets you delete a park, if needed
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            ParkModel p = await ParkDB.GetProductAsync(_context, id);

            return View(p);
        }

        /// <summary>
        /// just conforms you want that park deleted
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            ParkModel p = await ParkDB.GetProductAsync(_context, id);

            _context.Entry(p).State = EntityState.Deleted;

            await _context.SaveChangesAsync();

            TempData["Message"] = $"{p.ParkName} was deleted";

            return RedirectToAction("Index");
        }
    }
}