import React, { useContext } from "react";
import { UserContext } from "./UserProvider.js";



export const BoardContext = React.createContext();

export const BoardProvider = (props) => {
    const { getToken } = useContext(UserContext);
    const apiUrl = "/api/Board";

    const getUserBoards = () => {
        return getToken().then((token) =>
            fetch(`${apiUrl}/GetByUser`, {
                method: "GET",
                headers: {
                    Authorization: `Bearer ${token}`
                }
            })
                .then((response) => response.json())
        )
    };


}