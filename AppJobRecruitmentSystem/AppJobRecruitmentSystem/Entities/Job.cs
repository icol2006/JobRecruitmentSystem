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
        public int id_company { get; set; }

        public Company company { get; set; }
    }
}