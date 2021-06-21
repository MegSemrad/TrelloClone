using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using TrelloClone.Models;
using TrelloClone.Utils;
using Microsoft.Data.SqlClient;

namespace TrelloClone.Repositories
{
    public class BoardRepository : BaseRepository, IBoardRepository
    {
        public BoardRepository(IConfiguration configuration) : base(configuration) { }

        public List<Board> GetUserBoards(string FirebaseUserId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT b.Id AS BoardId, b.Name,
                        c.Id AS ColorId, c.Name, c.Code,
                        u.Id AS UserId, u.UserName, u.FirebaseUserId
                        FROM Board b
                        LEFT JOIN Color c ON c.Id = b.ColorId
                        LEFT JOIN [User] u ON u.Id = b.UserId
                        WHERE u.FirebaseUserId = @FirebaseUserId";

                    cmd.Parameters.AddWithValue("@FirebaseUserId", FirebaseUserId);
                    var reader = cmd.ExecuteReader();

                    var boards = new List<Board>();

                    while (reader.Read())
                    {
                        boards.Add(new Board()
                        {
                            Id = DbUtils.GetInt(reader, "BoardId"),
                            Name = DbUtils.GetString(reader, "Name"),
                            ColorId = DbUtils.GetInt(reader, "ColorId"),
                            Color = new Color()
                            {
                                Id = DbUtils.GetInt(reader, "ColorId"),
                                Name = DbUtils.GetString(reader, "Name"),
                                Code = DbUtils.GetString(reader, "Code")

                            },
                            UserId = DbUtils.GetInt(reader, "UserId"),
                            User = new User()
                            {
                                Id = DbUtils.GetInt(reader, "UserId"),
                                UserName = DbUtils.GetString(reader, "UserName"),
                                FirebaseUserId = DbUtils.GetString(reader, "FirebaseUserId"),

                            }
                        });
                    }

                    reader.Close();
                    return boards;
                }
            }
        }

    }
}
