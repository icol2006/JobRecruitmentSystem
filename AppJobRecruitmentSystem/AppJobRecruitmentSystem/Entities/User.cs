using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class User
    {
        public String id { get; set; }
        public String email { get; set; }
        public String password { get; set; }
        public Rol rol { get; set; }

        public User() { }

        public User(String pId, String pEmail, String pPassword, Rol pRol)
        {
            this.id = id;
            this.email = pEmail;
            this.password = pPassword;
            this.rol = rol;
        }
    }
}