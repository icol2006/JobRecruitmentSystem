using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.BAL
{
    public class JobBAL
    {
        JobDAL jobDAL = new JobDAL();

        public List<Job> GetListJobs()
        {
            return this.jobDAL.GetListJobs();
        }

        public Job GetJob(Job pJob)
        {
            return this.jobDAL.GetJob(pJob);
        }

        public void InsertJob(Job pJob)
        {
             this.jobDAL.InsertJob(pJob);
        }

        public void UpdateJob(Job pJob)
        {
            this.jobDAL.UpdateJob(pJob);
        }
    }
}