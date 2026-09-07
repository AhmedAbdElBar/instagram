# 📸 Instagram Clone

A modern social media mobile application inspired by Instagram, built with **Flutter** and **Firebase**.

The project recreates the core experience of a modern social media platform, including authentication, profiles, posts, stories, following, explore, favorites, reels/videos, notifications, settings, and real-time messaging.

The main goal of the project was to build a complete, scalable Flutter application while practicing real-world mobile development concepts, Firebase integration, state management, and clean code architecture.

---

## 📱 Project Overview

Instagram Clone provides users with a complete social media experience where they can create accounts, customize their profiles, share posts and stories, discover other users, follow accounts, interact with content, and communicate through real-time chat.

The project focuses on reproducing the core functionality and user experience of a social media application while implementing the features from scratch using Flutter and Firebase.

---

## 📸 Screenshots

| Login | Sign Up | Home Feed |
|-------|---------|-----------|
|<img width="1080" height="2280" alt="Screenshot_1788580037" src="https://github.com/user-attachments/assets/9382e333-de83-4b5b-b022-ccea15bcb5a9" />|<img width="1080" height="2280" alt="Screenshot_1788580040" src="https://github.com/user-attachments/assets/2355611a-0bf7-4b61-b620-36eb176b92c5" />|<img width="1080" height="2280" alt="Screenshot_1788579646" src="https://github.com/user-attachments/assets/36a5dfdd-65f0-424f-bd0d-807ea591ed80" />|

| Stories | Explore | Reels |
|---------|---------|-------|
|<img width="1080" height="2280" alt="Screenshot_1788579747" src="https://github.com/user-attachments/assets/c5cccf50-6365-422f-b495-f0a9121b09d1" />| <img width="1080" height="2280" alt="Screenshot_1788579787" src="https://github.com/user-attachments/assets/101422bb-5bf8-4d0e-8c45-0b6c7fa45cf1" />| <img width="1080" height="2280" alt="Screenshot_1788579797" src="https://github.com/user-attachments/assets/f911481a-8469-42b0-9d7d-72b83244b0d8" />|

| Profile | Edit Profile | Favorites |
|---------|--------------|-----------|
|<img width="1080" height="2280" alt="Screenshot_1788579813" src="https://github.com/user-attachments/assets/9652cdc8-70c1-4e18-8cec-7f1477cd3307" />|<img width="1080" height="2280" alt="Screenshot_1788579820" src="https://github.com/user-attachments/assets/5555e44e-0d86-496b-8bb2-5b45a0265307" />| <img width="1080" height="2280" alt="Screenshot_1788579667" src="https://github.com/user-attachments/assets/b9b9af9f-dee1-40f6-9769-f73c24e7c141" />|

| Real-Time Chat |
|-----------------|
|<img width="1080" height="2280" alt="Screenshot_1788579661" src="https://github.com/user-attachments/assets/36c67d3c-befb-4ed4-aeec-35922f905822" />|

---

## ✨ Key Features

### 🔐 Authentication

Users can create accounts and securely sign in to the application.

Features include:

* User registration.
* User login.
* Firebase Authentication.
* User session management.
* Logout.
* User profile initialization.
* Authentication state handling.

---

### 🏠 Home Feed

The home feed displays content from users and followed accounts.

Users can:

* Browse posts.
* Interact with posts.
* View post information.
* Open user profiles.
* Navigate between different sections of the application.

The feed is designed to provide a familiar social-media browsing experience.

---

### 👤 User Profiles

Each user has a dedicated profile page containing their personal information and content.

Profile features include:

* Profile picture.
* Username.
* Name.
* Bio.
* Followers.
* Following.
* User posts.
* Profile information.
* Follow/unfollow functionality.
* Profile editing.

---

### 📝 Posts

Users can create and interact with posts.

Post functionality includes:

* Creating posts.
* Uploading images.
* Displaying captions.
* Viewing post details.
* Liking/interacting with posts.
* Saving posts.
* Viewing the post owner's profile.

---

### ❤️ Favorites

Users can save posts they want to access later.

The favorites system allows users to:

* Add posts to favorites.
* Remove posts from favorites.
* View saved/favorite content.
* Persist favorite data.

---

### 📖 Stories

The application includes a Stories feature inspired by modern social media platforms.

Users can:

* View stories.
* Upload stories.
* Browse stories from different users.
* Display story content in a dedicated story viewer.
* Handle story-related data through Firebase.

---

### 🔍 Explore

The Explore section helps users discover new content and accounts.

It provides a way to:

* Discover posts.
* Browse users/content.
* Explore content outside the user's direct feed.
* Navigate to user profiles.

---

### 🎬 Reels / Videos

The application supports video-based content.

Users can:

