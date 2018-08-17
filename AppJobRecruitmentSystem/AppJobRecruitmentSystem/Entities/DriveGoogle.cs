using System;
using Google.Apis.Drive.v3.Data;
using Google.Apis.Logging;
using Google.Apis.Services;
using Google.Apis.Upload;
using Google.Apis.Util.Store;
using System.Threading.Tasks;
using Google.Apis.Auth.OAuth2;
using System.IO;
using System.Threading;
using Google.Apis.Drive.v3;
using Google.Apis.Download;

namespace AppJobRecruitmentSystem.Entities
{
    public class DriveGoogle
    {
        static string ApplicationName = "Drive API .NET Quickstart";


        private const int KB = 0x400;
        private const int DownloadChunkSize = 256 * KB;

        // CHANGE THIS with full path to the file you want to upload  
        //private const string UploadFileName = @"FILE_TO_UPLOAD";  
        public string fileName = @"";

        private string typeFile = @"application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        // CHANGE THIS with a download directory  
        //private const string DownloadDirectoryName = @"DIRECTORY_FOR_DOWNLOADING";  
        public string DownloadDirectoryName = "";

        // CHANGE THIS if you upload a file type other than a jpg  
        private const string ContentType = @"application/vnd.openxmlformats-officedocument.wordprocessingml.document";

        private static readonly string[] Scopes = new[] { DriveService.Scope.DriveFile, DriveService.Scope.Drive };
 

        /// The file which was uploaded. We will use its download Url to download it using our media downloader object.  
        ///   
        public  Google.Apis.Drive.v3.Data.File uploadedFile;
       

        public async Task<DriveService> GetService()
        {
            UserCredential credential;

            using (var stream =
                new FileStream("credentials.json", FileMode.Open, FileAccess.Read))
            {
                string credPath = "token.json";
                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true)).Result;
                Console.WriteLine("Credential file saved to: " + credPath);
            }

            // Create Drive API service.
            DriveService driveService = new DriveService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });


            return driveService;

        }

        public async Task<Stream> downloadFile(DriveService driveService, String fileId)
        {

            var request = driveService.Files.Get(fileId);
            var stream = new System.IO.MemoryStream();

            // Add a handler which will be notified on progress changes.
            // It will notify on each chunk download and when the
            // download is completed or failed.
            request.MediaDownloader.ProgressChanged +=
                (IDownloadProgress progress) =>
                {
                    switch (progress.Status)
                    {
                        case DownloadStatus.Downloading:
                            {
                                //Console.WriteLine(progress.BytesDownloaded);
                                break;
                            }
                        case DownloadStatus.Completed:
                            {
                                // saveFile(stream, @"/filex/" + fileName);

                                //Console.WriteLine("Download complete.");
                                break;
                            }
                        case DownloadStatus.Failed:
                            {
                                //Console.WriteLine("Download failed.");
                                break;
                            }
                    }

                };
            request.Download(stream);
            return stream;
        }

        public async Task UploadFile(DriveService service)
        {
            var fileMetadata = new Google.Apis.Drive.v3.Data.File()
            {
                Name = fileName
            };
            
            FilesResource.CreateMediaUpload request;
            using (var stream = new System.IO.FileStream(DownloadDirectoryName+fileName,
                                    System.IO.FileMode.Open))
            {
                request = service.Files.Create(
                    fileMetadata, stream, typeFile);
                request.Fields = "id";
                request.Upload();
            }
            uploadedFile = request.ResponseBody;


        }

        public async Task saveFile(MemoryStream stream, String Path)
        {
            using (stream)
            {
                StreamWriter writer = new StreamWriter(stream);

                //You have to rewind the MemoryStream before copying
                stream.Seek(0, SeekOrigin.Begin);

                using (FileStream fs = new FileStream(Path, FileMode.OpenOrCreate))
                {
                    stream.CopyTo(fs);
                    fs.Flush();
                }
            }
        }



    }
}