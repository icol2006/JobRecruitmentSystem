using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Company : User
    {
        public String name { get; set; }
        public String Description { get; set; }

        public Company()
        {
            this.rol = Rol.Company;
        }


        public Company(string id, string name, string description)
        {
            this.id = id;
            this.name = name;
            this.Description = description;
            this.rol = Rol.Company;
        }

    }
}