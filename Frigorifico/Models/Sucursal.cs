using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Frigorifico.Models;

public partial class Sucursal
{
    public int IdSucursal { get; set; }

    [DisplayName("Nombre Sucursal")]
    public string Nombre { get; set; } = null!;

    public string Ciudad { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public virtual ICollection<Distribuidor> Distribuidors { get; set; } = new List<Distribuidor>();

    public virtual ICollection<Productor> Productors { get; set; } = new List<Productor>();
}
