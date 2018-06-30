namespace AppJobRecruitmentSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_Candidate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_Candidate()
        {
            tb_JobOffer = new HashSet<tb_JobOffer>();
        }

        public int id { get; set; }

        [StringLength(150)]
        public string firstname { get; set; }

        [StringLength(150)]
        public string lastname { get; set; }

        public int? identification { get; set; }

        [StringLength(150)]
        public string resume { get; set; }

        public int? user_id { get; set; }

        public virtual tb_UserProfile tb_UserProfile { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_JobOffer> tb_JobOffer { get; set; }
    }
}
