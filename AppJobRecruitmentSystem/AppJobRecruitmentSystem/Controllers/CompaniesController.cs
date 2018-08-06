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
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using System.Web.Security;
using Microsoft.AspNet.Identity;
using System.Security.Claims;

namespace AppJobRecruitmentSystem.Controllers
{
    public class CompaniesController : Controller
    {
        private CompanyBAL db = new CompanyBAL();

        // GET: Companies
        public ActionResult Index()
        {


            return View(db.GetListCompanies());
        }

        // GET: Companies/Details/5
        public ActionResult Details(String id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = new Company();
            company = db.GetCompany(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // GET: Companies/Create
        public ActionResult Create()
        {
            return View();
        }

        public async Task<List<Company>> listCompanies()
        {
            List<Company> listCompanies = new List<Company>();
            Company c = new Company();



            listCompanies = getCompanies();
             foreach (Company company in listCompanies)
             {
                try
                {
                    var UserManager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var user = new ApplicationUser { UserName = company.email, Email = company.email };
                    IdentityUserRole rol = new IdentityUserRole();

                    var result = await UserManager.CreateAsync(user, company.password);

                    var result2 = await UserManager.AddToRoleAsync(user.Id, "1");

                    company.id = user.Id;
                    if (result.Succeeded && result2.Succeeded)
                    {
                        new CompanyBAL().InsertCompany(company);
                    }
                }
                catch (Exception ex)
                {

                    int sad = 4;
                }
               
             }
        


            return listCompanies;

        }


        
        private List<Company> getCompanies()
        {
            List<Company> listCompanies = new List<Company>();
            Company company = new Company();
            company.Description = "D1";
            company.email = "email1@gmail.com";
            company.name = "N1";
            company.password = "Pescado03-";

            listCompanies.Add(company);

            company = new Company();
            company.Description = "D2";
            company.email = "email2@gmail.com";
            company.name = "N2";
            company.password = "Pescado03-";
            listCompanies.Add(company);

            company = new Company();
            company.Description = "D3";
            company.email = "email3@gmail.com";
            company.name = "N3";
            company.password = "Pescado03-";
            listCompanies.Add(company);




            return listCompanies;

        }

        // POST: Companies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,Description,email,password,rol")] Company company)
        {
            if (ModelState.IsValid)
            {
                db.InsertCompany(company);
                return RedirectToAction("Index");
            }

            return View(company);
        }

        // GET: Companies/Edit/5
        public ActionResult Edit(String id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = new Company();
            company = db.GetCompany(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // POST: Companies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,Description,email,password,rol")] Company company)
        {
            if (ModelState.IsValid)
            {
                db.UpdateCompany(company);
                return RedirectToAction("Index");
            }
            return View(company);
        }

        // GET: Companies/Delete/5
        /*public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }*/

        // POST: Companies/Delete/5
       /* [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Company company = db.Companies.Find(id);
            db.Companies.Remove(company);
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
