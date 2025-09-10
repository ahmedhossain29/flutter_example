// ------------------------------
// Null Safety Practice Example
// ------------------------------
// This example demonstrates:
// 1. Nullable and non-nullable variables
// 2. Null-aware operators (??, ?., ??=)
// 3. Late variables
// 4. Nullable lists
// 5. Safe function handling with null defaults

void main() {
  // ------------------------------
  // 1. Nullable and Non-nullable variables
  // ------------------------------
  String name = "Alice"; // Non-nullable (cannot be null)
  String? nickname;      // Nullable (can be null)

  print("Name: $name");
  print("Nickname: ${nickname ?? "No Nickname"}"); // Null-aware operator

  // ------------------------------
  // 2. Null Assertion Operator (!) - only if you are sure it's not null
  // ------------------------------
  nickname = "Ally";
  print("Nickname in uppercase: ${nickname!.toUpperCase()}"); // safe here

  // ------------------------------
  // 3. Late variable - initialized later
  // ------------------------------
  late String title;
  title = "Flutter Developer";
  print("Title: $title"); // ✅ works
  // Uncommenting the next line before assignment would throw LateInitializationError
  // print(title);

  // ------------------------------
  // 4. Null-aware operators and conditional assignment
  // ------------------------------
  int? age;
  age ??= 25; // assign if null
  print("Age: $age");

  // ------------------------------
  // 5. Nullable list
  // ------------------------------
  List<String>? fruits;
  print("Number of fruits: ${fruits?.length ?? 0}"); // prints 0 if null

  fruits = ["Apple", "Banana"];
  print("Number of fruits: ${fruits?.length ?? 0}"); // prints 2

  // ------------------------------
  // 6. Function handling nullable parameters
  // ------------------------------
  printUserAge(null);   // Age not provided
  printUserAge(30);     // Age: 30

  getProfileInfo("Alice", "24", "Paris");
  getProfileInfo(null, null, "London");
}

// ------------------------------
// Function: printUserAge
// Takes a nullable integer and prints a message safely
// ------------------------------
void printUserAge(int? age) {
  print(age != null ? "Age: $age" : "Age not provided");
}

// ------------------------------
// Function: getProfileInfo
// Handles nullable parameters with safe defaults
// ------------------------------
void getProfileInfo(String? name, String? age, String? city) {
  String displayName = (name != null && name.isNotEmpty) ? name : "Unknown";
  String displayAge = (age != null && age.isNotEmpty) ? age : "N/A";
  String displayCity = (city != null && city.isNotEmpty) ? city : "Unknown City";

  print("Name: $displayName, Age: $displayAge, City: $displayCity");
}
