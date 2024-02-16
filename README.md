# ToDoList_IOS
The application was written in Swift, implements ToDoList on IOS platform. To use application, you need to create your own google firebase.

# Description
Application consists of several prepared screens, allows user registration and login using Google Firebase and then, after logging in, we have a todolist window with the ability to add new tasks and their deadlines. The second window is the profile window containing the appropriate user account information. It also allows you to log out. Whole user data is stored using googlefirebase and internet connection is required for application to work properly.

# Setup
Create your own google firebase:
https://www.youtube.com/watch?v=F9Gs_pfT3hs
https://firebase.google.com/docs/ios/setup

Then generate GoogleService-Info.plist file, with your keys. This file should be in ToDoLista/rest folder instead of empty file that is here. 

You also need to add packages to your xcodeproject (firebase-ios-sdk):
-FirebaseAuth
-FirebaseFirestore
-FirebaseFirestoreSwift
