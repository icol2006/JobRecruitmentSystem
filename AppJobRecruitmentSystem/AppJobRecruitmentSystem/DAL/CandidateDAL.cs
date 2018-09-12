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

        public Candidate GetCandidate(String id)
        {
            Candidate candidate = new Candidate();
            var parameters = new List<SqlParameter>();
            SqlConnection connection = new SqlConnection();

            parameters.Add(dbManager.CreateParameter("@id", 128, id, DbType.String));

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
                    candidate.maritalStatus= dataReader["maritalStatus"].ToString();
                    candidate.placeResidence = dataReader["placeResidence"].ToString();
                    candidate.phone= Convert.ToInt32(dataReader["phone"].ToString());
                    candidate.birthdate = Convert.ToDateTime(dataReader["birthdate"].ToString());
                    candidate.nationality = dataReader["nationality"].ToString();
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

        public void InsertCandidate(Candidate pCandidate)
        {
            var parameters = new List<SqlParameter>();

            try
            {
                    parameters.Add(dbManager.CreateParameter("@user_id", 128, pCandidate.id, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@firtsname", 150, pCandidate.firtsname == null ? "" : pCandidate.firtsname, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@lastname", 150, pCandidate.lastname == null ? "" : pCandidate.lastname, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@identification", 15, pCandidate.identification, DbType.Int32));
                    parameters.Add(dbManager.CreateParameter("@resume", 150, pCandidate.resume == null ? "" : pCandidate.resume, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@maritalStatus", 150, pCandidate.maritalStatus == null ? "" : pCandidate.maritalStatus, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@placeResidence", 150, pCandidate.placeResidence == null ? "" : pCandidate.placeResidence, DbType.String));
                    parameters.Add(dbManager.CreateParameter("@phone", 15, pCandidate.phone, DbType.Int32));
                    parameters.Add(dbManager.CreateParameter("@birthdate", pCandidate.birthdate, DbType.DateTime));
                    parameters.Add(dbManager.CreateParameter("@nationality", 150, pCandidate.nationality == null ? "" : pCandidate.nationality, DbType.String));

                dbManager.ExecuteNonQuery("sp_AddCandidate", CommandType.StoredProcedure, parameters.ToArray());
                
            }catch(Exception ex) {

            
            }


        }

        public void UpdateCandidate(Candidate pCandidate)
        {
            var parameters = new List<SqlParameter>();

            try
            {
                parameters.Add(dbManager.CreateParameter("@id", 128, pCandidate.id, DbType.String));
                parameters.Add(dbManager.CreateParameter("@firtsname", 150, pCandidate.firtsname == null ? "" : pCandidate.firtsname, DbType.String));
                parameters.Add(dbManager.CreateParameter("@lastname", 150, pCandidate.lastname == null ? "" : pCandidate.lastname, DbType.String));
                parameters.Add(dbManager.CreateParameter("@identification", 15, pCandidate.identification, DbType.Int32));
                parameters.Add(dbManager.CreateParameter("@resume", 150, pCandidate.resume == null ? "" : pCandidate.resume, DbType.String));
                parameters.Add(dbManager.CreateParameter("@maritalStatus", 150, pCandidate.maritalStatus == null ? "" : pCandidate.maritalStatus, DbType.String));
                parameters.Add(dbManager.CreateParameter("@placeResidence", 150, pCandidate.placeResidence == null ? "" : pCandidate.placeResidence, DbType.String));
                parameters.Add(dbManager.CreateParameter("@phone", 15, pCandidate.phone, DbType.Int32));
                parameters.Add(dbManager.CreateParameter("@birthdate", pCandidate.birthdate, DbType.DateTime));
                parameters.Add(dbManager.CreateParameter("@nationality", 150, pCandidate.nationality == null ? "" : pCandidate.nationality, DbType.String));

                dbManager.ExecuteNonQuery("sp_UpdateCandidate", CommandType.StoredProcedure, parameters.ToArray());
            }
            catch (Exception ex)
            {

            }

        }
    }
}