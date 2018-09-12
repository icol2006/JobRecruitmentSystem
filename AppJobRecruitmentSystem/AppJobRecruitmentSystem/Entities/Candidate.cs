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

        [Display(Name = "Estado civil")]
        public String maritalStatus { get; set; }
                
        [Display(Name = "Lugar de residencia")]
        public String placeResidence { get; set; }

        [Required]
        [Display(Name = "Telefono")]
        public int phone { get; set; }

        [Required]
        [Display(Name = "Fecha de nacimiento")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime birthdate { get; set; }
        
        [Display(Name = "Nacionalidad")]
        public String nationality { get; set; }
        
        public List<JobAplication> jobAplicacion { get; set; }

        public Candidate()
        {            
            rol = Rol.candidate;
        }

        public Candidate(string id, Rol rol, string firtsname, string lastname, int identification, string resume,
            String maritalStatus, String placeResidence, int phone, DateTime birthdate, String nationality)
        {
            this.id = id;
            this.rol = rol;
            this.firtsname = firtsname;
            this.lastname = lastname;
            this.identification = identification;
            this.resume = resume;
            this.maritalStatus = maritalStatus;
            this.placeResidence = placeResidence;
            this.phone = phone;
            this.birthdate = birthdate;
            this.nationality = nationality;
        }
    }
}