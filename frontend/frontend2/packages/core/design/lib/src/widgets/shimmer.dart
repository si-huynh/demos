import 'package:design/design.dart';
import 'package:flutter/material.dart';

export 'shimmer_loading.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    this.child,
  });

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();

  static const basic = LinearGradient(
    colors: [
      Color.fromARGB(255, 235, 244, 242),
      Color.fromARGB(255, 244, 244, 244),
      Color.fromARGB(255, 235, 244, 237),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1, -0.3),
    end: Alignment(1, 0.3),
  );
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
        colors: [
          context.theme.colorScheme.surfaceContainerHighest,
          context.theme.colorScheme.surfaceContainerHigh,
          context.theme.colorScheme.surfaceContainerHighest,
        ],
        stops: const [0.1, 0.3, 0.4],
        begin: const Alignment(-1, -0.3),
        end: const Alignment(1, 0.3),
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject()! as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0, 0);
  }
}
