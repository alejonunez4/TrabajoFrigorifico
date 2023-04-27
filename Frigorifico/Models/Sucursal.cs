using System;
using System.Collections.Generic;

namespace Frigorifico.Models;

public partial class Sucursal
{
    public int IdSucursal { get; set; }

    public string Nombre { get; set; } = null!;

    public string Ciudad { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public virtual ICollection<Distribuidor> Distribuidors { get; set; } = new List<Distribuidor>();

    public virtual ICollection<Productor> Productors { get; set; } = new List<Productor>();
}
