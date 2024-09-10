# API App

## Description

This Flutter project is using a jsonplaceholder API to test and practice integration of API into flutter apps. The app displays a list of users fetched, each user has posts and each post has comments. All data are requested by http including photos that can be shown in Photos bottom navigation bar item.

## Features

- Display Users
- View user's posts
- View each post's comments
- View images in a separate page

# Work

## CustomNavigation
- This Widget is the start of the app, it serves as a homescreen to redirect user to desired page via bottom navigation bar.
- NavBloc is used here for state management

## UsersScreen
- This Screen displays all users, each user's info are contained in a container alongside a button to view posts
- users information are requested from API via getIt, and the result are displayed in a FutureBuilder

## PhotosScreen
- The Photos Screen displays 10 random photos from API
- Used an optional parameter {List<int>? photosIndexes} in getAllPhotos method instead of creating another method.

## PostsScreen
- This screen shows all posts of a specific user, based on userId.
- The same way, I used an optional parameter {int? userId} to get only one user's posts.
- Each post contains a text button "see all comments".
- PostBloc is used here to handle the event of pressing the textButton
- Comments for each post are displayed in a bottom sheet (using BlocListener and showModalBottomSheet)

## Helper Files and Packages

### Services
- screen.dart --> to access context height and width
- setup.dart --> to access GetIt locator and ApiNetworking

### Custom Widgets
- To organize code and make it easier to read and maintain

### Packages
- flutter_bloc: ^8.1.6
- get_it: ^7.7.0
- http: ^1.2.2
- stacked_list_carousel: ^1.0.1


## GIF

## Help
If you encounter any issues:
- Make sure you have all the necessary dart files within the project
- Contact us so that we can help resolve the problem

## Authors
Abdulaziz Alamri

## Version History
**See commits history for more details**

## Acknowledgments
Tuwaiq Academy

![Tuwaiq Academy](./assets/images/TA.png)