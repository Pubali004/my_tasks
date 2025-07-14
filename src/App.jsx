import React from 'react';
import { Routes, Route } from 'react-router-dom';
import AllTasks from './components/AllTasks';
import CreateTask from './components/CreateTask';
import UpdateTask from './components/UpdateTask';
import TaskDetails from './components/TaskDetails';
import ErrorPage from './components/ErrorPage';
import Footer from './components/Footer';
import AuthForm from './components/AuthForm';
import AuthForm1 from './components/AuthForm1';
import Landing from './components/landing';
import Alljobs from './components/Alljobs';
import AllApplicants from './components/AllApplicants';
import ApplicantsList from './components/ApplicantsList';
import Contact from './components/Contact';
import Chatbot from './components/Chatbot';

const App = () => {
  return (
    <div className="app-container">
      
      <div className="main-content">
        <Routes>
          
         <Route path="/" element={<Landing/>} /> 
         <Route path="/condetails"element={<Contact/>}/>
        <Route path="/authform" element={<AuthForm />} />
        <Route path="/authform1" element={<AuthForm1/>}/>
        <Route path="/alltasks" element={<AllTasks />} />
         <Route path='/alljobs' element={<Alljobs/>}/> 
          <Route path='/create-task' element={<CreateTask />} />
          <Route path='/edit-task/:id' element={<UpdateTask />} />
          <Route path='/task-details/:id' element={<TaskDetails />} />
          <Route path="/all-applicants" element={<AllApplicants />} />
          <Route path='/appli-lists'element={<ApplicantsList/>} />
          <Route path='/chatbot'element={<Chatbot/>} />
          <Route path='*' element={<ErrorPage />} />
        </Routes>
      </div>
      <Footer/>
    </div>
  );
}

export default App;
