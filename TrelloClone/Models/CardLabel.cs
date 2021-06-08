

namespace TrelloClone.Models
{
    public class CardLabel
    {
        public int Id { get; set; }

        public int CardId { get; set; }

        public int LabelId { get; set; }

        public Label Label { get; set; }
    }
}
