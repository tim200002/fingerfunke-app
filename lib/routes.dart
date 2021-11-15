import 'package:fingerfunke_app/view/my_account/subpages/manage_account/view/manage_account_page.dart';
import 'package:fingerfunke_app/view/my_account/subpages/view/developement_util_functions_page.dart';
import 'package:fingerfunke_app/view/my_account/view/my_account_page.dart';
import 'package:fingerfunke_app/view/saved/view/saved_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used
final routes = {
  '/saved': (context) => const SavedPage(),
  '/account': (context) => const MyAccountPage(),
  '/manageAccount': (context) => const ManageAccountPage(),
  '/developementUtils': (context) => const DevelopementUtilFunctionsPage()
};
