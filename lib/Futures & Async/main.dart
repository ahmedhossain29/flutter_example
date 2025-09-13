// ------------------------------
// Futures & Async/Await Practice
// ------------------------------
// This example demonstrates:
// 1. How to use Future to get a value later
// 2. Using async/await for cleaner asynchronous code
// 3. Handling errors with try/catch

void main() async {
  print("Start fetching user...");

  // Using async/await
  await getUserName();

  print("Finished fetching user.\n");

  // Using then()
  fetchUserName().then((name) {
    print("User fetched using then(): $name");
  }).catchError((error) {
    print("Error occurred: $error");
  });
}

// ------------------------------
// Function: fetchUserName
// Simulates fetching a username from a server
// Returns a Future<String>
// ------------------------------
Future<String> fetchUserName() {
  return Future.delayed(
    Duration(seconds: 2),  // Simulate network delay
        () => "Alice",          // Data returned after delay
  );
}

// ------------------------------
// Function: getUserName
// Demonstrates async/await usage
// ------------------------------
Future<void> getUserName() async {
  try {
    String name = await fetchUserName();  // Wait for Future to complete
    print("User fetched using async/await: $name");
  } catch (e) {
    print("Failed to fetch user: $e");   // Handle errors
  }
}

// ------------------------------
// Optional: Function with error simulation
// ------------------------------
Future<String> fetchUserNameWithError() {
  return Future.delayed(
      Duration(seconds: 2),
          () => throw "Network Error!"         // Simulate an error
  );
}
