import 'package:fingerfunke_app/view/app_info/app_info_page.dart';
import 'package:fingerfunke_app/view/chat/view/chat_page.dart';
import 'package:fingerfunke_app/view/moderation/mod_post_report/mod_post_report_page.dart';
import 'package:fingerfunke_app/view/moderation/moderation_page/moderation_page.dart';
import 'package:fingerfunke_app/view/my_account/view/my_account_page.dart';
import 'package:fingerfunke_app/view/post/view/post_page.dart';
import 'package:fingerfunke_app/view/saved/view/saved_page.dart';

import 'view/app_info/subpages/licenses/view/oss_licenses_page.dart';
import 'view/app_info/subpages/manage_account/view/manage_account_page.dart';
import 'view/app_info/subpages/settings/view/settings_page.dart';
import 'view/app_info/subpages/view/settings_dev_tools_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used
class Routes {
  static const saved = "/saved";
  static const account = "/account";
  static const post = "/post";
  static const manageAccount = "/manageAccount";
  static const postEditor = "/create";
  static const devtools = "/devtools";
  static const moderation = "/moderation";
  static const moderationPosts = "/moderation/posts";
  static const settings = "/settings";

  static const about = "/about";
  static const licenses = "/about/licenses";

  static const chat = "/chat";
}

final routes = {
  Routes.saved: (context) => const SavedPage(),
  Routes.account: (context) => const MyAccountPage(),
  Routes.manageAccount: (context) => const ManageAccountPage(),
  Routes.postEditor: (context) => const PostPage(editing: true),
  Routes.post: (context) => const PostPage(),
  Routes.devtools: (context) => const DevToolsPage(),
  Routes.moderation: (context) => const ModerationPage(),
  Routes.moderationPosts: (context) => const ModPostReportPage(),
  Routes.licenses: (context) => const OssLicensesPage(),
  Routes.settings: (context) => const SettingsPage(),
  Routes.about: (context) => const AppInfoPage(),
  Routes.chat: (context) => const ChatPage(),
};
