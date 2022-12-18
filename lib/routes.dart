import 'view/app_info/app_info_page.dart';
import 'view/app_info/subpages/licenses/view/oss_licenses_page.dart';
import 'view/app_info/subpages/manage_account/view/manage_account_page.dart';
import 'view/app_info/subpages/settings/view/settings_page.dart';
import 'view/app_info/subpages/view/settings_dev_tools_page.dart';
import 'view/chat/view/chat_page.dart';
import 'view/feedback/send/feedback_send_page.dart';
import 'view/moderation/mod_post_report/mod_post_report_page.dart';
import 'view/moderation/moderation_page/moderation_page.dart';
import 'view/my_account/view/my_account_page.dart';
import 'view/post/view/event_page.dart';
import 'view/saved/saved_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used
class Routes {
  static const about = "/about";
  static const account = "/account";
  static const chat = "/chat";
  static const devtools = "/devtools";
  static const feedback = "/feedback";
  static const licenses = "/about/licenses";
  static const manageAccount = "/manageAccount";
  static const moderation = "/moderation";
  static const moderationPosts = "/moderation/posts";
  static const post = "/post";
  static const postEditor = "/create";
  static const settings = "/settings";
  static const saved = "/saved";
}

final routes = {
  Routes.about: (context) => const AppInfoPage(),
  Routes.account: (context) => const MyAccountPage(),
  Routes.chat: (context) => const ChatPage(),
  Routes.devtools: (context) => const DevToolsPage(),
  Routes.feedback: (context) => const FeedbackSendPage(),
  Routes.licenses: (context) => const OssLicensesPage(),
  Routes.manageAccount: (context) => const ManageAccountPage(),
  Routes.moderation: (context) => const ModerationPage(),
  Routes.moderationPosts: (context) => const ModPostReportPage(),
  Routes.post: (context) => const EventPage(),
  Routes.postEditor: (context) => const EventPage(editing: true),
  Routes.settings: (context) => const SettingsPage(),
  Routes.saved: (context) => const SavedPage(),
};
