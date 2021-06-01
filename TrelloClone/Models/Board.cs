using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class Board
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int ColorId { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
