using System.ComponentModel.DataAnnotations;

namespace TrelloClone.Models
{
    public class CardChecklist
    {
        public int Id { get; set; }

        public int CardId { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
