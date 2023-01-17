part of "post_feed_image_item.dart";

class _FeedItemLoading extends StatelessWidget {
  const _FeedItemLoading();

  Widget _infoSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SkeletonView.headline(color: Colors.white),
        const SizedBox(height: 15),
        Row(
          children: [
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            ),
            const SizedBox(width: 12),
            Container(
              height: 18,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _dateSection() {
    return Container(
      height: 70,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SkeletonView.shimmer(const SkeletonView()),
        Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(20),
            child: _dateSection()),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          child: _infoSection(),
        )
      ],
    );
  }
}
