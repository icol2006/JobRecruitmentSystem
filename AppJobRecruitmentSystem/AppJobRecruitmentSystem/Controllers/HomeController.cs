using AppJobRecruitmentSystem.BAL;
using AppJobRecruitmentSystem.DAL;
using AppJobRecruitmentSystem.Entities;
using AppJobRecruitmentSystem.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace AppJobRecruitmentSystem.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            List<Candidate> listCandidate = new List<Candidate>();
            CandidateBAL can = new CandidateBAL();

            /*Candidate candidate = new Candidate();
            candidate.email = "adskjl@al.com";
            candidate.firtsname = "dasl";
            candidate.identification = 43;
            candidate.password = "Pescado03-";
            can.InsertCandidate(candidate);
            
            candidate = new Candidate();
            candidate.email = "adskjl2@al.com";
            candidate.firtsname = "dasl2";
            candidate.identification = 432;
            candidate.password = "Pescado03-";
            can.InsertCandidate(candidate);

            candidate = new Candidate();
            candidate.email = "adskjl3@al.com";
            candidate.firtsname = "dasl3";
            candidate.identification = 433;
            candidate.password = "Pescado03-";
            can.InsertCandidate(candidate);*/

            //var UserManager = new ApplicationUserManager(new UserStore<ApplicationUser>(new ApplicationDbContext()));
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
            int dsa = 4;
            Candidate x = can.GetCandidate(list[0]);
            // 
            x.firtsname = "xxxxxxx";
            x.lastname = "l2";
            x.identification = 222222;
            x.resume = "resume";
            can.UpdateCandidate(x);

            return View();

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

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}