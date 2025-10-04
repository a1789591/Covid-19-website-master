# COVID-19 Contact Tracing Web Application

A comprehensive web application for COVID-19 contact tracing and hotspot tracking, developed as part of the University of Adelaide's Web Development Course (WDC) project.

## 🎯 Project Overview

This application helps users track their visited locations, identify COVID-19 hotspots, and manage contact tracing through three distinct user roles: regular users, venue operators, and administrators.

## ✨ Features

### For Regular Users
- **Account Management**: Sign up, login, and profile management
- **Location Tracking**: Check-in to locations using GPS coordinates or venue codes
- **Hotspot Awareness**: View COVID-19 hotspots on an interactive map
- **Contact History**: Track and review personal check-in history
- **Risk Assessment**: Get notified if you've been near confirmed COVID-19 cases

### For Venue Operators
- **Venue Registration**: Register venues with unique check-in codes
- **Customer Tracking**: Monitor customer check-ins at their venues
- **Location Management**: Update venue information and addresses
- **Check-in History**: View detailed customer visit records

### For Administrators
- **Hotspot Management**: Create, update, and delete COVID-19 hotspots
- **User Management**: View and manage all user accounts
- **Venue Oversight**: Monitor all registered venues
- **System Analytics**: Access comprehensive check-in and user data
- **Account Control**: Delete user accounts when necessary

## 🛠️ Technology Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web application framework
- **MySQL** - Database management system
- **bcrypt** - Password hashing and security
- **express-session** - Session management
- **CORS** - Cross-origin resource sharing

### Frontend
- **HTML5** - Markup language
- **CSS3** - Styling and responsive design
- **JavaScript (ES6+)** - Client-side functionality
- **Bootstrap 4** - CSS framework for responsive design
- **Vue.js** - Progressive JavaScript framework
- **Alpine.js** - Lightweight JavaScript framework
- **Google Maps API** - Interactive mapping functionality
- **Google OAuth** - Authentication integration

### Additional Libraries
- **haversine** - Distance calculations between coordinates
- **node-geocoder** - Geocoding services
- **google-auth-library** - Google authentication

## 📋 Prerequisites

Before running this application, ensure you have the following installed:

- **Node.js** (version 14 or higher)
- **MySQL** (version 8.0 or higher)
- **npm** (Node Package Manager)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd UG-Group-62
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Database Setup
1. Create a MySQL database named `Project`
2. Import the database schema:
```bash
mysql -u your_username -p Project < projectDump.sql
```

### 4. Environment Configuration
Update the database connection settings in `app.js`:
```javascript
var dbConnectionPool = mysql.createPool({
    host: 'localhost',
    database: 'Project',
    // Add your MySQL credentials here
});
```

### 5. Google OAuth Setup
1. Create a Google Cloud Console project
2. Enable the Google+ API
3. Create OAuth 2.0 credentials
4. Update the CLIENT_ID in `routes/index.js`:
```javascript
const CLIENT_ID = "your-google-client-id";
```

### 6. Google Maps API Setup
1. Obtain a Google Maps API key
2. Update the API key in the HTML files:
```html
<script async src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"></script>
```

## 🏃‍♂️ Running the Application

### Start the Server
```bash
npm start
```

The application will be available at `http://localhost:3000`

### Alternative Start Method
```bash
node ./bin/www
```

## 📁 Project Structure

```
UG-Group-62/
├── bin/
│   └── www                 # Server startup script
├── public/                 # Static files and frontend
│   ├── images/            # Image assets
│   ├── javascripts/       # Client-side JavaScript
│   ├── stylesheets/       # CSS styles
│   ├── index.html         # Landing page
│   ├── user-home-page.html
│   ├── venue-home-page.html
│   ├── admin-home-page.html
│   └── ...                # Other HTML pages
├── routes/                # Express.js routes
│   ├── index.js          # Main application routes
│   └── users.js          # User management routes
├── app.js                # Express application setup
├── package.json          # Node.js dependencies
├── projectDump.sql       # Database schema
└── README.md            # This file
```

## 🗄️ Database Schema

The application uses the following main tables:

- **Accounts**: User authentication and basic information
- **UserInfo**: Extended user profile information
- **VenueInfo**: Venue-specific information
- **AdminInfo**: Administrator details
- **Addresses**: Address information for all entities
- **CheckInRecords**: Location check-in history
- **CheckInCodeRecords**: Venue check-in codes
- **Hotspots**: COVID-19 hotspot locations

## 🔐 Security Features

- **Password Hashing**: All passwords are hashed using bcrypt
- **Session Management**: Secure session handling with express-session
- **Input Validation**: Server-side validation for all user inputs
- **SQL Injection Prevention**: Parameterized queries throughout
- **CORS Protection**: Configured cross-origin resource sharing

## 🎨 User Interface

The application features a responsive design that works on:
- Desktop computers
- Tablets
- Mobile devices

Key UI components include:
- Bootstrap-based responsive navigation
- Interactive Google Maps integration
- Form validation and user feedback
- Modern, clean design aesthetic

## 📱 User Roles & Permissions

### Account Types
- **Type 0**: Regular Users
- **Type 1**: Venue Operators
- **Type 2**: Administrators

### Access Control
Each user type has access to specific features and pages based on their account type, enforced through session management and route protection.

## 🔧 API Endpoints

### Authentication
- `POST /login` - User login
- `POST /loginGoogle` - Google OAuth login
- `POST /logout` - User logout

### User Management
- `POST /signup` - User registration
- `POST /signupVenue` - Venue registration
- `POST /admin_sign_up` - Admin registration

### Location Services
- `POST /checkInByGPS` - GPS-based check-in
- `POST /addCheckInRecord` - Code-based check-in
- `GET /hotspots_info` - Get hotspot information
- `GET /getDangerous` - Check for dangerous locations

### Data Retrieval
- `GET /checkInRecords` - User check-in history
- `GET /getUserInfo` - User profile information
- `GET /venue_info` - Venue check-in records
- `GET /getAllCheckIn` - All check-in records (admin)

## 🐛 Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL is running
   - Check database credentials in `app.js`
   - Ensure the `Project` database exists

2. **Google Maps Not Loading**
   - Verify Google Maps API key is correct
   - Check API key permissions and billing

3. **Google OAuth Issues**
   - Verify CLIENT_ID is correct
   - Check Google Cloud Console configuration

4. **Port Already in Use**
   - Change the port in `bin/www` or kill the process using port 3000

## 🤝 Contributing

This project was developed as part of a university course. For contributions:

1. Follow the existing code style
2. Add comments for complex functionality
3. Test all changes thoroughly
4. Update documentation as needed

<!-- ## 📄 License

This project is developed for educational purposes as part of the University of Adelaide's Web Development Course.

## 👥 Team

Developed by UG-Group-62 for the University of Adelaide Web Development Course (WDC) 2021 Semester 1.

## 📞 Support

For technical support or questions about this project, please refer to the course materials or contact the development team.

---

**Note**: This application is designed for educational purposes and should not be used for actual COVID-19 contact tracing without proper medical and legal oversight. -->
