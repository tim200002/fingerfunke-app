import 'view/app_info/app_info_page.dart';
import 'view/app_info/subpages/licenses/view/oss_licenses_page.dart';
import 'view/app_info/subpages/manage_account/view/manage_account_page.dart';
import 'view/app_info/subpages/settings/view/settings_page.dart';
import 'view/app_info/subpages/view/settings_dev_localstorage.dart';
import 'view/app_info/subpages/view/settings_dev_tools_page.dart';
import 'view/chat/view/chat_page.dart';
import 'view/feedback/send/feedback_send_page.dart';
import 'view/moderation/moderation_page/moderation_page.dart';
import 'view/my_account/view/my_account_page.dart';
import 'view/post/event/view/event_page.dart';
import 'view/socialmedia/user_socialmedia_page.dart';
import 'view/saved/saved_page.dart';
import 'view/tutorial/tutorial_page.dart';

/// this variable holds the global routes that can be used within the app
/// the widgets used with this routing should end with the suffix 'Page' to
/// clarify how they're used
class Routes {
  static const about = "/about";
  static const account = "/account";
  static const chat = "/chat";
  static const devtools = "/devtools";
  static const devtoolsLocalStorage = "/devtools/storage";
  static const feedback = "/feedback";
  static const licenses = "/about/licenses";
  static const manageAccount = "/account/manage";
  static const linkSocialMedia = "/account/social";
  static const moderation = "/moderation";
  static const moderationPosts = "/moderation/posts";
  static const post = "/post";
  static const postEditor = "/create";
  static const settings = "/settings";
  static const saved = "/saved";
  static const tutorial = "/tutorial";
}

final routes = {
  Routes.about: (context) => const AppInfoPage(),
  Routes.account: (context) => const MyAccountPage(),
  Routes.chat: (context) => const ChatPage(),
  Routes.devtools: (context) => const DevToolsPage(),
  Routes.devtoolsLocalStorage: (context) => const DevToolsStoragePage(),
  Routes.feedback: (context) => const FeedbackSendPage(),
  Routes.licenses: (context) => const OssLicensesPage(),
  Routes.manageAccount: (context) => const ManageAccountPage(),
  Routes.linkSocialMedia: (context) => const UserSocialMediaPage(),
  Routes.moderation: (context) => ModerationPage(),
  Routes.post: (context) =>  EventPage(),
  Routes.postEditor: (context) => EventPage(editing: true),
  Routes.settings: (context) => const SettingsPage(),
  Routes.saved: (context) => SavedPage(),
  Routes.tutorial: (context) => const TutorialPage(),
};
