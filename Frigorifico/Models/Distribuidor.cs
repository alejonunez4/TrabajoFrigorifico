using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Frigorifico.Models;

public class Distribuidor
{
    public int IdDistribuidor { get; set; }

    [DisplayName("Nombre Distribuidor")]
    public string Nombre { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public int IdSucursal { get; set; }

    public virtual Sucursal? IdSucursalNavigation { get; set; }
}
