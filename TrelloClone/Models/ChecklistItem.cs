using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class ChecklistItem
    {
        public int Id { get; set; }

        public int CardChecklistId { get; set; }

        [Required]
        public string Name { get; set; }

        public bool IsChecked { get; set; }
    }
}
