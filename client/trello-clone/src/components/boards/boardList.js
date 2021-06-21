import React, { useContext, useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import { BoardContext } from "../providers/BoardProvider.js";
import Board from "./Board.js";
import { Container } from "reactstrap";


const BoardList = (props) => {
    const history = useHistory();
    const { getUserBoards } = useContext(BoardContext);
    const [boards, setBoards] = useState([]);

    useEffect(() => {
        getUserBoards()
            .then(resp => setBoards(resp))
    }, []);


    return (
        <Container className="boardContainer">
            {boards.map(board => {
                return <Board key={board.id}
                    board={board}
                />
            })}
        </Container>
    );
};

export default BoardList;