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
using System.Net.Mime;
using Microsoft.AspNet.Identity.Owin;
using System.Reflection;
using PagedList;

namespace AppJobRecruitmentSystem.Controllers
{
    public class JobAplicationsController : Controller
    {
        private JobAplicationBAL db = new JobAplicationBAL();

        // GET: JobAplicacions
        public ActionResult Index( 
             string currentCompanyFilter, string currentJobFilter, string currentCandidateFilter,
             string currentDateStartFilter, string currentDateEndFilter,
             string searchcompany, string searchjob, string searchcandidate, 
             string searchdateStart, string searchdateEnd, int? page)
        {
            List<JobAplication> list = db.GetListJobAplicacions();
            String idUser = "";
            int pageSize = 6;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;

            if (searchcompany != null)
            {
                page = 1;
            }
            else
            {
                searchcompany = currentCompanyFilter;
                searchjob = currentJobFilter;
                searchcandidate = currentCandidateFilter;
                searchdateStart = currentDateStartFilter;
                searchdateEnd = currentDateEndFilter;
            }

            ViewBag.CurrentCompanyFilter = searchcompany;
            ViewBag.CurrentJobFilter = searchjob;
            ViewBag.CurrentCandidateFilter = searchcandidate;
            ViewBag.CurrentDateStartFilter = searchdateStart;
            ViewBag.CurrentDateEndFilter = searchdateEnd;


            for (int i = 0; i < list.Count; i++)
            {
                list[i].candidate = new CandidateBAL().GetCandidate(list[i].id_candidate);
                list[i].job = new JobBAL().GetJob(list[i].id_job);
                list[i].job.company = new CompanyBAL().GetCompany(list[i].job.id_company);
            }

            //Filtros
            if (!String.IsNullOrEmpty(searchcompany))
            {
                list = list.Where(x => x.job.company.name.ToUpper()
                .Contains(searchcompany.ToUpper())).ToList();
            }

            if (!String.IsNullOrEmpty(searchjob))
            {
                list = list.Where(x => x.job.name.ToUpper()
                .Contains(searchjob.ToUpper())).ToList();
            }

            if (!String.IsNullOrEmpty(searchcandidate))
            {
                list = list.Where(
                    x => (x.candidate.firtsname+" "+ x.candidate.lastname).ToUpper()
                    .Contains(searchcandidate.ToUpper())).ToList();
            }

            if (!String.IsNullOrEmpty(searchdateStart) && !String.IsNullOrEmpty(searchdateEnd))
            {
                list = (from p in list
                        where p.job.date_publication >= Convert.ToDateTime(searchdateStart)
                            && p.job.date_publication <= Convert.ToDateTime(searchdateEnd)
                            select p).ToList();
            }


            if (User.Identity.IsAuthenticated)
            {
                idUser = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
                    .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;
            }

            
            if (User.IsInRole("company"))
            {
                list = list.FindAll(x => x.job.id_company == idUser).ToList();
            }
            if (User.IsInRole("candidate"))
            {
                list = list.FindAll(x => x.id_candidate == idUser).ToList();
            }

            IPagedList<JobAplication> jobAplications = null;

            jobAplications = list.OrderByDescending
                (m => m.dateofaplication).ToPagedList(pageIndex, pageSize);


            return View(jobAplications);
        }

        // GET: JobAplicacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplication jobAplicacion = new JobAplication();
            jobAplicacion = db.GetJobAplicacion((int) id);
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
        public ActionResult Create([Bind(Include = "id,id_candidate,id_job,dateofaplication")] JobAplication jobAplicacion)
        {

            if (ModelState.IsValid)
            {
                db.InsertJobAplicacion(jobAplicacion);
                return Json(new { success = true, responseText = "Tu curriculum ha sido enviado!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false, responseText = "Error al enviar el curriculum" }, JsonRequestBehavior.AllowGet);
            }

        }

        [HttpGet]
        [ValidateAntiForgeryToken]
        public ActionResult Create(int? id, String id_candidate, int? id_job,DateTime dateofaplication)
        {
            JobAplication JobAplicacion = new JobAplication();
            JobAplicacion.id_candidate = id_candidate;
            JobAplicacion.id_job =(int) id_job;
            JobAplicacion.dateofaplication = dateofaplication;

            db.InsertJobAplicacion(JobAplicacion);
            return RedirectToAction("Index", " Jobs", null);
        }

        // GET: JobAplicacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplication jobAplicacion = new JobAplication();
            jobAplicacion = db.GetJobAplicacion((int) id);

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
        public ActionResult Edit([Bind(Include = "id,id_candidate,id_job,dateofaplication")] JobAplication jobAplicacion)
        {
            if (ModelState.IsValid)
            {
                db.UpdateJobAplicacion(jobAplicacion);
                return RedirectToAction("Index");
            }
            return View(jobAplicacion);
        }

        // GET: JobAplicacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobAplication jobAplicacion = db.GetJobAplicacion((int)id);
            if (jobAplicacion == null)
            {
                return HttpNotFound();
            }
            return View(jobAplicacion);
        }

        // POST: JobAplicacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            db.DeleteJobAplicacion(id);
            return RedirectToAction("Index");
        }

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
