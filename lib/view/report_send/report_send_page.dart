import 'package:get_it/get_it.dart';

import '../../common_widgets/image/network_placeholder_image.dart/network_placeholder_image.dart';
import '../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../models/asset/asset.dart';
import '../../models/post/post.dart';
import '../../models/report.dart';
import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../utils/tools.dart';
import '../../utils/util_widgets/future_text.dart';
import '../error/exception_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'cubit/report_send_cubit.dart';
import 'widgets/chip_chooser.dart';

class ReportSendPage extends StatelessWidget {
  final Post post;
  final UserRepository _userRepository = GetIt.instance<UserRepository>();

  ReportSendPage({Key? key, required this.post}) : super(key: key);

  static void navigate(BuildContext context, Post post) {
    Tools.navigate(context,
        builder: (isDialog) => ReportSendPage(
              post: post,
            ));
  }

  Widget _postCard(BuildContext context) {
    // ToDo: Cam we guarentee that the author of a post exists, as I remebeber once an author is deleted also all of his posts are deleted
    Future<User?> userFuture = _userRepository.getUser(post.authorId);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              // The image here should be of such low resolution that
              // I can directly use the data url embedded in the Asset
              child: NetworkPlaceholderImage(
                (post.mainAsset as VideoAsset).thumbnailUrl!,
                Container(
                  color: Colors.grey,
                ),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(10),
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                FutureText(
                  userFuture.then((value) => l10n(context).lbl_postCreatedBy(
                      value?.name ?? l10n(context).lbl_deleted_user)),
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _successView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            FeatherIcons.check,
            color: Colors.green,
            size: 35,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            l10n(context).msg_reportSuccess,
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }

  //TODO: add scaffold
  @override
  Widget build(BuildContext context) {
    return FirebaseAuthenticationCubitCubit.userBuilder(
      (user) {
        return BlocProvider<ReportSendCubit>(
          create: (context) => ReportSendCubit(
              doc: post, type: ReportType.post, author: user.toInfo()),
          child: BlocBuilder<ReportSendCubit, ReportSendState>(
            builder: (context, state) => state.when(
              sending: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              sent: () => _successView(context),
              error: ExceptionView.fromError,
              editing: (doc, type, reasons) => Scaffold(
                appBar: AppBar(
                  title: Text(l10n(context).lbl_reportPost),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _postCard(context),
                        Text(l10n(context).lbl_reportReasons),
                        ChipChooser<ReportReason>(
                            selected: reasons,
                            onChanged: (r) =>
                                context.read<ReportSendCubit>().setReasons(r),
                            chips: ReportReason.values
                                .map((e) => ChipData(e.name.toString(), e))
                                .toList())
                      ],
                    ),
                  ),
                ),
                floatingActionButton: ElevatedButton.icon(
                    onPressed: reasons.isEmpty
                        ? null
                        : () => context.read<ReportSendCubit>().send(),
                    icon: const Icon(FeatherIcons.send),
                    label: Text(l10n(context).lbl_report)),
              ),
            ),
          ),
        );
      },
    );
  }
}
