using AppJobRecruitmentSystem.Entities;
using AppJobRecruitmentSystem.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class CandidateDAL
    {
        SqlHelper dbManager = new SqlHelper();

        public List<Candidate> GetListCandidates()
        {
            List<Candidate> listCandidates = new List<Candidate>();

            SqlConnection connection = new SqlConnection();
            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetListCandidate", CommandType.StoredProcedure, null, out connection);

            try
            {
              
                while (dataReader.Read())
                {
                    Candidate candidate = new Candidate();
                    candidate.id = dataReader["id"].ToString();
                    candidate.email = dataReader["email"].ToString();
                    candidate.firtsname = dataReader["firstname"].ToString();
                    candidate.lastname = dataReader["lastname"].ToString();
                    candidate.identification = Convert.ToInt32(dataReader["identification"].ToString());
                    candidate.rol =(Rol) Convert.ToInt32(dataReader["rol"].ToString());
                    candidate.resume = dataReader["resume"].ToString();

                    listCandidates.Add(candidate);
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

            return listCandidates;
        }

        public Candidate GetCandidate(Candidate pCandidate)
        {
            Candidate candidate = new Candidate();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", 128, pCandidate.id, DbType.String));

            SqlDataReader dataReader = dbManager.GetDataReader("sp_GetCandidate", CommandType.StoredProcedure, parameters.ToArray(), out connection);

            try
            {

                while (dataReader.Read())
                {
                    candidate.id = dataReader["id"].ToString();
                    candidate.email = dataReader["email"].ToString();
                    candidate.firtsname = dataReader["firstname"].ToString();
                    candidate.lastname = dataReader["lastname"].ToString();
                    candidate.identification = Convert.ToInt32(dataReader["identification"].ToString());
                    candidate.rol = (Rol)Convert.ToInt32(dataReader["rol"].ToString());
                    candidate.resume = dataReader["resume"].ToString();
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

            return candidate;
        }

        public async void InsertCandidate(Candidate pCandidate)
        {
            var parameters = new List<SqlParameter>();

            try
            {
                    parameters.Add(dbManager.CreateParameter("@user_id", 128, pCandidate.id, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@firtsname", 150, pCandidate.firtsname == null ? "" : pCandidate.firtsname, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@lastname", 150, pCandidate.lastname == null ? "" : pCandidate.lastname, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@identification", 15, pCandidate.identification, DbType.Int32));
                    parameters.Add(dbManager.CreateParameter("@resume", 150, pCandidate.resume == null ? "" : pCandidate.resume, DbType.String));

                    dbManager.ExecuteNonQuery("sp_AddCandidate", CommandType.StoredProcedure, parameters.ToArray());
                
            }catch(Exception ex) {

                int dfas = 3;
            }
            int das = 3;

        }

        public void UpdateCandidate(Candidate pCandidate)
        {
            var parameters = new List<SqlParameter>();
            parameters.Add(dbManager.CreateParameter("@id", 128, pCandidate.id, DbType.String));
            parameters.Add(dbManager.CreateParameter("@firtsname", 150, pCandidate.firtsname == null ? "" : pCandidate.firtsname, DbType.String));
            parameters.Add(dbManager.CreateParameter("@lastname", 150, pCandidate.lastname == null ? "" :pCandidate.lastname, DbType.String));
            parameters.Add(dbManager.CreateParameter("@identification", 15, pCandidate.identification, DbType.Int32));
            parameters.Add(dbManager.CreateParameter("@resume", 150, pCandidate.resume == null ? "" : pCandidate.resume, DbType.String));

            dbManager.ExecuteNonQuery("sp_UpdateCandidate", CommandType.StoredProcedure, parameters.ToArray());
        }
    }
}