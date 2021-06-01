using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class Label
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
