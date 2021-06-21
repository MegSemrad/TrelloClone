using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using TrelloClone.Models;
using TrelloClone.Repositories;
using Microsoft.AspNetCore.Authorization;


namespace TrelloClone.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class BoardController : ControllerBase
    {
        private readonly IBoardRepository _boardRepository;
        private readonly IUserRepository _userRepository;

        public BoardController(IBoardRepository boardRepository, IUserRepository userRepository)
        {
            _boardRepository = boardRepository;
            _userRepository = userRepository;
        }






        [HttpGet("GetByUser")]
        public IActionResult GetByUser()
        {
            User userObject = GetCurrentUser();
            string FirebaseUserId = userObject.FirebaseUserId;
            var userBoards = _boardRepository.GetUserBoards(FirebaseUserId);
            if (userBoards == null)
            {
                return NotFound();
            }
            return Ok(userBoards);
        }



        private User GetCurrentUser()
        {
            string FirebaseUserId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return _userRepository.GetByFirebaseUserId(FirebaseUserId);
        }

    }
}
