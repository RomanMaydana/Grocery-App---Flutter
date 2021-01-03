import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspctRatio;
  final double offsetPercent;
  const StaggeredDualView(
      {Key key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.offsetPercent = 0.5,
      this.spacing = 0.0,
      this.aspctRatio = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemHight = (width * 0.5) / aspctRatio;
      final height = constraints.maxHeight + itemHight;

      return OverflowBox(
        maxWidth: width,
        minWidth: width,
        maxHeight: height,
        minHeight: height,
        child: GridView.builder(
          itemCount: itemCount,
          padding: EdgeInsets.only(
              top: itemHight / 2,
              bottom: itemCount.isOdd ? itemHight / 2 : itemHight),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspctRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing),
          itemBuilder: (context, index) {
            var transform = Transform.translate(
                offset:
                    Offset(0.0, index.isOdd ? itemHight * offsetPercent : 0.0),
                child: itemBuilder(context, index));
            return transform;
          },
        ),
      );
    });
  }
}
