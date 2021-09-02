import './home.scss';
import { Link } from 'react-router-dom';

function Home() {
    // AJOUTER FONCTION GET COURSE + REQUETE GET ALL COURSE
  return (
    <div className="course-list">
        <Link to="/course" className="course-card">
            <p className="title">Course</p>
            <p className="course-name">Course Name</p>
        </Link>

        <Link to="/course" className="course-card">
            <p className="title">Course</p>
            <p className="course-name">Course Name</p>
        </Link>
        
        <div className="new-course-card">
          <Link to="/new-course" id="new-course-link">
                + <span>New Course</span>
          </Link>
        </div>
    </div>
  );
}

export default Home;