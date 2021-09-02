import React from 'react';
import './nav.scss';
import { Link } from 'react-router-dom';


function Nav() {

    return( 
        <nav id="nav">
                    <Link className="nav_link" to="/home">Course</Link>
                    <div className="nav_link_right">
                        <Link to="/register">Sign up</Link>
                        <Link to="/login">Sign in</Link>
                    </div>     
                    
        </nav>
    );
         
}


export default Nav;