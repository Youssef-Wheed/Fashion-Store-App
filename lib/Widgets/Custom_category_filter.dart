import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'Custom_text.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            CustomText(
              text: 'Sort by',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff131313),
            ),
            Gap(10),
            SvgPicture.asset('assets/svgs/select.svg'),
            Spacer(),
            SvgPicture.asset('assets/svgs/filter.svg'),
            Gap(10),
            CustomText(
              text: 'Filter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff131313),
            ),
            Gap(20),
            SvgPicture.asset('assets/svgs/grid.svg'),
            Gap(20),
            SvgPicture.asset('assets/svgs/groups.svg'),
          ],
        ),
      ),
    );
  }
}
