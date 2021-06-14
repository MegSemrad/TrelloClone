using System.Collections.Generic;
using TrelloClone.Models;

namespace TrelloClone.Repositories
{
    public interface IUserRepository
    {
        void Add(User user);
        List<User> GetAllUsers();
        User GetByFirebaseUserId(string FirebaseUserId);
        User GetUserById(int id);
    }
}