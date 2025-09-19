import 'dart:io';

class Student {
  int id; // int
  String name; // String
  double gpa; // double
  bool enrolled; // bool
  List<String> courses; // List<String>

  Student(this.id, this.name, this.gpa, this.enrolled, this.courses);

  Map<String, dynamic> toMap() {
    // Map representation of student
    return {
      "id": id,
      "name": name,
      "gpa": gpa,
      "enrolled": enrolled,
      "courses": courses,
    };
  }
}

void main() {
  List<Student> students = [];
  Set<String> allCourses = {}; // Set for unique courses

  while (true) {
    print("\n--- Student Management ---");
    print("1. Add Student");
    print("2. View All Students");
    print("3. Check Enrollment");
    print("4. Show Unique Courses");
    print("5. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        // Add Student
        stdout.write("Enter student ID (int): ");
        int id = int.parse(stdin.readLineSync()!);

        stdout.write("Enter student name (String): ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter GPA (double): ");
        double gpa = double.parse(stdin.readLineSync()!);

        stdout.write("Is the student enrolled? (yes/no): ");
        bool enrolled = stdin.readLineSync()!.toLowerCase() == "yes";

        stdout.write("Enter courses separated by commas: ");
        List<String> courses = stdin
            .readLineSync()!
            .split(",")
            .map((c) => c.trim())
            .toList();

        students.add(Student(id, name, gpa, enrolled, courses));
        allCourses.addAll(courses);

        print("✅ Student added successfully.");
        break;

      case "2":
        // View Students
        if (students.isEmpty) {
          print("No students found.");
        } else {
          for (var s in students) {
            print(s.toMap()); // printing as Map
          }
        }
        break;

      case "3":
        // Check enrollment
        stdout.write("Enter student ID to check: ");
        int checkId = int.parse(stdin.readLineSync()!);
        var found = students.where((s) => s.id == checkId).toList();
        if (found.isNotEmpty) {
          print(
            found.first.enrolled
                ? "${found.first.name} is enrolled."
                : "${found.first.name} is NOT enrolled.",
          );
        } else {
          print("No student found with ID $checkId.");
        }
        break;

      case "4":
        // Unique courses
        print("All Unique Courses: $allCourses");
        break;

      case "5":
        print("Goodbye!");
        return;

      default:
        print("❌ Invalid choice. Try again.");
    }
  }
}