* Browse videos.
* Play video content.
* Scroll through video content.
* Interact with video posts.

Video playback is implemented using Flutter video-related functionality.

---

### 👥 Follow System

Users can follow and unfollow other users.

The follow system is used to build the social graph of the application.

It handles:

* Following users.
* Unfollowing users.
* Followers.
* Following lists.
* Feed relationships.

---

### 🔔 Notifications

The application includes a notification system for user interactions.

Notifications can be used for events such as:

* New followers.
* Post interactions.
* Other social activities.

Firebase services can be used to support notification delivery and notification-related data.

---

### 💬 Real-Time Chat

Instagram Clone includes a real-time messaging system.

Users can:

* Open conversations.
* Send messages.
* Receive messages in real time.
* View chat history.
* Communicate with other users.

The real-time communication layer is implemented using Firebase Realtime Database.

---

### ⚙️ Settings

The application includes a settings section where users can customize application preferences.

Features include:

* Light mode.
* Dark mode.
* Language switching.
* Account-related settings.
* Logout.

---

### 🌙 Dark & Light Mode

The application supports multiple visual themes.

Users can switch between:

```text
Light Mode
     ↕
Dark Mode
```

Theme preferences can be persisted locally to provide a consistent experience across sessions.

---

### 🌍 Language Support

The application supports changing the application language.

The architecture allows UI text to be adapted according to the selected language.

---

## 🛠️ Tech Stack

### Frontend

* **Flutter**
* **Dart**

### Backend

* **Firebase**

### Firebase Services

* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Firebase Realtime Database
* Firebase Cloud Messaging

### State Management

* BLoC / Cubit

### Local Storage

* SharedPreferences

### Networking

* Firebase SDK
* REST/API integration where required

### Video

* Flutter video playback functionality

### Version Control

* Git
* GitHub

---

## 🏗️ Architecture

The application follows a modular architecture designed to separate UI, business logic, and data access.

A simplified architecture:

```text
Presentation Layer
       │
       ▼
 BLoC / Cubit
       │
       ▼
 Repository
       │
       ▼
 Data Sources
       │
 ├───────────────┐
 ▼               ▼
Firebase       Local Storage
 │
 ├── Authentication
 ├── Firestore
 ├── Storage
 ├── Realtime Database
 └── Notifications
```

This approach improves:

* Maintainability.
* Scalability.
* Testability.
* Separation of concerns.
* Code organization.

---

## 🗂️ Firestore Data Structure

The application uses Cloud Firestore to manage structured application data.

A simplified representation:

```text
Firestore
│
├── users
│   ├── userId
│   │   ├── uid
│   │   ├── name
│   │   ├── email
│   │   ├── image
│   │   ├── bio
│   │   └── ...
│
├── Posts
│   ├── postId
│   │   ├── userId
│   │   ├── image
│   │   ├── caption
│   │   ├── createdAt
│   │   └── ...
│
├── storys
│   ├── storyId
│   │   ├── userId
│   │   ├── media
│   │   ├── createdAt
│   │   └── ...
│
└── Favorites
    ├── favoriteId
    │   ├── userId
    │   ├── postId
    │   └── ...
```

> The exact Firebase structure may change depending on the current project implementation.

---

## 💬 Real-Time Messaging Architecture

The chat system uses Firebase Realtime Database to provide fast synchronization between users.

Simplified flow:

```text
User A
  │
  │ Send Message
  ▼
Firebase Realtime Database
  │
  │ Real-Time Update
  ▼
User B
  │
  ▼
Chat UI Updated
```

This allows messages to appear without requiring the user to manually refresh the conversation.

---

## 🔥 Firebase Integration

Firebase provides the main backend infrastructure of the application.

### Firebase Authentication

Used for:

* Registration.
* Login.
* Logout.
* User identity management.

### Cloud Firestore

Used for structured application data including:

* Users.
* Posts.
* Stories.
* Favorites.
* Social relationships.

### Firebase Storage

Used for storing media such as:

* Profile pictures.
* Post images.
* Story media.
* Other uploaded content.

### Firebase Realtime Database

Used primarily for:

* Real-time messaging.
* Chat synchronization.
* Live communication.

### Firebase Cloud Messaging

Can be used to support:

* Push notifications.
* Social interaction notifications.
* Messaging notifications.

---

## 💾 Local Storage

SharedPreferences is used to persist lightweight local application settings.

Possible stored values include:

* Theme preference.
* Language preference.
* User preferences.
* Other lightweight application state.

---

## 🔄 Application Flow

A simplified application flow:

