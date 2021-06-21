import React, { useContext } from "react";
import { Route, Redirect } from "react-router-dom";

import { UserContext } from "./providers/UserProvider.js";

import { BoardProvider } from "./providers/BoardProvider.js";

import BoardList from "./boards/BoardList.js";


export default function ApplicationViews() {
    const { isLoggedIn } = useContext(UserContext);

    return (
        <main>

            <BoardProvider>
                <Route path="/" exact>
                    {isLoggedIn ? <BoardList /> : <Redirect to="/login" />}
                </Route>
            </BoardProvider>

        </main>
    );
};