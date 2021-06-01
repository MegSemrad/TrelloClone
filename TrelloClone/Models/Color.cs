using System.ComponentModel.DataAnnotations;

namespace TrelloClone.Models
{
    public class Color
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Code { get; set; }
    }
}
