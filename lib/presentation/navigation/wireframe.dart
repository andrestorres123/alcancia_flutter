import 'package:alcancia_flutter/presentation/navigation/screen.dart';
import 'package:alcancia_flutter/presentation/sections/checklist/checklist_page.dart';
import 'package:alcancia_flutter/presentation/sections/home_page.dart';
import 'package:alcancia_flutter/presentation/sections/login/login_page.dart';

class Wireframe {
  Screen initialPage() => logInPage();

  Screen logInPage() => Screen(LoginPage(), "Login");

  Screen checklistPage() =>
      Screen(ChecklistPage(), "Checklist", isModal: true, replace: true);

  Screen homePage() => Screen(HomePage(), "Home");
}
