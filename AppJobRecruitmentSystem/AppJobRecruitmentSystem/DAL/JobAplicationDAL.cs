using AppJobRecruitmentSystem.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class JobAplicationDAL
    {
        SqlHelper dbManager = new SqlHelper();

        public List<JobAplication> GetListJobAplicacions()
        {
            List<JobAplication> listJobAplicacions = new List<JobAplication>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListJobAplication", CommandType.StoredProcedure, null, out connection);

            try
            {

                while (dataReader.Read())
                {
                    JobAplication JobAplicacion = new JobAplication();
                    JobAplicacion.id = Convert.ToInt32(dataReader["id"].ToString());
                    JobAplicacion.id_job = Convert.ToInt32(dataReader["id_job"].ToString());
                    JobAplicacion.id_candidate = dataReader["id_candidate"].ToString();
                    JobAplicacion.dateofaplication = Convert.ToDateTime(dataReader["dateofaplication"].ToString());

                    listJobAplicacions.Add(JobAplicacion);
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

            return listJobAplicacions;
        }

        public JobAplication GetJobAplicacion(int id)
        {
            JobAplication JobAplicacion = new JobAplication();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", id, DbType.Int32));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetJobAplication", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    JobAplicacion.id = Convert.ToInt32(dataReader["id"].ToString());
                    JobAplicacion.id_job = Convert.ToInt32(dataReader["id_job"].ToString());
                    JobAplicacion.id_candidate = dataReader["id_candidate"].ToString();
                    JobAplicacion.dateofaplication = Convert.ToDateTime(dataReader["dateofaplication"].ToString());
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

            return JobAplicacion;
        }

        public void InsertJobAplicacion(JobAplication pJobAplicacion)
        {
            var parameters = new List<SqlParameter>();

            try
            {
                parameters.Add(dbManager.CreateParameter("@id_job", pJobAplicacion.id_job, DbType.Int16));
                parameters.Add(dbManager.CreateParameter("@id_candidate", pJobAplicacion.id_candidate, DbType.String));
                parameters.Add(dbManager.CreateParameter("@dateofaplication", pJobAplicacion.dateofaplication, DbType.DateTime));

                dbManager.ExecuteNonQuery("sp_AddJobAplication", CommandType.StoredProcedure, parameters.ToArray());
            }
            catch (Exception ex)
            {

            }

        }

        public void UpdateJobAplicacion(JobAplication pJobAplicacion)
        {
            var parameters = new List<SqlParameter>();

            try
            {
                parameters.Add(dbManager.CreateParameter("@id", pJobAplicacion.id, DbType.Int32));
                parameters.Add(dbManager.CreateParameter("@id_job", pJobAplicacion.id_job, DbType.Int16));
                parameters.Add(dbManager.CreateParameter("@id_candidate", pJobAplicacion.id_candidate, DbType.String));
                parameters.Add(dbManager.CreateParameter("@dateofaplication", pJobAplicacion.dateofaplication, DbType.DateTime));

                dbManager.ExecuteNonQuery("sp_UpdateJobAplication", CommandType.StoredProcedure, parameters.ToArray());
            }
            catch (Exception ex)
            {

               
            }

        }

        public void DeleteJobAplicacion(int? id_job)
        {
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            try
            {
                parameters.Add(dbManager.CreateParameter("@id", id_job, DbType.Int32));
                dbManager.ExecuteNonQuery("sp_DeleteJobAplication", CommandType.StoredProcedure, parameters.ToArray());

            }
            catch (Exception ex)
            {
            }

        }
    }
}