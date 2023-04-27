using System;
using System.Collections.Generic;
using Frigorifico.Models;
using Microsoft.EntityFrameworkCore;

namespace Frigorifico.Context;

public partial class DbFrigorificoContext : DbContext
{
    public DbFrigorificoContext()
    {
    }

    public DbFrigorificoContext(DbContextOptions<DbFrigorificoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Distribuidor> Distribuidor { get; set; }

    public virtual DbSet<Productor> Productor { get; set; }

    public virtual DbSet<Sucursal> Sucursal { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Distribuidor>(entity =>
        {
            entity.HasKey(e => e.IdDistribuidor);

            entity.ToTable("Distribuidor");

            entity.Property(e => e.Direccion)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdSucursalNavigation).WithMany(p => p.Distribuidors)
                .HasForeignKey(d => d.IdSucursal)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Distribuidor_Sucursal");
        });

        modelBuilder.Entity<Productor>(entity =>
        {
            entity.HasKey(e => e.IdProductor);

            entity.ToTable("Productor");

            entity.Property(e => e.Direccion)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdSucursalNavigation).WithMany(p => p.Productors)
                .HasForeignKey(d => d.IdSucursal)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Productor_Sucursal");
        });

        modelBuilder.Entity<Sucursal>(entity =>
        {
            entity.HasKey(e => e.IdSucursal);

            entity.ToTable("Sucursal");

            entity.Property(e => e.Ciudad)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Direccion)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
