import React from 'react';
import App from './App'
import Nav from './nav';
import Course from './components/course/course';
import NewCourse from './components/new-course/new-course';
import Login from './components/login/login';
import Register from './components/register/register';
import { Route, Switch, Redirect } from 'react-router-dom';

export const Routes = () => {
  return (
    <div>
      <Nav/>
        <Switch>
            <Route exact path="/home" component={App} />
            <Route exact path="/">
            <Redirect to="/home" />
            </Route>    
            <Route exact path="/register" component={Register}/>
            <Route exact path="/login" component={Login} />
            <Route exact path="/course" component={Course} />
            <Route exact path="/new-course" component={NewCourse} />  
        </Switch>
    </div>
  );
};