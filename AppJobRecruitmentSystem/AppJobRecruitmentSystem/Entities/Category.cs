using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Category
    {
        [Required]
        [Display(Name = "Id")]
        public int id
        {
            get; set;
        }

        [Required]
        [Display(Name = "Categoria")]
        public String name
        {
            get; set;
        }

        public Category() { }

        public Category(int id, string name)
        {
            this.id = id;
            this.name = name;
        }

    }
}