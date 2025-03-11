import 'package:ecommerce_hptshop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_hptshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class HptChoiceChip extends StatelessWidget {
  const HptChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HptHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent) ,
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? HptColors.white : null),
        avatar: isColor
            ? HptCircularContainer(width: 50, height: 50, backgroundColor: HptHelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0): null, // Make icon in the center
        padding: isColor ? const EdgeInsets.all(0): null,
        shape: isColor ? const CircleBorder(): null,
        backgroundColor: isColor ? HptHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
