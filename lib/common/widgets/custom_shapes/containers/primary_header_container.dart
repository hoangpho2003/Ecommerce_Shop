import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class HptPrimaryHeaderContainer extends StatelessWidget {
  const HptPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HptCurvedEdgeWidget(
      child: Container(
        color: HptColors.primary,
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: HptCircularContainer(backgroundColor: HptColors.textWhite.withOpacity(0.1))),
            Positioned(top: 100, right: -300, child: HptCircularContainer(backgroundColor: HptColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
