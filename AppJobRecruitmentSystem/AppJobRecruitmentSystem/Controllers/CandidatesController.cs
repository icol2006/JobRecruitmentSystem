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
using Google.Apis.Drive.v3;

namespace AppJobRecruitmentSystem.Controllers
{
    public class CandidatesController : Controller
    {
        private CandidateBAL db = new CandidateBAL();
        // GET: Candidates
        public ActionResult Index()
        {
            return View(db.GetListCandidates());
        }

        public async Task<ActionResult> loadCandidates()
        {
            List<Candidate> listCandidate = new List<Candidate>();
            CandidateBAL can = new CandidateBAL();

            List<Candidate> list = getCandidates();

            foreach (Candidate pCandidate in list)
            {
                var UserManager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser { UserName = pCandidate.email, Email = pCandidate.email };
                IdentityUserRole rol = new IdentityUserRole();

                var result = await UserManager.CreateAsync(user, pCandidate.password);

                var result2 = await UserManager.AddToRoleAsync(user.Id, "1");

                pCandidate.id = user.Id;
                if (result.Succeeded && result2.Succeeded)
                {
                    new CandidateBAL().InsertCandidate(pCandidate);
                }
            }


            list = new List<Candidate>();
            list = can.GetListCandidates();

           Candidate x= can.GetCandidate(list[0].id);

            return View(list);

        }

        public List<Candidate> getCandidates()
        {
            List<Candidate> listCandidate = new List<Candidate>();
            Candidate candidate = new Candidate();

            candidate.email = "adskjl@al.com";
            candidate.firtsname = "dasl";
            candidate.identification = 43;
            candidate.password = "Pescado03-";
            listCandidate.Add(candidate);

            candidate = new Candidate();
            candidate.email = "adskjl2@al.com";
            candidate.firtsname = "dasl2";
            candidate.identification = 432;
            candidate.password = "Pescado03-";
            listCandidate.Add(candidate);

            candidate = new Candidate();
            candidate.email = "adskjl3@al.com";
            candidate.firtsname = "dasl3";
            candidate.identification = 433;
            candidate.password = "Pescado03-";
            listCandidate.Add(candidate);

            return listCandidate;
        }

        // GET: Candidates/Details/5
        public ActionResult Details(String id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candidate candidate = new Candidate();
            candidate.id =(String) id;
            candidate = db.GetCandidate(candidate.id);
            if (candidate == null)
            {
                return HttpNotFound();
            }
            return View(candidate);
        }

        // GET: Candidates/Create
        public ActionResult Create()
        {
            return View();
        }

        public FileStreamResult GetPDF()
        {
            FileStream fs = new FileStream("c:\\cover.pdf", FileMode.Open, FileAccess.Read);
            return File(fs, "application/pdf");
        }

        // POST: Candidates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,firtsname,lastname,identification,resume")] Candidate candidate)
        {
            if (ModelState.IsValid)
            {
                db.InsertCandidate(candidate);
                return RedirectToAction("Index");
            }

            return View(candidate);
        }

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
        public ActionResult Edit([Bind(Include = "id,firtsname,lastname,identification,resume,email")] Candidate candidate)
        {
            if (ModelState.IsValid)
            {
                db.UpdateCandidate(candidate);
                return RedirectToAction("Index");
            }
            return View(candidate);
        }

        [HttpPost]
        public async Task<String> Upload()
        {
            String resultado = "",  idCandidate="";
            DriveGoogle drivegoogle = new DriveGoogle();

            idCandidate = Request.Form.GetValues("id")[0];

            DriveService driveService = await drivegoogle.GetService();
            drivegoogle.DownloadDirectoryName = Server.MapPath("~/App_Data/");

            for (int i = 0; i < Request.Files.Count; i++)
            {
                var file = Request.Files[i];

                if (file.ContentType.Equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))
                {
                    var fileName = Path.GetFileName(file.FileName);

                    var path = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
                    file.SaveAs(path);

                    drivegoogle.fileName = fileName;

                    await drivegoogle.UploadFile(driveService);

                    resultado= drivegoogle.uploadedFile.Id;
                    var candidate=  db.GetCandidate(idCandidate);
                    candidate.resume = resultado;
                    db.UpdateCandidate(candidate);

                }
            }

            return resultado;
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
