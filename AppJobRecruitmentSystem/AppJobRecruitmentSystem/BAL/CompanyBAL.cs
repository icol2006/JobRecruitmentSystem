using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.BAL
{
    public class CompanyBAL
    {
        CompanyDAL companyDAL = new CompanyDAL();

        public List<Company> GetListCompanies()
        {
            return companyDAL.GetListCompanies();
        }

        public Company GetCompany(String id)
        {
            return companyDAL.GetCompany(id);
        }

        public void InsertCompany(Company pCompany)
        {
            companyDAL.InsertCompany(pCompany);
        }

        public void UpdateCompany(Company pCompany)
        {
            companyDAL.UpdateCompany(pCompany);
        }
    }
}
