using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Candidate: User
    {
        [Required]
        [Display(Name = "Nombre")]
        public string firtsname { get; set; }

        [Required]
        [Display(Name = "Apellidos")]
        public String lastname { get; set; }

        [Required]
        [Display(Name = "Identificacion")]
        public int identification { get; set; }

        [Display(Name = "Curriculum")]
        public String resume { get; set; }

        public List<JobAplication> jobAplicacion { get; set; }

        public Candidate()
        {            
            rol = Rol.candidate;
        }

        public Candidate(string id, Rol rol, string firtsname, string lastname, int identification, string resume)
        {
            this.id = id;
            this.rol = rol;
            this.firtsname = firtsname;
            this.lastname = lastname;
            this.identification = identification;
            this.resume = resume;
        }
    }
}