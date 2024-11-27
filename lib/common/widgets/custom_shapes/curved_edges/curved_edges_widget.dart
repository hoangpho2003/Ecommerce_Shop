import 'package:flutter/material.dart';

import 'curved_edge.dart';

class HptCurvedEdgeWidget extends StatelessWidget {
  const HptCurvedEdgeWidget({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HptCustomCurvedEdges(),
      child: child,
    );
  }
}
