import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  const sessionLinks = () => (
    <nav>
      <Link to="/login">Login</Link>
       <br/> 
      <Link to="/signup">Sign Up</Link>
    </nav>
  );

  const greeting = () => (
    <div>
      <h2>Hello, {currentUser.username}!</h2>
      <button onClick={logout}>Log Out</button>
    </div>
  )

  return currentUser ? greeting() : sessionLinks();
}

export default Greeting;
