using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace AppJobRecruitmentSystem.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [Key]
        public int id;

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class RegisterCandidateViewModel
    {

        [Required(ErrorMessage = "Correo electronico es requerido")]
        [EmailAddress]
        [Display(Name = "Correo electronico")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password es requerido")]
        [StringLength(100, ErrorMessage = "Password debe posser minimo 3 letras", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmacion del password")] 
        [Compare("Password", ErrorMessage = "El password y la confirmacion de password no coinciden")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(150, ErrorMessage = "Nombre debe posser minimo 3 letras", MinimumLength = 3)]
        [DataType(DataType.Text)]
        [Display(Name = "Nombre")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Apellido es requerido")]
        [StringLength(150, ErrorMessage = "Apellido debe posser minimo 1 letra", MinimumLength = 1)]
        [DataType(DataType.Text)]
        [Display(Name = "Apellidos")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Identification es requerido")]
        [Display(Name = "Identification")]
        public int identification { get; set; }

        [Display(Name = "Curriculum")]
        public string Resume { get; set; }


        [Required(ErrorMessage = "Estado es requerido")]
        [Display(Name = "Estado civil")]
        public string maritalStatus { get; set; }

        [Required(ErrorMessage = "Lugar de residencia requerido")]
        [Display(Name = "Lugar de residencia")]
        public String placeResidence { get; set; }

        [Required(ErrorMessage = "Telefono es requerido")]
        [Display(Name = "Telefono")]
        public int phone { get; set; }

        [Required(ErrorMessage = "Fecha de nacimiento es requerido")]
        [Display(Name = "Fecha de nacimiento")]
        public DateTime birthdate { get; set; }

        [Required(ErrorMessage = "Nacionalidad es requerida")]
        [Display(Name = "Nacionalidad")]
        public String nationality { get; set; }

    }


    public class RegisterCompanyViewModel
    {
        [Required(ErrorMessage = "Correo electronico es requerido")]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password es requerido")]
        [StringLength(100, ErrorMessage = "Password debe posser minimo 6 letras", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar password")]
        [Compare("Password", ErrorMessage = "El password y la confirmacion de password no coinciden")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(150, ErrorMessage = "Nombre debe posser minimo 3 letras", MinimumLength = 3)]
        [DataType(DataType.Text)]
        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Descripcion es requerida")]
        [StringLength(150, ErrorMessage = "Descripcion debe posser minimo 5 letras", MinimumLength = 5)]
        [DataType(DataType.Text)]
        [Display(Name = "Descripcion")]
        public string Description { get; set; }

    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "El password debe posser minimo 6 letras.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar password")]
        [Compare("Password", ErrorMessage = "El password y la confirmacion de password no coinciden.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress(ErrorMessage = "El correo no es valido")]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
