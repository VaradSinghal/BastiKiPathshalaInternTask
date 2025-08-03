# Basti Ki Pathshala

**Basti Ki Pathshala** is a Flutter-based mobile application built for a non-profit organization focused on delivering quality education and holistic development to underprivileged children in urban slums.

The app showcases the organization's mission, impact, and core values while providing an intuitive form for users to sign up as volunteers.

---

##  Features

###  Home Screen
- NGO logo, mission statement, and a brief overview.
- Impact statistics:  
  -  5,000+ children educated  
  -  10+ cities reached  
  -  500+ volunteers  
- Four core pillars highlighted as cards:  
  **Education**, **Care**, **Community**, **Empowerment**
- "Join Our Mission" button navigates to the volunteer form.
- Bottom navigation bar for switching between Home and Volunteer screens.

###  Volunteer Form Screen
- Collects user details: **Name**, **Phone Number**, and **City**
- Validates phone number (10-digit requirement).
- Displays confirmation Snackbar and navigates back to Home after 2 seconds.
- Fade-in animation for smooth UI experience.
- Bottom navigation bar for consistent screen navigation.

###  UI/UX Design
- Teal color scheme with Google Fonts (**Poppins**) for clean typography.
- Gradient buttons and AppBar.
- Animated transitions and cards.
- Fallback icons to ensure robustness if assets are missing.

###  Navigation
- Consistent bottom navigation bar.
- `Navigator.pushReplacement` used to maintain a clean navigation stack (no back navigation to form screen).

---

##  Project Structure

lib/
├── main.dart
├── models/
│ └── volunteer.dart
├── screens/
│ ├── home_screen.dart
│ └── volunteer_form_screen.dart
assets/
├── logo.png
├── volunteer.png


- `main.dart`: Entry point of the application.
- `models/volunteer.dart`: Volunteer data model.
- `screens/home_screen.dart`: Home screen UI and logic.
- `screens/volunteer_form_screen.dart`: Volunteer form screen UI and submission logic.
- `assets/`: Images used in the app.

---

##  Getting Started

###  Prerequisites
- **Flutter SDK**: ≥ 3.0.0  
- **Dart SDK**: ≥ 2.17.0  
- **IDE**: VS Code, Android Studio, or any Flutter-compatible IDE  
- **Device/Emulator**: Android or iOS  
