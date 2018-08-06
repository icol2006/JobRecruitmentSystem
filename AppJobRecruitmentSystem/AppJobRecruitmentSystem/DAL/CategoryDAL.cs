using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class CategoryDAL
    {
        SqlHelper dbManager = new SqlHelper();

        public List<Category> GetListCategories()
        {
            List<Category> listCategories = new List<Category>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListCategories", CommandType.StoredProcedure, null, out connection);

            try
            {

                while (dataReader.Read())
                {
                    Category category = new Category();
                    category.id = Convert.ToInt32(dataReader["id"].ToString());
                    category.name = dataReader["name"].ToString();

                    listCategories.Add(category);
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                dataReader.Close();
                dbManager.CloseConnection(connection);
            }

            return listCategories;
        }

        public Category GetCategory(int id)
        {
            Category category = new Category();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", 128, id, DbType.Int32));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetCategory", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    category.id = Convert.ToInt32(dataReader["id"].ToString());
                    category.name = dataReader["name"].ToString();
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                dataReader.Close();
                dbManager.CloseConnection(connection);
            }

            return category;
        }

    }
}