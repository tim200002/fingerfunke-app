import 'package:fingerfunke_app/view/my_account/view/my_account_page.dart';
import 'package:fingerfunke_app/view/post/post_page.dart';
import 'package:fingerfunke_app/view/saved/view/saved_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used

const savedRoute = "/saved";
const accountRoute = "/account";
const postRoute = "/post";

final routes = {
  savedRoute: (context) => const SavedPage(),
  accountRoute: (context) => const MyAccountPage(),
  postRoute: (context) => const PostPage()
};
