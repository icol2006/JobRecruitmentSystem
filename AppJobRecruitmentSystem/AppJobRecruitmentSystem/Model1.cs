namespace AppJobRecruitmentSystem
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<tb_Candidate> tb_Candidate { get; set; }
        public virtual DbSet<tb_Company> tb_Company { get; set; }
        public virtual DbSet<tb_JobOffer> tb_JobOffer { get; set; }
        public virtual DbSet<tb_UserProfile> tb_UserProfile { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tb_Candidate>()
                .Property(e => e.firstname)
                .IsUnicode(false);

            modelBuilder.Entity<tb_Candidate>()
                .Property(e => e.lastname)
                .IsUnicode(false);

            modelBuilder.Entity<tb_Candidate>()
                .Property(e => e.resume)
                .IsUnicode(false);

            modelBuilder.Entity<tb_Candidate>()
                .HasMany(e => e.tb_JobOffer)
                .WithMany(e => e.tb_Candidate)
                .Map(m => m.ToTable("tb_JobOffer_Candidate").MapLeftKey("id_candidate").MapRightKey("id_jobOffer"));

            modelBuilder.Entity<tb_Company>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<tb_Company>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<tb_Company>()
                .HasMany(e => e.tb_JobOffer)
                .WithOptional(e => e.tb_Company)
                .HasForeignKey(e => e.company_id);

            modelBuilder.Entity<tb_JobOffer>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tb_UserProfile>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<tb_UserProfile>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<tb_UserProfile>()
                .Property(e => e.rol)
                .IsUnicode(false);

            modelBuilder.Entity<tb_UserProfile>()
                .HasMany(e => e.tb_Candidate)
                .WithOptional(e => e.tb_UserProfile)
                .HasForeignKey(e => e.user_id);

            modelBuilder.Entity<tb_UserProfile>()
                .HasMany(e => e.tb_Company)
                .WithOptional(e => e.tb_UserProfile)
                .HasForeignKey(e => e.user_id);
        }
    }
}
