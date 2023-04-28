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
    public class DistribuidorController : Controller
    {
        private readonly DbFrigorificoContext _context;

        public DistribuidorController(DbFrigorificoContext context)
        {
            _context = context;
        }

        // GET: Distribuidor
        public async Task<IActionResult> Index()
        {
            var dbFrigorificoContext = _context.Distribuidor.Include(d => d.IdSucursalNavigation);
            return View(await dbFrigorificoContext.ToListAsync());
        }

        // GET: Distribuidor/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Distribuidor == null)
            {
                return NotFound();
            }

            var distribuidor = await _context.Distribuidor
                .Include(d => d.IdSucursalNavigation)
                .FirstOrDefaultAsync(m => m.IdDistribuidor == id);
            if (distribuidor == null)
            {
                return NotFound();
            }

            return View(distribuidor);
        }

        // GET: Distribuidor/Create
        public IActionResult Create()
        {
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "Nombre");
            return View();
        }

        // POST: Distribuidor/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdDistribuidor,Nombre,Direccion,IdSucursal")] Distribuidor distribuidor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(distribuidor);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", distribuidor.IdSucursal);
            return View(distribuidor);
        }

        // GET: Distribuidor/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Distribuidor == null)
            {
                return NotFound();
            }

            var distribuidor = await _context.Distribuidor.FindAsync(id);
            if (distribuidor == null)
            {
                return NotFound();
            }
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", distribuidor.IdSucursal);
            return View(distribuidor);
        }

        // POST: Distribuidor/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdDistribuidor,Nombre,Direccion,IdSucursal")] Distribuidor distribuidor)
        {
            if (id != distribuidor.IdDistribuidor)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(distribuidor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DistribuidorExists(distribuidor.IdDistribuidor))
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
            ViewData["IdSucursal"] = new SelectList(_context.Sucursal, "IdSucursal", "IdSucursal", distribuidor.IdSucursal);
            return View(distribuidor);
        }

        // GET: Distribuidor/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Distribuidor == null)
            {
                return NotFound();
            }

            var distribuidor = await _context.Distribuidor
                .Include(d => d.IdSucursalNavigation)
                .FirstOrDefaultAsync(m => m.IdDistribuidor == id);
            if (distribuidor == null)
            {
                return NotFound();
            }

            return View(distribuidor);
        }

        // POST: Distribuidor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Distribuidor == null)
            {
                return Problem("Entity set 'DbFrigorificoContext.Distribuidor'  is null.");
            }
            var distribuidor = await _context.Distribuidor.FindAsync(id);
            if (distribuidor != null)
            {
                _context.Distribuidor.Remove(distribuidor);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DistribuidorExists(int id)
        {
            return (_context.Distribuidor?.Any(e => e.IdDistribuidor == id)).GetValueOrDefault();
        }
    }
}
