import React from 'react';
import ReactDOM from 'react-dom';
import firebase from "firebase";
import { BrowserRouter as Router } from "react-router-dom";
import TrelloClone from './components/TrelloClone';
import { UserProvider } from "./providers/UserProvider";
import './index.css';
import 'bootstrap/dist/css/bootstrap.min.css';


const firebaseConfig = {
  apiKey: process.env.REACT_APP_API_KEY,
};
firebase.initializeApp(firebaseConfig);


ReactDOM.render(
  <React.StrictMode>
    <Router>
      <UserProvider>
        <TrelloClone />
      </UserProvider>
    </Router>
  </React.StrictMode>,
  document.getElementById('root')
);