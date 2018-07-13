using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.BAL
{
    public class JobAplicationBAL
    {
        JobAplicationDAL jobAplicationDAL = new JobAplicationDAL();

        public List<JobAplicacion> GetListJobAplicacions()
        {
            return jobAplicationDAL.GetListJobAplicacions();
        }

        public JobAplicacion GetJobAplicacion(JobAplicacion pJobAplicacion)
        {
            return jobAplicationDAL.GetJobAplicacion(pJobAplicacion);
        }

        public void InsertJobAplicacion(JobAplicacion pJobAplicacion)
        {
            jobAplicationDAL.InsertJobAplicacion(pJobAplicacion);
        }

        public void UpdateJobAplicacion(JobAplicacion pJobAplicacion)
        {
            this.jobAplicationDAL.UpdateJobAplicacion(pJobAplicacion);
        }
    }
}