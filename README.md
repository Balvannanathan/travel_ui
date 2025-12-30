# Flutter Firebase Authentication (Email & Password)

A Flutter sample application demonstrating **Firebase Authentication using Email & Password**, built with a clean **MVVM architecture** and best practices for authentication, session handling, and security.

---

## ✨ Features

- Email & Password Sign Up
- Email & Password Sign In
- Persistent Login Session
- Firebase Automatic Token Refresh
- Secure Logout
- Delete User Account
- MVVM Architecture
- Dependency Injection (GetIt)
- Centralized Error Logging

---

## 🛠 Tech Stack

- **Flutter**
- **Firebase Authentication**
- **Firebase Core**
- **GetIt** (Dependency Injection)
- **MVVM Architecture**
- **SharedPreferences** (Non-auth data only)

---

## 🔐 Authentication Flow

### Email & Password Authentication
- Users can sign up using email & password
- Firebase generates and manages secure tokens automatically
- No credentials are stored locally

### Persistent Login
- Firebase securely stores the refresh token
- User remains logged in even after:
  - App restart
  - Device restart
- Session expires only when:
  - User logs out
  - Password is reset
  - Account is disabled or deleted
  - App is uninstalled

---