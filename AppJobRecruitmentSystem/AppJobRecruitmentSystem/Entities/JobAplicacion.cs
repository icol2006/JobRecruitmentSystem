using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class JobAplication
    {
        [Required]
        [Display(Name = "Id")]
        public int id { get; set; }

        [Required]
        [Display(Name = "Id Candidato")]
        public String id_candidate { get; set; }

        [Required]
        [Display(Name = "Id Trabajo")]
        public int id_job { get; set; }

        [Required]
        [Display(Name = "Fecha de aplicacion")]
        public DateTime dateofaplication { get; set; }

        public Candidate candidate { get; set; }
        public Job job { get; set; }
    }
}