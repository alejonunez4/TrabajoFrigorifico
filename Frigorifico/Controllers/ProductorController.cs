using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Frigorifico.Context;
using Frigorifico.Models;

namespace Frigorifico.Controllers
{
    public class ProductorController : Controller
    {
        private readonly DbFrigorificoContext _context;

        public ProductorController(DbFrigorificoContext context)
        {
            _context = context;
        }

        // GET: Productor
        public async Task<IActionResult> Index()
        {
            var dbFrigorificoContext = _context.Productor.Include(p => p.IdSucursalNavigation);
            return View(await dbFrigorificoContext.ToListAsync());
        }

        // GET: Productor/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Productor == null)
            {
                return NotFound();
            }

            var productor = await _context.Productor
                .Include(p => p.IdSucursalNavigation)
                .FirstOrDefaultAsync(m => m.IdProductor == id);
            if (productor == null)
            {
                return NotFound();
            }

            return View(productor);
        }

        // GET: Productor/Create
        public IActionResult Create()
        {
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "Nombre");
            return View();
        }

        // POST: Productor/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdProductor,Nombre,Direccion,IdSucursal")] Productor productor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(productor);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", productor.IdSucursal);
            return View(productor);
        }

        // GET: Productor/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Productor == null)
            {
                return NotFound();
            }

            var productor = await _context.Productor.FindAsync(id);
            if (productor == null)
            {
                return NotFound();
            }
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", productor.IdSucursal);
            return View(productor);
        }

        // POST: Productor/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdProductor,Nombre,Direccion,IdSucursal")] Productor productor)
        {
            if (id != productor.IdProductor)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(productor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductorExists(productor.IdProductor))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", productor.IdSucursal);
            return View(productor);
        }

        // GET: Productor/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Productor == null)
            {
                return NotFound();
            }

            var productor = await _context.Productor
                .Include(p => p.IdSucursalNavigation)
                .FirstOrDefaultAsync(m => m.IdProductor == id);
            if (productor == null)
            {
                return NotFound();
            }

            return View(productor);
        }

        // POST: Productor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Productor == null)
            {
                return Problem("Entity set 'DbFrigorificoContext.Productor'  is null.");
            }
            var productor = await _context.Productor.FindAsync(id);
            if (productor != null)
            {
                _context.Productor.Remove(productor);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductorExists(int id)
        {
            return (_context.Productor?.Any(e => e.IdProductor == id)).GetValueOrDefault();
        }
    }
}
