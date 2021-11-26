import 'package:fingerfunke_app/view/my_account/subpages/manage_account/view/manage_account_page.dart';
import 'package:fingerfunke_app/view/my_account/subpages/view/developement_util_functions_page.dart';
import 'package:fingerfunke_app/view/my_account/view/my_account_page.dart';
import 'package:fingerfunke_app/view/post/post_page.dart';
import 'package:fingerfunke_app/view/post_editor/post_editor_page.dart';
import 'package:fingerfunke_app/view/saved/view/saved_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used

const savedRoute = "/saved";
const accountRoute = "/account";
const postRoute = "/post";
const manageAccountRoute = "/manageAccount";
const postEditorRoute = "/create";
const developementUtilsRoute = "/developementUtils";

final routes = {
  savedRoute: (context) => const SavedPage(),
  accountRoute: (context) => const MyAccountPage(),
  manageAccountRoute: (context) => const ManageAccountPage(),
  postRoute: (context) => const PostPage(),
  postEditorRoute: (context) => const PostEditorPage(),
  developementUtilsRoute: (context) => const DevelopementUtilFunctionsPage()
};
