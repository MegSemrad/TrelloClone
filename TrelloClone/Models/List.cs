using System.ComponentModel.DataAnnotations;


namespace TrelloClone.Models
{
    public class List
    {
        public int Id { get; set; }

        public int BoardId { get; set; }

        [Required]
        public string Name { get; set; }
    }
}