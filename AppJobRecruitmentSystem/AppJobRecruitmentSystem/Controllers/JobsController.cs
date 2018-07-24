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

namespace AppJobRecruitmentSystem.Controllers
{
    public class JobsController : Controller
    {
        private JobBAL db = new JobBAL();


        // GET: Jobs
        public ActionResult Index()
        {
            List<Job> list = db.GetListJobs();

            for (int i = 0; i < list.Count; i++)
            {
                list[i].company = new CompanyBAL().GetCompany(new Company(list[i].id_company, "", ""));
            }
            return View(list);
        }

        public ActionResult JobsbyCompany(String id_company)
        {
            List<Job> list = db.GetListJobs();

            for (int i = 0; i < list.Count; i++)
            {
                list[i].company = new CompanyBAL().GetCompany(new Company(list[i].id_company, "", ""));
            }

            list=  list.FindAll(x=>x.id_company== id_company).ToList();
            return View("Index", list);
        }

        // GET: Jobs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job =new Job();
            job.id = (int)id;
            job = db.GetJob(job);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // GET: Jobs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Jobs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,description,date_publication,enable_job,id_company")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.InsertJob(job);
                return RedirectToAction("Index");
            }

            return View(job);
        }

        // GET: Jobs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = new Job();
            job.id = (int)id;
            job = db.GetJob(job);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,description,date_publication,enable_job,id_company")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.UpdateJob(job);
                return RedirectToAction("Index");
            }
            return View(job);
        }

        // GET: Jobs/Delete/5
        /*public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }*/

        // POST: Jobs/Delete/5
        /*[HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
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
