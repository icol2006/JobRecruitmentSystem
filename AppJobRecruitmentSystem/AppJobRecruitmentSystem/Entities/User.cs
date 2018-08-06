using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class User
    {
        [Required]
        [Display(Name = "Id")]
        public String id { get; set; }

        [Required]
        [Display(Name = "Email")]
        public String email { get; set; }

        [Required]
        public String password { get; set; }

        [Required]
        [Display(Name = "Rol")]
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