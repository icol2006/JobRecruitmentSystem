using AppJobRecruitmentSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppJobRecruitmentSystem.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            CandidateDAL dal = new CandidateDAL();
            Entities.Candidate cc = new Entities.Candidate();
            cc.id = 22;
            cc.email = "Adsasdf3333";
            cc.firtsname="xxxx";
            cc.identification = 23232;
            cc.resume = "adslkjasdlkjasl";
            cc.password = "sda";
            dal.UpdateCandidate(cc);
            
            return View();
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