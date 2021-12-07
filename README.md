# community-on-demand

We are building a product to give students a method of learning important employability skills through a fun interactive platform that will keep them engaged based on the existing card game Community On Demand.

Many students graduate high school without realizing what skills their desired career deem essential. Without a plan, they may waste time and money in the pursuit of their goals.
This product is a mobile app that projects an employability curriculum and its supplemental card game in order to aid individuals in designing, measuring, building, and organizing their employability skill sets in order to utilize these skills to create a business within the game. 
The application will serve as a companion for users to be able to keep track of their progress through the curriculum, as well as provide a way for the users to keep track of what skills they have through the use of a badge reward system.
This product differentiates itself by not only having this as a card game that students can play together without needing physical cards but also as a curriculum/business guide in which schools can choose to incorporate in their classes.
This product differentiates itself from other career-ready games by using a curriculum/business guide through an engaging card game in which schools can choose to incorporate into their classes. 

Team Members:

Kelly Tran

John Thieu

Nathan Duong

Kevin Huynh

Jake Smith

Brandon Chung

# Release Notes version 1.0:

## NEW FEATURES
- Everything you see!
- Create and log into your own Community on Demand account using an email and password. We've gotten some help from Firebase to keep all of your information extra safe! Have the option to either create a user or administrator account.
- Create your own profile so your friends and classmates can find you! Edit your profile and log-in information anytime to keep your information up to date.
- Let the world know about your employability skills by playing the Community on Demand Card Game! Swipe left, up, or right on each card to indicate the extent to which you possess its associated skill. We hope this gameplay style isn't all too familiar to some of you.
- View your card game results anytime in your profile!
- Create and delete projects as a user in order to keep a portfolio of your work! Your projects allow you to keep track of your employability skills before you begin and after you finish your project.
- Join/leave nearby classes to stay connected with your teachers/administrators!
- Create new classes and delete old ones as a teacher/administrator in order to keep your students/users organized in one place!

## BUG FIXES
- Fixed UI overflow errors caused by too many widgets appearing on the screen.
- User's list of projects on the UI now update in real-time when creating a new project, instead of having to switch pages/tabs to see the updated list.
- Fixed project's name & description not updating on the database and only updating locally.
- Fixed user's list of projects resetting on every new launch of the application.
- Logging in as an administrator no longer causes a backend error with invalid key-value hashmap accessing.
- When editing the project description, the "Enter" key no longer creates a new line and instead updates the database with the new description.
- Fixed administrator's list of classes resetting after every new launch of the application.
- Logging out no longer leads to a non-existent page, leading to error.
- User no longer has to restart application in order to join a newly created class.
- Fixed user not being able to access the "Join Class" page after a new class is created.

## KNOWN BUGS
- User cannot generate or share their CARES report with their teacher/administrator.
- User cannot notify teacher/administrator of any updates to their project.
- User cannot add or update new accomplishment badges onto their account.
- User cannot add multiple people to their project; only one person can work on a project.
- Administrator cannot not see real-time UI updates to their current class when switching to a different class.

# Installation Guide for Community on Demand 1.0 (Windows)
## PRE-REQUISITES
- Windows 7 or later
- Windows PowerShell 5.0 or later (comes pre-installed for Windows 10 users)
- 15Gb of disk space (7Gb if not using emulated devices)
## DEPENDENCIES
- Download and install [Git](https://git-scm.com/download/win)
- Download and install [Flutter](https://docs.flutter.dev/get-started/install/windows#get-the-flutter-sdk)
- Download and install [Android Studio](https://docs.flutter.dev/get-started/install/windows#install-android-studio)
    - Download and install [Flutter plugin for Android Studio](https://docs.flutter.dev/get-started/editor)
    - If using an actual Android device, [set up Android device in Android Studio](https://docs.flutter.dev/get-started/install/windows#set-up-your-android-device)
    - If emulating an Android device, [set up emulator in Android Studio](https://docs.flutter.dev/get-started/install/windows#set-up-the-android-emulator)
## DOWNLOAD
- Navigate to your desired project folder location in the Command Prompt or Android Studio terminal
- Once in desired directory, paste and run 'git clone https://github.com/kellytran3k/community-on-demand.git'
## RUN
- Run 'flutter pub get', 'flutter pub upgrade', and 'flutter pub outdated' to ensure that all dependencies are up to date and retrieved prior to running the app
- Pick your desired device in the Flutter Device Selection dropdown
- If 'main.dart' is not the selected file in the Run/Debug Configs dropdown to the right of the Flutter Device Selection, then select it
- Press run button to run 'main.dart' (or press Shift+F10)
## TROUBLESHOOT
- When attempting to run the application, it may be necessary to manually open the emulator in Flutter Device Selection before pressing run in order to ensure that a device is selected



# Installation Guide for Community on Demand 1.0 (MacOS)
## PRE-REQUISITES
- Mojave or later
- 15Gb of disk space (7Gb if not using emulated devices)
## DEPENDENCIES
- Download and install Git (https://git-scm.com/download/mac)
- Download and install Flutter (https://docs.flutter.dev/get-started/install/macos#get-sdk)
If using for Android:
- Download and install Android Studio (https://docs.flutter.dev/get-started/install/macos#install-android-studio)
    - Download and install Flutter plugin for Android Studio (https://docs.flutter.dev/get-started/editor)
    - If using an actual Android device, set up Android device in Android Studio (https://docs.flutter.dev/get-started/install/macos#set-up-your-android-device)
    - If emulating an Android device, set up emulator in Android Studio (https://docs.flutter.dev/get-started/install/macos#set-up-the-android-emulator)
If using for iOS:
- Download and install Xcode (https://docs.flutter.dev/get-started/install/macos#install-xcode)
    - Download and install Flutter plugin for Xcode (https://docs.flutter.dev/get-started/editor)
    - If using an actual iOS device, you must deploy the app to the device to test it (https://docs.flutter.dev/get-started/install/macos#deploy-to-ios-devices)
    - If emulating an iOS device, set up emulator in Xcode (https://docs.flutter.dev/get-started/install/macos#set-up-the-ios-simulator)
## DOWNLOAD
- Navigate to your desired project folder location in the Command Prompt or Android Studio terminal
- Once in desired directory, paste and run 'git clone https://github.com/kellytran3k/community-on-demand.git'
## RUN
- Run 'flutter pub get', 'flutter pub upgrade', and 'flutter pub outdated' to ensure that all dependencies are up to date and retrieved prior to running the app
- Pick your desired device in the Flutter Device Selection dropdown
- If 'main.dart' is not the selected file in the Run/Debug Configs dropdown to the right of the Flutter Device Selection, then select it
- Press run button to run 'main.dart' (or press Shift+F10)
## TROUBLESHOOT
- When attempting to run the application, it may be necessary to manually open the emulator in Flutter Device Selection before pressing run in order to ensure that a device is selected
