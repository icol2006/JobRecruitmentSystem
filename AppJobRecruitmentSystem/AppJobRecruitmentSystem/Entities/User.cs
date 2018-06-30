using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class User
    {
        public int id { get; set; }
        public String email { get; set; }
        public String password { get; set; }
        public Rol rol { get; set; }

    }
}