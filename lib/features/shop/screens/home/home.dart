import 'package:ecommerce_hptshop/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_hptshop/common/widgets/custom_shapes/curved_edges/curved_edge.dart';
import 'package:ecommerce_hptshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            HptPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  HptHomeAppBar(),

                  /// SearchBar

                  /// Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
