using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.BAL
{
    public class CandidateBAL
    {
        CandidateDAL candidateDAL = new CandidateDAL();

        public List<Candidate> GetListCandidates()
        {
            return candidateDAL.GetListCandidates();
        }

        public Candidate GetCandidate(Candidate pCandidate)
        {
            return candidateDAL.GetCandidate(pCandidate);
        }

        public async void InsertCandidate(Candidate pCandidate)
        {
             candidateDAL.InsertCandidate(pCandidate);
        }

        public void UpdateCandidate(Candidate pCandidate)
        {
            candidateDAL.UpdateCandidate(pCandidate);
        }
    }
}