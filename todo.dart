import 'dart:io';

void main() {
  print("\n👋 Welcome\n");

  //displaying menu
  void displayMenu() {
    print("""
Menu:
[1] New Plan
[2] Edit Plan
[3] Delete Plan
[4] My Plans
[5] Exit
""");
  }

  List<Map<String, dynamic>> plans = [];

  int planCount = 0;

  while (true) {
    displayMenu();

    stdout.write("Select: ");
    String? menu = stdin.readLineSync();

    //add new plan
    if (menu == "1") {
      print("\x1B[2J\x1B[0;0H");
      print("New Plan\n");
      print("🟠 Enter 0 for back");

      stdout.write("\nPlan title: ");
      String? title = stdin.readLineSync();

      if (title == "0") {
        print("\x1B[2J\x1B[0;0H");
      } else if (title == "") {
        print("❗️ Invalid value!");
      } else {
        Map<String, dynamic> plan = {
          "id": "$planCount",
          "title": "$title",
          "date": DateTime.now()
        };
        plans.add(plan);
        planCount++;
        print("\x1B[2J\x1B[0;0H");
        print("✅ Saved\n");
      }
    } else if (menu == "2") { //Edit plan
      print("\x1B[2J\x1B[0;0H");
      print("Edit Plan\n");
      if (plans.length == 0) {
        print("🫤  No Plans\n");
        continue;
      }
      print("🟠 Enter 00 for back");

      plans.forEach((element) {
        print(
            "\nId: ${element["id"]}\nTitle: ${element["title"]}\nDate: ${element["date"]}");
      });

      while (true) {
        stdout.write("\nEnter id: ");
        String? id = stdin.readLineSync();

        bool isHave = false;

        plans.forEach((element) {
          if (element["id"] == id) {
            isHave = true;
          }
        });

        if (isHave) {
          if (id != "" && id != "00") {
            stdout.write("Write changes: ");
            String? new_title = stdin.readLineSync();

            plans.forEach((element) {
              if (element["id"] == id) {
                element["title"] = new_title;
                print("\x1B[2J\x1B[0;0H");
                print("✅ Changes saved");
              }
            });
            break;
          } else if (id == "00") {
            print("\x1B[2J\x1B[0;0H");
            break;
          } else {
            print("❗️ Invalid value");
          }
        } else {
          print("❗️ Invalid value");
          continue;
        }
      }
    } else if (menu == "3") { //Delete plan
      print("\x1B[2J\x1B[0;0H");
      print("Edit Plan\n");
      print("🟠 Enter 00 for back");

      plans.forEach((element) {
        print(
            "\nId: ${element["id"]}\nTitle: ${element["title"]}\nDate: ${element["date"]}");
      });

      stdout.write("\nEnter id: ");
      String? id = stdin.readLineSync();

      if (id != "" && id != "00") {
        for (int i = 0; i < plans.length; i++) {
          if (plans[i]["id"] == id) {
            plans.remove(plans[i]);
            print("\x1B[2J\x1B[0;0H");
            print("✅ Deleted plan");
            break;
          }
        }
      } else if (id == "00") {
        print("\x1B[2J\x1B[0;0H");
      }
    } else if (menu == "4") { //My plans
      print("\x1B[2J\x1B[0;0H");
      print("My Plans\n");

      if (plans.length == 0) {
        print("🫤 No Plans");
      }

      plans.forEach((element) {
        print(
            "\nId: ${element["id"]}\nTitle: ${element["title"]}\nDate: ${element["date"]}\n");
      });
    } else if (menu == "5") { //Exit
      print("❗️ You Leaved!");
      exit(0);
    }
  }
}
