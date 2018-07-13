﻿using AppJobRecruitmentSystem.Entities;
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

        public List<JobAplicacion> GetListJobAplicacions()
        {
            List<JobAplicacion> listJobAplicacions = new List<JobAplicacion>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListJobAplicacion", CommandType.StoredProcedure, null, out connection);

            try
            {

                while (dataReader.Read())
                {
                    JobAplicacion JobAplicacion = new JobAplicacion();
                    JobAplicacion.id = Convert.ToInt32(dataReader["id"].ToString());
                    JobAplicacion.id_job = Convert.ToInt32(dataReader["id_job"].ToString());
                    JobAplicacion.id_candidate = Convert.ToInt32(dataReader["id_candidate"].ToString());
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

        public JobAplicacion GetJobAplicacion(JobAplicacion pJobAplicacion)
        {
            JobAplicacion JobAplicacion = new JobAplicacion();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", pJobAplicacion.id, DbType.Int32));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetJobAplicacion", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    JobAplicacion.id = Convert.ToInt32(dataReader["id"].ToString());
                    JobAplicacion.id_job = Convert.ToInt32(dataReader["id_job"].ToString());
                    JobAplicacion.id_candidate = Convert.ToInt32(dataReader["id_candidate"].ToString());
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

        public void InsertJobAplicacion(JobAplicacion pJobAplicacion)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@id_job", 150, pJobAplicacion.id_job, DbType.Int16));
            parameters.Add(dbManager.CreateParameter("@id_candidate", 150, pJobAplicacion.id_candidate, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@dateofaplication", 150, pJobAplicacion.dateofaplication, DbType.DateTime));

            dbManager.ExecuteNonQuery("sp_AddJobAplicacion", CommandType.StoredProcedure, parameters.ToArray());
        }

        public void UpdateJobAplicacion(JobAplicacion pJobAplicacion)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@id", 2, pJobAplicacion.id, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@id_job", 150, pJobAplicacion.id_job, DbType.Int16));
            parameters.Add(dbManager.CreateParameter("@id_candidate", 150, pJobAplicacion.id_candidate, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@dateofaplication", 150, pJobAplicacion.dateofaplication, DbType.DateTime));

            dbManager.ExecuteNonQuery("sp_UpdateJobAplicacion", CommandType.StoredProcedure, parameters.ToArray());
        }
    }
}