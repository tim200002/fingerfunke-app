import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PageAppBar extends AppBar {
  PageAppBar(BuildContext context,
      {Key? key,
      required String title,
      bool closable = false,
      List<Widget>? actions})
      : super(
            key: key,
            title: Text(title),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(closable ? Icons.close : Icons.arrow_back)));
}

class PageScreen extends StatelessWidget {
  static const double TOP_PADDING = 23;

  final Function? onRefresh;
  final Widget? header;
  final Widget? headerBottom;
  final Widget? leading;
  final double? headerHeight;
  final double sidePadding;
  final List<Widget>? children;
  final Widget? body;
  final AppBar? appBar;
  final bool roundedBody;
  final bool roundedHeader;
  final bool? extendBodyBehindAppBar;
  PageScreen(
      {Key? key,
      this.onRefresh,
      this.header,
      this.headerBottom,
      this.headerHeight,
      this.sidePadding = AppTheme.PADDING_SIDE,
      this.extendBodyBehindAppBar,
      this.roundedBody = true,
      this.roundedHeader = true,
      this.appBar,
      this.children,
      this.body,
      this.leading})
      : super(key: key) {
    if (body == null && children == null || body != null && children != null) {
      throw Exception(
          "PageScreen: Excactly one of 'child' or 'children' must be not null");
    }
  }

  Widget _content() {
    return Container(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, c) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(roundedBody ? 15.0 : 0),
                child: CustomScrollView(
                  slivers: [
                    if (header != null)
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leading: leading,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        stretch: true,
                        // TODO https://github.com/flutter/flutter/issues/54059
                        /*
                        collapsedHeight: headerHeight ?? (c.maxWidth * 0.5).clamp(300, 400),
                        expandedHeight: c.maxHeight,
                         */
                        expandedHeight:
                            headerHeight ?? (c.maxWidth * 0.5).clamp(300, 400),
                        flexibleSpace: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(roundedHeader ? 15.0 : 0),
                          child: FlexibleSpaceBar(
                              stretchModes: const [
                                StretchMode.zoomBackground,
                              ],
                              collapseMode: CollapseMode.parallax,
                              background: header),
                        ),
                        bottom: headerBottom == null
                            ? null
                            : PreferredSize(
                                preferredSize: const Size.fromHeight(0),
                                child: headerBottom!),
                      ), //expandedHeight: 600,
                    if (body != null)
                      SliverFillRemaining(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.PADDING_SIDE),
                          child: body,
                        ),
                      ),
                    if (children != null)
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.PADDING_SIDE),
                              alignment: Alignment.topCenter,
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: children ?? []),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _content(),
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
    );
  }
}
