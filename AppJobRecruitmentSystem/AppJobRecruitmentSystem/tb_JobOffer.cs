namespace AppJobRecruitmentSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_JobOffer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_JobOffer()
        {
            tb_Candidate = new HashSet<tb_Candidate>();
        }

        public int id { get; set; }

        public int? company_id { get; set; }

        [StringLength(150)]
        public string description { get; set; }

        [Column(TypeName = "date")]
        public DateTime? date { get; set; }

        public bool? enable { get; set; }

        public virtual tb_Company tb_Company { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_Candidate> tb_Candidate { get; set; }
    }
}
