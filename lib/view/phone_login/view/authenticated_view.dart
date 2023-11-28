import 'package:flutter/material.dart';

import '../../../utils/tools.dart';

class AuthenticatedView extends StatelessWidget {
  const AuthenticatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(l10n(context).msg_signedIn),
    );
  }
}
