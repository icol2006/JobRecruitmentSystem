using AppJobRecruitmentSystem.Entities;
using Google.Apis.Drive.v3;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppConsoleGoogleDrive
{
    public class ConsoleGoogleDrive
    {
        //public static DriveService driveService = null;

        public ConsoleGoogleDrive()
        {
            ConsoleGoogleDrive.Main(null);
        }

        public static void Main(string[] args)
        {
            DriveService driveService = MainAsync(args).GetAwaiter().GetResult();
            Console.WriteLine("kdslaj");
        }

       static async Task<DriveService> MainAsync(string[] args)
        {
            return await new DriveGoogle().GetService();
        }
    }
}
