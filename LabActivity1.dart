import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print("\n===== main menu =====");
    print("1. Budget Tracker");
    print("2. Grade Calculator");
    print("3. Exit");

    stdout.write("Enter your choice: ");
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
      budgetTracker();
          break;

      case 2:
        gradeCalculator();
  break;

      case 3:
        print("Thank you for using the program!");
       running = false;
           break;

      default:
        print("Invalid choice. Please try again.");
          }
   
   
    }
}

void budgetTracker() {
  print("\n===== budget tracker =====");

  double allowance = 0;

  while (allowance <= 0) {
    stdout.write("Monthly Allowance: ");
    allowance = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

    if (allowance <= 0) {
      print("Please enter a positive amount.");
   
       }
  }

  stdout.write("Expenses for Food: ");
  double food = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Transportation Expense: ");
  double transport = double.tryParse(stdin.readLineSync() ?? "") ?? 0;


         stdout.write("School Materials Expense: ");
  double school = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

             stdout.write("Other Expenses: ");
  double others = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

         double totalExpenses = food + transport + school + others;
  double remaining = allowance - totalExpenses;

     double foodPercent = (food / allowance) * 100;
  double transportPercent = (transport / allowance) * 100;
  double schoolPercent = (school / allowance) * 100;
  double othersPercent = (others / allowance) * 100;

  print("\n===== RESULT =====");
    print("Allowance: ₱${allowance.toStringAsFixed(2)}");
        print("Total Expenses: ₱${totalExpenses.toStringAsFixed(2)}");
  print("Remaining Money: ₱${remaining.toStringAsFixed(2)}");

  print("\nExpense Percentage");
     print("Food: ${foodPercent.toStringAsFixed(2)}%");
  print("Transportation: ${transportPercent.toStringAsFixed(2)}%");
     print("School Materials: ${schoolPercent.toStringAsFixed(2)}%");
  print("Others: ${othersPercent.toStringAsFixed(2)}%");

  if (totalExpenses > allowance) {
    print("\nWarning: Your plan exceeds your allowance!");
  }     else if (totalExpenses == allowance) {
     print("\nYou are spending exactly your allowance. No savings left.");
  } else if (totalExpenses < allowance &&
      remaining >= allowance * 0.20) {
     print("\nGreat! You are saving at least 20% of your allowance.");
  } else {
    print("\nYou are within budget, but your savings are less than 20%.");
 
 
          }
}

void gradeCalculator() {
  print("\n===== grade calculator =====");

  stdout.write("Number of quizzes: ");
  int quizzes = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  double totalQuiz = 0;
  int validQuiz = 0;

  for (int i = 1; i <= quizzes; i++) {
    stdout.write("Quiz $i Score: ");
    double score = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

    totalQuiz += score;
 validQuiz++;
 
  }

  double quizAverage = totalQuiz / quizzes;

  stdout.write("score for midterm: ");
  double midterm = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("score for final exam: ");
  double finalExam = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  double finalGrade =
      quizAverage * 0.30 +
      midterm * 0.30 +
      finalExam * 0.40;

  print("\nQuiz Average: ${quizAverage.toStringAsFixed(2)}");
  print("Final Grade: ${finalGrade.toStringAsFixed(2)}");

  if (finalGrade >= 90) {
    print("Excellent, Aliah! Grade: A");
                  } else if (finalGrade >= 80) {
    print("Very good, Aliah! Grade: B");
                                    } else if (finalGrade >= 70) {
    print("Good, Aliah! Grade: C");
                                     } else if (finalGrade >= 60) {
    print("Needs improvement. Grade: D");
       } else {
    print("At risk, Aliah. Grade: F");
   }

  print("Valid quiz entries: $validQuiz");
}