namespace AppJobRecruitmentSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_UserProfile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_UserProfile()
        {
            tb_Candidate = new HashSet<tb_Candidate>();
            tb_Company = new HashSet<tb_Company>();
        }

        public int id { get; set; }

        [StringLength(150)]
        public string email { get; set; }

        [StringLength(150)]
        public string password { get; set; }

        [StringLength(50)]
        public string rol { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_Candidate> tb_Candidate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_Company> tb_Company { get; set; }
    }
}
