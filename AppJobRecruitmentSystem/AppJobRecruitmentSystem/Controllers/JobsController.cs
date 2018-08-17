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
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System.IO;
using System.Threading;

namespace AppJobRecruitmentSystem.Controllers
{ 
    public class JobsController : Controller
    {
        private JobBAL db = new JobBAL();

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string[] cultures = { "es-CL", "es-MX" };
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultures[1]);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecuteCore(callback, state);
        }

        public ActionResult Index(string sortOrder, string CurrentSort, int? page,
             string currentFilter, string currentDateStart, string currentDateEnd,
             string searchString, string searchDateStart, string searchDateEnd, string id_category)
        {
            int pageSize = 6;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            List<Job> listJobs = new List<Job>();
            String idUser = null;

            ViewBag.CurrentSort = sortOrder;

            sortOrder = String.IsNullOrEmpty(sortOrder) ? "date_publication" : sortOrder;

            if (searchString != null )
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
                searchDateStart = currentDateStart;
                searchDateEnd = currentDateEnd;
            }

            List<Category> listCategories = new List<Category>();
            listCategories.Add(new Category(0, "Todas"));
            listCategories.AddRange(new CategoryBAL().GetListCategories());       

            ViewBag.CurrentFilter = searchString;
            ViewBag.CurrentStartFilter = searchDateStart;
            ViewBag.CurrentEndFilter = searchDateEnd;
            ViewBag.id_category = new SelectList(listCategories, 
                "id", "name", id_category==null?null:id_category);


            listJobs = db.GetListJobs();

            if (!String.IsNullOrEmpty(searchString))
            {
                listJobs = db.GetListJobs().Where(x => x.name.ToUpper()
                .Contains(searchString.ToUpper())).ToList();
            }
            
            if (!String.IsNullOrEmpty(searchDateStart) && !String.IsNullOrEmpty(searchDateEnd))
            {
                 listJobs = (from p in listJobs
                               where p.date_publication >= Convert.ToDateTime(searchDateStart)
                               && p.date_publication <= Convert.ToDateTime(searchDateEnd)
                               select p).ToList();                
            }

            if (!String.IsNullOrEmpty(id_category) )
            {
                if(id_category!="0")
                listJobs = listJobs.Where(x => x.id_category == (Convert.ToInt32(id_category))).ToList();
            }


                if (User.Identity.IsAuthenticated)
            {
                idUser = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
                 .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;
            }
          

            if (User.IsInRole("company"))
            {
                listJobs = listJobs.FindAll(x => x.id_company == idUser);
            }

            
            for (int i = 0; i < listJobs.Count; i++)
            {
                listJobs[i].company = new CompanyBAL().GetCompany(listJobs[i].id_company);
                listJobs[i].category = new CategoryBAL().GetCategory(listJobs[i].id_category);
            }

            IPagedList<Job> jobs = null;

            jobs = listJobs.OrderByDescending
                (m => m.date_publication).ToPagedList(pageIndex, pageSize);

            ViewBag.iduser = idUser;

            return View(jobs);
        }

        // GET: Jobs
        public ActionResult Index2()
        {
            List<Job> listJobs = new List<Job>();
            String idUser = null;

            if(User.Identity.IsAuthenticated)
            {
                idUser = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
                 .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;
            }


            if (User.IsInRole("company"))
            {

                listJobs = db.GetListJobs().FindAll(x => x.id_company == idUser);
            }
            else
            {
                listJobs = db.GetListJobs();
            }


            for (int i = 0; i < listJobs.Count; i++)
            {
                listJobs[i].company = new CompanyBAL().GetCompany(listJobs[i].id_company);
                listJobs[i].category = new CategoryBAL().GetCategory(listJobs[i].id_category);
            }


            ViewBag.iduser = idUser;

            return View(listJobs);
        }

        // GET: Jobs
        public ActionResult GetJobsByCompany()
        {

            List<Job> listCompanies = new List<Job>();

            if (User.IsInRole(Rol.company.ToString()))
            {
                String idCompany = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
                                   .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;
                listCompanies = db.GetListJobs().FindAll(x => x.id_company == idCompany);
            }
            else 
            {
                listCompanies = db.GetListJobs();
            }
         

            for (int i = 0; i < listCompanies.Count; i++)
            {
                listCompanies[i].company = new CompanyBAL().GetCompany(listCompanies[i].id_company);
            }

            return View(listCompanies);
        }


        // GET: Jobs/Create
        public ActionResult Create()
        {
            List<Category> listCategories = new List<Category>();
            String idCompany = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
            .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;

            Job job = new Job();
            job.company=new CompanyBAL().GetCompany(idCompany);

            //ViewBag.IdCompany = idCompany;
            //SelectListItem basetypes = new SelectListItem(new CompanyBAL().GetCompany(idCompany),"id","name" );
            //SelectList li=new SelectList(new CategoryBAL().GetListCategories(), "id", "name");
            ViewData["id_category"] = new SelectList(new CategoryBAL().GetListCategories(), "id", "name");

            return View();
        }

        // POST: Jobs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,description,date_publication,enable_job,id_company,id_category")] Job job)
        {
            String idCompany = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>()
                .Users.ToList().Find(x => x.Email == User.Identity.Name).Id;
            job.id_company = idCompany;
            ModelState.Remove("id_company");

            if (ModelState.IsValid)
            {
                db.InsertJob(job);
                return RedirectToAction("Index");
            }

            ViewData["id_category"] = new SelectList(new CategoryBAL().GetListCategories(), "id", "name");

            return View(job);
        }

        // GET: Jobs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.GetJob(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            int idCategory = new JobBAL().GetJob(id).id_category;
            ViewBag.id_category = new SelectList(new CategoryBAL().GetListCategories(), "id", "name", idCategory);
           
            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,description,date_publication,enable_job,id_company,id_category")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.UpdateJob(job);
                return RedirectToAction("Index");
            }

            int idCategory = job.id_category;
            ViewBag.id_category = new SelectList(new CategoryBAL().GetListCategories(), "id", "name", idCategory);

            return View(job);
        }

        // GET: Jobs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }            Job job=db.GetJob(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: Jobs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            db.DeleteJob(id);
            return RedirectToAction("Index");
        }

        public ActionResult SendResume(int? id,String id_candidate, int? id_job,DateTime dateofaplication)
        {
            if(id==null || id_job==null)
            {
                RedirectToAction("Index");
            }

             return RedirectToAction("Create", " JobAplications", new { id = 0, id_candidate = ViewBag.iduser, id_job = id_job, dateofaplication = System.DateTime.Now });
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
