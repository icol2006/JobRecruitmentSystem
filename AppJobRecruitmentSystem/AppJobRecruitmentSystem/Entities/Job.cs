using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class Job
    {
        public int id { get; set; }        
        public String description  { get; set; }
        public DateTime date_publication { get; set; }
        public Boolean enable_job { get; set; }
        public String id_company { get; set; }

        public Company company { get; set; }

        public Job() { }

        public Job(int id,String description, DateTime date_publication, Boolean enable_job, String id_company)
        {
            this.id = id;
            this.description = description;
            this.date_publication = date_publication;
            this.enable_job = enable_job;
            this.id_company = id_company;
        }
    }
}