import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HptSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Pho Khong em', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: HptSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: HptSizes.spaceBtwItems),
            Text('0922815775', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: HptSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: HptSizes.spaceBtwItems),
            Expanded(child: Text('65 Nguyen Minh Chau, Hoa Hai, Ngu Hanh Son, Da Nang', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}
