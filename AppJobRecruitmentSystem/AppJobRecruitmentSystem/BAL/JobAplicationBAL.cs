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

        public List<JobAplication> GetListJobAplicacions()
        {
            return jobAplicationDAL.GetListJobAplicacions();
        }

        public JobAplication GetJobAplicacion(int id)
        {
            return jobAplicationDAL.GetJobAplicacion(id);
        }

        public void InsertJobAplicacion(JobAplication pJobAplicacion)
        {
            jobAplicationDAL.InsertJobAplicacion(pJobAplicacion);
        }

        public void UpdateJobAplicacion(JobAplication pJobAplicacion)
        {
            this.jobAplicationDAL.UpdateJobAplicacion(pJobAplicacion);
        }

        public void DeleteJobAplicacion(int id_job)
        {
            this.jobAplicationDAL.DeleteJobAplicacion(id_job);
        }

        }
}