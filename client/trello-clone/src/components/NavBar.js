import React, { useState, useContext } from 'react';
import { NavLink as RRNavLink, Redirect } from "react-router-dom";
import {
    Collapse,
    Navbar,
    NavbarToggler,
    Nav,
    NavItem,
    NavLink,
    NavbarText
} from 'reactstrap';
import { UserContext } from "./providers/UserProvider.js"



export default function NavBar() {
    const { isLoggedIn, logout } = useContext(UserContext);
    const [isOpen, setIsOpen] = useState(false);
    const toggle = () => setIsOpen(!isOpen);


    return (
        <div>
            <Navbar color="light" light expand="md">
                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav className="mr-auto" navbar>
                        <NavItem>
                            <NavLink href="/">Home</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink href="">+</NavLink>
                        </NavItem>
                    </Nav>
                    <NavbarText className="navbarTitle">Trello Clone</NavbarText>

                    <Nav navbar>
                        {isLoggedIn &&
                            <>
                                <NavItem>
                                    <a aria-current="page" className="nav-link"
                                        style={{ cursor: "pointer" }} onClick={logout}>Logout</a>
                                </NavItem>
                            </>
                        }
                        {!isLoggedIn &&
                            <Redirect to="/login" />
                        }
                    </Nav>
                </Collapse>
            </Navbar>
        </div>
    );
};