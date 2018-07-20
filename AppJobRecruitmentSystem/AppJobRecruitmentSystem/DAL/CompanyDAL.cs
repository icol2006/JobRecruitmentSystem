using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class CompanyDAL
    {
        SqlHelper dbManager = new SqlHelper();

        public List<Company> GetListCompanies()
        {
            List<Company> listCompanies = new List<Company>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListCompanies", CommandType.StoredProcedure, null, out connection);

            try
            {

                while (dataReader.Read())
                {
                    Company Company = new Company(); 
                    Company.id = dataReader["user_id"].ToString();
                    Company.name = dataReader["Name"].ToString();
                    Company.rol = (Rol)Convert.ToInt32(dataReader["rol"].ToString());
                    Company.Description = dataReader["Description"].ToString();

                    listCompanies.Add(Company);
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

            return listCompanies;
        }

        public Company GetCompany(Company pCompany)
        {
            Company Company = new Company();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", pCompany.id, DbType.Int32));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetCompany", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    Company.id = dataReader["user_id"].ToString();
                    Company.name = dataReader["Name"].ToString();
                    Company.rol = (Rol)Convert.ToInt32(dataReader["rol"].ToString());
                    Company.Description = dataReader["Description"].ToString();
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

            return Company;
        }

        public void InsertCompany(Company pCompany)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@User_id", 150, pCompany.id == null ? "" : pCompany.id, DbType.String));
            parameters.Add(dbManager.CreateParameter("@Name", 150, pCompany.name == null ? "" : pCompany.name, DbType.String));
            parameters.Add(dbManager.CreateParameter("@Description", 150, pCompany.Description == null ? "" : pCompany.Description, DbType.String));
  
            dbManager.ExecuteNonQuery("sp_AddCompany", CommandType.StoredProcedure, parameters.ToArray());
        }

        public void UpdateCompany(Company pCompany)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@User_id", 150, pCompany.id == null ? "" : pCompany.id, DbType.String));
            parameters.Add(dbManager.CreateParameter("@Name", 150, pCompany.name == null ? "" : pCompany.name, DbType.String));
            parameters.Add(dbManager.CreateParameter("@Description", 150, pCompany.Description == null ? "" : pCompany.Description, DbType.String));

            dbManager.ExecuteNonQuery("sp_UpdateCompany", CommandType.StoredProcedure, parameters.ToArray());
        }
    }
}