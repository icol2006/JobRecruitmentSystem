using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public partial class Company : User
    {
        [Required]
        [Display(Name = "Nombre")]
        public String name { get; set; }

        [Required]
        [Display(Name = "Descripcion")]
        public String Description { get; set; }

        public Company()
        {
            this.rol = Rol.company;
        }


        public Company(string id, string name, string description)
        {
            this.id = id;
            this.name = name;
            this.Description = description;
            this.rol = Rol.company;
        }

    }
}