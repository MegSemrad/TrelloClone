import React from "react";
import { useHistory } from "react-router-dom";
import { Button } from "reactstrap";

const Board = ({ board }) => {
    const history = useHistory();

    return (
        <Button key={board.id} className="boardButton">
            {board.name}
        </Button>
    );
};

export default Board;