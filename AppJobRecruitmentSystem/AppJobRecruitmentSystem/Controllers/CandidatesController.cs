using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppJobRecruitmentSystem.Entities;
using AppJobRecruitmentSystem.Models;
using AppJobRecruitmentSystem.BAL;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.IO;
//using Google.Apis.Drive.v3;
using Microsoft.AspNet.Identity;
using Microsoft.Office.Interop.Word;
using System.IO.Packaging;
using DocumentFormat.OpenXml.Packaging;
using OpenXmlPowerTools;
using System.Xml.Linq;

namespace AppJobRecruitmentSystem.Controllers
{
    [Authorize]
    public class CandidatesController : Controller
    {
        private CandidateBAL db = new CandidateBAL();

        // GET: Candidates/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candidate candidate = new Candidate();
            candidate.id = id;
            candidate = db.GetCandidate(candidate.id);


            List<SelectListItem> lst = new List<SelectListItem>();

            lst.Add(new SelectListItem() { Text = "Soltero(a)", Value = "Soltero(a)" });
            lst.Add(new SelectListItem() { Text = "Casado(a)", Value = "Casado(a)" });
            lst.Add(new SelectListItem() { Text = "Viudo(a)", Value = "Viudo(a)" });
            lst.Where(x => x.Value.Equals(candidate.maritalStatus.Trim())).FirstOrDefault().Selected=true;

            ViewBag.maritalStatus = lst;

            if (candidate == null)
            {
                return HttpNotFound();
            }
            return View(candidate);
        }

        // POST: Candidates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,firtsname,lastname,identification,resume,maritalStatus,placeResidence,phone,Birthdate,Nationality")] Candidate candidate)
        {
            ModelState.Remove("email");

            if (ModelState.IsValid)
            {
                db.UpdateCandidate(candidate);
                return RedirectToAction("Index","Jobs");
            }


            List<SelectListItem> lst = new List<SelectListItem>();

            lst.Add(new SelectListItem() { Text = "Soltero(a)", Value = "Soltero(a)"});
            lst.Add(new SelectListItem() { Text = "Casado(a)", Value = "Casado(a)" });
            lst.Add(new SelectListItem() { Text = "Viudo(a)", Value = "Viudo(a)" });
            lst.Where(x => x.Value.Equals(candidate.maritalStatus.Trim())).FirstOrDefault().Selected=true;
            
            ViewBag.maritalStatus = lst;

            return View(candidate);
        }

        [HttpPost]
        public String Upload()
        {
            String resumen = "",  idCandidate="",result="";

            try
            {
                idCandidate = Request.Form.GetValues("id")[0];

                if (!Directory.Exists(Server.MapPath("~/App_Data/")))
                {
                    Directory.CreateDirectory(Server.MapPath("~/App_Data/"));
                }


                for (int i = 0; i < Request.Files.Count; i++)
                {
                    var file = Request.Files[i];

                    if (file.ContentType.Equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))
                    {
                        var ext = Path.GetExtension(Path.GetFileName(file.FileName));

                        resumen = idCandidate + ext;
                        var path = Path.Combine(Server.MapPath("~/App_Data/"), resumen);
                        file.SaveAs(path);
                        result = convertHtml();

                        var candidate = db.GetCandidate(idCandidate);
                        candidate.resume = resumen;
                        db.UpdateCandidate(candidate);

                    }
                }

            }
            catch (Exception ex)
            {

                result = ex.Message;
            }
  
            return result;
            
        }


        public String getResume(String id)
        {
           String path = Server.MapPath("~/App_Data/"), userid="",result="";


            if (id == null)
            {
                userid = User.Identity.GetUserId();
            }
            else
            {
                userid = id;
            }

            result = System.IO.File.ReadAllText(Server.MapPath("~/App_Data/"+ userid+".html"));

            return result;
        }

        public String convertHtml()
        {
            String filename = "", path = "", userid = "",  originalFile = "";

            userid = User.Identity.GetUserId();


            path = Server.MapPath("~/App_Data/");

            if (System.IO.File.Exists(path + userid + ".doc"))
            {
                filename = userid + ".doc";
            }
            if (System.IO.File.Exists(path + userid + ".docx"))
            {
                filename = userid + ".docx";
            }

            originalFile = path + filename;

            //var source = Package.Open(originalFile);
            var document = WordprocessingDocument.Open(originalFile,true);           
            HtmlConverterSettings settings = new HtmlConverterSettings();
            XElement html = HtmlConverter.ConvertToHtml(document, settings);
            var writer = System.IO.File.CreateText(path+userid+".html");
            writer.WriteLine(html.ToString());
            writer.Dispose();
            document.Close();

            return (html.ToString());
        }

        [HttpGet]
        public ActionResult GetFile(String candidateId)
        {
            String filename = "", path="", ext="";
            String userid = "";
  
            if (candidateId == null)
            {
                userid = User.Identity.GetUserId();
            }else
            {
                userid = candidateId;
            }

           
            path = Server.MapPath("~/App_Data/");

            if (System.IO.File.Exists(path+userid+".doc"))
            {
                filename = userid + ".doc";
            }
            if (System.IO.File.Exists(path+userid + ".docx"))
            {
                filename = userid + ".docx";
            }

            String originalFile =path+filename;
            ext = Path.GetExtension(filename);

            return File(originalFile, "application/vnd.openxmlformats-officedocument.wordprocessingml.document",RandomString(12)+ ext);
        }

        public string RandomString(int length)
        {
           Random random = new Random();

         string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }


        public void DeleteFile()
        {
            String path = Server.MapPath("~/App_Data/");
            String userid = User.Identity.GetUserId();

            String convertedFile = path + userid + ".pdf";

            if (System.IO.File.Exists(convertedFile))
            {
                     System.IO.File.Delete(convertedFile);
            }
        }

        [AllowAnonymous]
        public FileResult DownloadCandidateManual()
        {
            if(!Directory.Exists(Server.MapPath("~/App_Data/")))
            {
                Directory.CreateDirectory(Server.MapPath("~/App_Data/"));
            }
            byte[] fileBytes = System.IO.File.ReadAllBytes(Server.MapPath("~/App_Data/" + "Manual de ayuda de Usuarios.pdf"));
            string fileName = "Manual de ayuda de Usuarios.pdf";
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Pdf, fileName);
        }


        // GET: Candidates/Delete/5
        /* public ActionResult Delete(int? id)
         {
             if (id == null)
             {
                 return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
             }
             Candidate candidate = db.Candidates.Find(id);
             if (candidate == null)
             {
                 return HttpNotFound();
             }
             return View(candidate);
         }*/

        // POST: Candidates/Delete/5
        /* [HttpPost, ActionName("Delete")]
         [ValidateAntiForgeryToken]
         public ActionResult DeleteConfirmed(int id)
         {
             Candidate candidate = db.Candidates.Find(id);
             db.Candidates.Remove(candidate);
             db.SaveChanges();
             return RedirectToAction("Index");
         }*/

        /*protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }*/
    }
}
