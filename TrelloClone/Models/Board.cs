using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class Board
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public User User { get; set; }

        public int ColorId { get; set; }

        public Color Color { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
