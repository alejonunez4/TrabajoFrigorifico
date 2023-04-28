using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Frigorifico.Models;

public partial class Productor
{
    public int IdProductor { get; set; }

    [DisplayName("Nombre Productor")]
    public string Nombre { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public int IdSucursal { get; set; }

    public virtual Sucursal? IdSucursalNavigation { get; set; }
}
