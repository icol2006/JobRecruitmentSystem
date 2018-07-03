using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppJobRecruitmentSystem.DAL
{
    public class SqlHelper
    {
        private string ConnectionString { get; set; }
        public SqlHelper(string connectionString)
        {
            ConnectionString = connectionString;
        }

        public SqlHelper()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["Recruiment"].ToString();
        }

        public void CloseConnection(SqlConnection connection)
        {
            connection.Close();
        }
        public SqlParameter CreateParameter(string name, object value, DbType dbType)
        {
            return CreateParameter(name, 0, value, dbType, ParameterDirection.Input);
        }
        public SqlParameter CreateParameter(string name, int size, object value, DbType dbType)
        {
            return CreateParameter(name, size, value, dbType, ParameterDirection.Input);
        }

        public SqlParameter CreateParameter(string name, int size, object value, DbType dbType, ParameterDirection direction)
        {
            return new SqlParameter
            {
                DbType = dbType,
                ParameterName = name,
                Size = size,
                Direction = direction,
                Value = value
            };
        }

        public DataTable GetDataTable(string commandText, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = commandType;
                    if (parameters != null)
                    {
                        foreach (var parameter in parameters)
                        {
                            command.Parameters.Add(parameter);
                        }
                    }
                    var dataset = new DataSet();
                    var dataAdaper = new SqlDataAdapter(command);
                    dataAdaper.Fill(dataset);
                    return dataset.Tables[0];
                }
            }
        }

        public DataSet GetDataSet(string commandText, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = commandType;
                    if (parameters != null)
                    {
                        foreach (var parameter in parameters)
                        {
                            command.Parameters.Add(parameter);
                        }
                    }
                    var dataset = new DataSet();
                    var dataAdaper = new SqlDataAdapter(command);
                    dataAdaper.Fill(dataset);
                    return dataset;
                }
            }
        }

        public SqlDataReader GetDataReader(string commandText, CommandType commandType, SqlParameter[] parameters, out SqlConnection connection)
        {
            SqlDataReader reader = null;
            connection = new SqlConnection(ConnectionString);
            connection.Open();
            var command = new SqlCommand(commandText, connection);
            command.CommandType = commandType;
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    command.Parameters.Add(parameter);
                }
            }
            reader = command.ExecuteReader();

            return reader;
        }

        public void ExecuteNonQuery(string commandText, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = commandType;
                    if (parameters != null)
                    {
                        foreach (var parameter in parameters)
                        {
                            command.Parameters.Add(parameter);
                        }
                    }
                    command.ExecuteNonQuery();
                }
            }
        }

        public object GetScalarValue(string commandText, CommandType commandType, SqlParameter[] parameters = null)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                using (var command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = commandType;
                    if (parameters != null)
                    {
                        foreach (var parameter in parameters)
                        {
                            command.Parameters.Add(parameter);
                        }
                    }
                    return command.ExecuteScalar();
                }
            }
        }

    }
}
