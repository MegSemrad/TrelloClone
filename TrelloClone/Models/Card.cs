using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class Card
    {
        public int Id { get; set; }

        public int ListId { get; set; }

        public List List { get; set; }

        [Required]
        public string Name { get; set; }

        public string Description { get; set; }
    }
}
