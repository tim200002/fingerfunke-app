import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  static const double TOP_PADDING = 23;

  final Function? onRefresh;
  final Widget? header;
  final Widget? headerBottom;
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
      this.body})
      : super(key: key) {
    if (body == null && children == null || body != null && children != null) {
      throw Exception(
          "PageScreen: Excactly one of 'child' or 'children' must be not null");
    }
  }

  Widget _content() {
    return Container(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: LayoutBuilder(
                builder: (context, c) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(roundedBody ? 12.0 : 0),
                              child: CustomScrollView(slivers: [
                                if (header != null)
                                  SliverAppBar(
                                      bottom: headerBottom == null
                                          ? null
                                          : PreferredSize(
                                              preferredSize: Size.fromHeight(0),
                                              child: headerBottom!),
                                      automaticallyImplyLeading: false,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      expandedHeight: headerHeight ??
                                          (c.maxWidth * 0.5).clamp(300, 400),
                                      flexibleSpace: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            roundedHeader ? 12.0 : 0),
                                        child: FlexibleSpaceBar(
                                            //collapseMode: CollapseMode.none,
                                            background: header),
                                      )), //expandedHeight: 600,
                                if (body != null)
                                  SliverFillRemaining(child: body),
                                if (children != null)
                                  SliverList(
                                      delegate: SliverChildListDelegate([
                                    Container(
                                      height: 20,
                                    ),
                                    Container(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: children ?? []),
                                    ),
                                  ])),
                              ])),
                        )
                      ],
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar,
      body: _content(),
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
    ));
  }
}
