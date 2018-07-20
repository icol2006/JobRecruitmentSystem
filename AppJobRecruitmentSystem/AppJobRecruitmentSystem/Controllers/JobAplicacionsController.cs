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
    public class JobAplicacionsController : Controller
    {
        private JobAplicationBAL db = new JobAplicationBAL();

        // GET: JobAplicacions
        public ActionResult Index()
        {
            return View(db.GetListJobAplicacions());
        }

        // GET: JobAplicacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplicacion jobAplicacion = new JobAplicacion();
            jobAplicacion.id = (int)id;
            jobAplicacion = db.GetJobAplicacion(jobAplicacion);
            if (jobAplicacion == null)
            {
                return HttpNotFound();
            }
            return View(jobAplicacion);
        }

        // GET: JobAplicacions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: JobAplicacions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_candidate,id_job,dateofaplication")] JobAplicacion jobAplicacion)
        {
            if (ModelState.IsValid)
            {
                db.InsertJobAplicacion(jobAplicacion);
                return RedirectToAction("Index");
            }

            return View(jobAplicacion);
        }

        // GET: JobAplicacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplicacion jobAplicacion = new JobAplicacion();
            jobAplicacion.id = (int)id;
            jobAplicacion = db.GetJobAplicacion(jobAplicacion);

            if (jobAplicacion == null)
            {
                return HttpNotFound();
            }
            return View(jobAplicacion);
        }

        // POST: JobAplicacions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_candidate,id_job,dateofaplication")] JobAplicacion jobAplicacion)
        {
            if (ModelState.IsValid)
            {
                db.UpdateJobAplicacion(jobAplicacion);
                return RedirectToAction("Index");
            }
            return View(jobAplicacion);
        }

        // GET: JobAplicacions/Delete/5
       /* public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplicacion jobAplicacion = db.JobAplicacions.Find(id);
            if (jobAplicacion == null)
            {
                return HttpNotFound();
            }
            return View(jobAplicacion);
        }*/

        // POST: JobAplicacions/Delete/5
       /* [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            JobAplicacion jobAplicacion = db.JobAplicacions.Find(id);
            db.JobAplicacions.Remove(jobAplicacion);
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
