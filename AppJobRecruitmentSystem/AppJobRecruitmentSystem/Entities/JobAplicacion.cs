using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.Entities
{
    public class JobAplicacion
    {
        public int id { get; set; }
        public int id_candidate { get; set; }
        public int id_job { get; set; }
        public DateTime dateofaplication { get; set; }

        public Candidate candidate { get; set; }
        public Job job { get; set; }
    }
}