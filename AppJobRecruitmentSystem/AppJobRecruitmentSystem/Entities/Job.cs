using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Job
    {
        [Required]
        [Display(Name = "Id")]
        public int id { get; set; }

        [Required]
        [Display(Name = "Puesto")]
        public String name { get; set; }

        [Required]
        [Display(Name = "Descripcion")]
        public String description  { get; set; }

       
        [Required]
        [Display(Name = "Publicacion de oferta")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime date_publication { get; set; }

        [Required]
        [Display(Name = "Habilitar Oferta")]
        public Boolean enable_job { get; set; }

        [Required]
        [Display(Name = "Id Compania")]
        public String id_company { get; set; }

        [Required]
        [Display(Name = "Id Categoria")]
        public int id_category { get; set; }

        public Company company { get; set; }
        public Category category { get; set; }

        public Job() { }

        public Job(int id,String description, DateTime date_publication, Boolean enable_job, 
            String id_company, int id_category, String name)
        {
            this.id = id;
            this.description = description;
            this.date_publication = date_publication;
            this.enable_job = enable_job;
            this.id_company = id_company;
            this.id_category = id_category;
            this.name = name;
        }

    }
}