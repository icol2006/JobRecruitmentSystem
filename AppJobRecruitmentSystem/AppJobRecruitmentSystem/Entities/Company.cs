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

    }
}