```text
              ┌──────────────┐
              │   Launch App │
              └──────┬───────┘
                     │
                     ▼
              ┌──────────────┐
              │ Authentication│
              └──────┬───────┘
                     │
             ┌───────┴────────┐
             │                │
             ▼                ▼
        Login/Register      Logged In
                              │
                              ▼
                         Home Feed
                              │
       ┌──────────┬──────────┼──────────┬──────────┐
       ▼          ▼          ▼          ▼          ▼
     Explore    Reels      Stories    Favorites  Profile
                                                  │
                                                  ▼
                                                 Chat
```

---

## 🎨 UI/UX

The application follows a clean social-media-oriented interface inspired by modern mobile design patterns.

Main UI principles include:

* Minimal navigation.
* Clear visual hierarchy.
* Consistent spacing.
* Reusable components.
* Responsive layouts.
* Smooth interactions.
* Light and dark themes.
* Familiar social-media interaction patterns.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android SDK
* Git

Check your Flutter installation:

```bash
flutter doctor
```

---

## 📥 Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/instagram-clone.git
```

Navigate to the project:

```bash
cd instagram-clone
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🔥 Firebase Configuration

Because the application uses Firebase, Firebase must be configured before running the complete application.

Required Firebase services may include:

* Firebase Authentication.
* Cloud Firestore.
* Firebase Storage.
* Firebase Realtime Database.
* Firebase Cloud Messaging.

The Firebase configuration files should be added according to the official FlutterFire setup process.

Do not expose private credentials or sensitive configuration in a public repository.

---

## 🧪 Testing & Analysis

Run Flutter tests:

```bash
flutter test
```

Run static analysis:

```bash
flutter analyze
```

Format the project:

```bash
dart format .
```

---

## 📦 Build

Generate a release APK:

```bash
flutter build apk --release
```

Generate an Android App Bundle:

```bash
flutter build appbundle --release
```

---

## 🔐 Security Considerations

The application should follow secure development practices such as:

* Firebase Authentication for identity management.
* Firestore security rules.
* Storage security rules.
* Realtime Database security rules.
* Validation of user-generated data.
* Avoiding hard-coded secrets.
* Proper access control for user data.

Firebase security rules should be configured appropriately before deploying the application to production.

---

## 📈 Future Improvements

Possible future improvements include:

* Advanced post recommendations.
* Comments system.
* Post sharing.
* Hashtags.
* Mentions.
* Advanced search.
* Better notification management.
* Voice messages.
* Image/video compression.
* Pagination and lazy loading.
* Improved caching.
* Offline support.
* Story reactions.
* Story replies.
* Advanced chat features.
* Message read receipts.
* Typing indicators.
* Push notification improvements.
* Better content moderation.
* Performance optimization.

---

## 🧠 What I Learned

Building Instagram Clone provided practical experience with real-world Flutter application development.

Key learning outcomes include:

* Building a complete Flutter application.
* Firebase Authentication.
* Cloud Firestore.
* Firebase Storage.
* Firebase Realtime Database.
* Real-time communication.
* Media handling.
* Video playback.
* Social relationship modeling.
* BLoC/Cubit state management.
* Local data persistence.
* Theme management.
* Localization.
* Git and GitHub.
* Clean Architecture principles.
* Repository pattern.
* Building reusable Flutter widgets.
* Managing complex application state.

---

## 📊 Project Highlights

| Category           | Technology / Implementation   |
| ------------------ | ----------------------------- |
| Platform           | Mobile                        |
| Framework          | Flutter                       |
| Language           | Dart                          |
| Backend            | Firebase                      |
| Authentication     | Firebase Authentication       |
| Database           | Cloud Firestore               |
| Real-Time Database | Firebase Realtime Database    |
| File Storage       | Firebase Storage              |
| Notifications      | Firebase Cloud Messaging      |
| State Management   | BLoC / Cubit                  |
| Local Storage      | SharedPreferences             |
| Video              | Flutter Video Playback        |
| Architecture       | Clean Architecture Principles |
| Version Control    | Git / GitHub                  |

---

## 🎯 Project Goals

The main objectives of this project were:

1. Build a complete social media application using Flutter.
2. Practice Firebase integration.
3. Implement real-time communication.
4. Work with cloud databases and media storage.
5. Improve state management skills.
6. Apply scalable architecture principles.
7. Build reusable UI components.
8. Gain experience with complex mobile application workflows.

---

## 👨‍💻 Developer

**Ahmed Abd Elbar**

Flutter Developer focused on building modern, scalable, and user-focused mobile applications.

### Core Skills

* Flutter
* Dart
* Firebase
* BLoC / Cubit
* REST APIs
* Clean Architecture
* MVVM
* Git & GitHub
* UI/UX Implementation
* Mobile App Development

---

## 📬 Contact

Interested in working together or discussing a mobile application project?

Feel free to get in touch.

**Flutter Developer | Mobile App Developer**

---

## ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.
