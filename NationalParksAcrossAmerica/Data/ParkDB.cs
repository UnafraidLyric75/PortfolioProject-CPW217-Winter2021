using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using NationalParksAcrossAmerica.Models;
using Microsoft.EntityFrameworkCore;

namespace NationalParksAcrossAmerica.Data
{
    public class ParkDB
    {
        public async static Task<int> GetTotalProductsAsync(ApplicationDbContext _context)
        {
            return await (from p in _context.Parks
                          select p).CountAsync();
        }

        public async static Task<List<ParkModel>> GetProductsAsync(ApplicationDbContext _context, int pageSize, int pageNum)
        {
            return await (from p in _context.Parks
                          orderby p.ParkName ascending
                          select p)
                       .Skip(pageSize * (pageNum - 1))
                       .Take(pageSize)
                       .ToListAsync();
        }

        public async static Task<ParkModel> AddProductAsync(ApplicationDbContext _context, ParkModel p)
        {
            _context.Parks.Add(p);
            await _context.SaveChangesAsync();
            return p;
        }

        public static async Task<ParkModel> GetProductAsync(ApplicationDbContext context, int prodid)
        {
            ParkModel p = await (from products in context.Parks
                               where products.ParkId == prodid
                               select products).SingleAsync();

            return p;
        }
    }
}
