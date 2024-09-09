(API will used)[https://jsonplaceholder.typicode.com]

## Assignment: Backend Development using Dart and Shelf Package

In this assignment, you will create a backend server using Dart programming language and the Shelf package to handle HTTP requests and responses. The server will have endpoints to display all users, display one user by id, display one user by email, and remove one user by id. You should use the shelf_hotreload and dart_code_metrics packages to ensure good coding practices and ease of development.

## Requirements:
1. Create a Dart project and install the Shelf and shelf_hotreload packages.
2. Create a "model" file to represent the user object with the required properties.
3. Create a "repository" file to store the users in memory and handle CRUD operations on the user objects.
4. Create a "routes" folder to contain the router handlers for each endpoint.
5. Create a "response" folder to contain the handler methods for each endpoint.
6. Implement an endpoint to display all users. This endpoint should return a JSON response containing all user objects.
7. Implement an endpoint to display one user by id. This endpoint should accept an id parameter in the request URL and return a JSON response containing the user object with the matching id.
8. Implement an endpoint to display one user by email. This endpoint should accept an email parameter in the request URL and return a JSON response containing the user object with the matching email.
9. Implement an endpoint to remove one user by id. This endpoint should accept an id parameter in the request URL and remove the user object with the matching id from the repository.

## Grading Criteria:
1. Correct implementation of all four endpoints.
2. Use of the Shelf package to handle HTTP requests and responses.
3. Use of the shelf_hotreload and dart_code_metrics packages to ensure good coding practices and ease of development.
4. Use of a "model" file to represent the user object with the required properties.
5. Use of a "repository" file to store the users in memory and handle CRUD operations on the user objects.
6. Use of a "routes" folder to contain the router handlers for each endpoint.
7. Use of a "response" folder to contain the handler methods for each endpoint.
8. Code readability and documentation.
9. Proper error handling.

## Note:
You can use the provided JSON data to create test users and test the endpoints.
