using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class JobDAL
    {
        SqlHelper dbManager = new SqlHelper();

        public List<Job> GetListJobs()
        {
            List<Job> listJobs = new List<Job>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListJobs", CommandType.StoredProcedure, null, out connection);

            try
            {

                while (dataReader.Read())
                {
                    Job Job = new Job();
                    Job.id = Convert.ToInt32(dataReader["user_id"].ToString());
                    Job.id_company = Convert.ToInt32(dataReader["company_id"].ToString());
                    Job.description = dataReader["description"].ToString();
                    Job.date_publication =Convert.ToDateTime(dataReader["date_publication"].ToString());
                    Job.enable_job =(Boolean) Convert.ToBoolean(dataReader["enable_job"]);

                    listJobs.Add(Job);
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

            return listJobs;
        }

        public Job GetJob(Job pJob)
        {
            Job Job = new Job();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", pJob.id, DbType.Int32));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetJob", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    Job.id = Convert.ToInt32(dataReader["user_id"].ToString());
                    Job.id_company = Convert.ToInt32(dataReader["company_id"].ToString());
                    Job.description = dataReader["description"].ToString();
                    Job.date_publication = Convert.ToDateTime(dataReader["date_publication"].ToString());
                    Job.enable_job = (Boolean)Convert.ToBoolean(dataReader["enable_job"]);
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

            return Job;
        }

        public void InsertJob(Job pJob)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@company_id", 2, pJob.id_company, DbType.Int16));
            parameters.Add(dbManager.CreateParameter("@description", 150, pJob.description == null ? "" : pJob.description, DbType.String));
            parameters.Add(dbManager.CreateParameter("@date_publication", 2, pJob.date_publication, DbType.Date));
            parameters.Add(dbManager.CreateParameter("@enable_job", 1, pJob.date_publication, DbType.Boolean));

            dbManager.ExecuteNonQuery("sp_AddJob", CommandType.StoredProcedure, parameters.ToArray());
        }

        public void UpdateJob(Job pJob)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@id", 2, pJob.id, DbType.Int16));
            parameters.Add(dbManager.CreateParameter("@company_id", 2, pJob.id_company, DbType.Int16));
            parameters.Add(dbManager.CreateParameter("@description", 150, pJob.description == null ? "" : pJob.description, DbType.String));
            parameters.Add(dbManager.CreateParameter("@date_publication", 2, pJob.date_publication, DbType.Date));
            parameters.Add(dbManager.CreateParameter("@enable_job", 1, pJob.date_publication, DbType.Boolean));

            dbManager.ExecuteNonQuery("sp_UpdateJob", CommandType.StoredProcedure, parameters.ToArray());
        }
    }
}