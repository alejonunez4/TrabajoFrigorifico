using System;
using System.Collections.Generic;

namespace Frigorifico.Models;

public partial class Distribuidor
{
    public int IdDistribuidor { get; set; }

    public string Nombre { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public int IdSucursal { get; set; }

    public virtual Sucursal IdSucursalNavigation { get; set; } = null!;
}
