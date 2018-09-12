using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Models
{
    public class JobApplicationDetails
    {
        public Job job { get; set; }
        public IEnumerable<JobApplicationInfo> listJobApplicationInfo { get; set; }
    }

    public class JobApplicationInfo
    {
        [Display(Name = "Id Oferta trabajo")]
        public int id_jobOffer { get; set; }

        [Required]
        [Display(Name = "Id Candidato")]
        public String id_candidate { get; set; }

        [Required]
        [Display(Name = "Id Trabajo")]
        public int id_job { get; set; }

        [Required]
        [Display(Name = "Envio de curriculum")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime dateofaplication { get; set; }

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

        [Display(Name = "Telefono")]
        public int phone { get; set; }

        [Display(Name = "Fecha de nacimiento")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime birthdate { get; set; }

        [Display(Name = "Nacionalidad")]
        public String nationality { get; set; }
    }
}