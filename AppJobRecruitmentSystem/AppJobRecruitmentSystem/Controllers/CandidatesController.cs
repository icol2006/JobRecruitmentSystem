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

           Candidate x= can.GetCandidate(list[0]);

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
            candidate = db.GetCandidate(candidate);
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

        // POST: Candidates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,firtsname,lastname,identification,resume,email,password,rol")] Candidate candidate)
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
            candidate = db.GetCandidate(candidate);
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
        public ActionResult Edit([Bind(Include = "id,firtsname,lastname,identification,resume,email,password,rol")] Candidate candidate)
        {
            if (ModelState.IsValid)
            {
                db.UpdateCandidate(candidate);
                return RedirectToAction("Index");
            }
            return View(candidate);
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
