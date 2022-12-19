import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/image/user_image/user_image.dart';
import '../../cubits/user_cubit/user_cubit.dart';
import '../error/exception_view.dart';
import '../socialmedia/social_media_links.dart';

class UserProfileView extends StatelessWidget {
  final String userId;
  const UserProfileView({super.key, required this.userId});

  static void showAsBottomSheet(BuildContext context,
      {required String userId}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => UserProfileView(userId: userId));
  }

  Widget _profileSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) => AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 100),
              child: state.when(
                  loading: () => const SizedBox(
                      height: 100,
                      child:
                          Center(child: CircularProgressIndicator.adaptive())),
                  error: ExceptionView.builder,
                  neutral: (user) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  UserImage(
                                    user.picture,
                                    diameter: 55,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(user.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(FeatherIcons.x))
                            ],
                          ),
                          const SizedBox(height: 20),
                          /*Text(
                        "BIO",
                        style: GoogleFonts.signika(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),*/
                          Text(
                            "Demo Text Voluptatem voluptas architecto vero et voluptatem ut ut et. Illum dolorum consequatur id quia. Vel aut quasi qui veniam ut assumenda",
                            style: GoogleFonts.signika(fontSize: 15),
                          ),
                          SocialMediaLinks(user: user),
                          const SizedBox(height: 30),
                        ],
                      )))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (context) => UserCubit(userId),
        child: _profileSection(context));
  }
}
