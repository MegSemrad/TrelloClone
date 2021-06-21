using System.Collections.Generic;
using TrelloClone.Models;

namespace TrelloClone.Repositories
{
    public interface IBoardRepository
    {
        List<Board> GetUserBoards(string FirebaseUserId);
    }
}