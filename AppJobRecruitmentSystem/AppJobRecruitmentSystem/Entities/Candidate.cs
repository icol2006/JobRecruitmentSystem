using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Candidate: User
    {
        public string firtsname { get; set; }
        public String lastname { get; set; }
        public int identification { get; set; }
        public String resume { get; set; }

        public List<JobAplicacion> jobAplicacion { get; set; }

        public Candidate()
        {            
            rol = Rol.Candidate;
        }
    }
}