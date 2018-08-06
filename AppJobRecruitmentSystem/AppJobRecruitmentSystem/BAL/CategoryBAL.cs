using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.BAL
{
    public class CategoryBAL
    {
        CategoryDAL categoryDAL = new CategoryDAL();

        public List<Category> GetListCategories()
        {
            return categoryDAL.GetListCategories();

        }

        public Category GetCategory(int id)
        {
            return categoryDAL.GetCategory(id);
        }
    }
}