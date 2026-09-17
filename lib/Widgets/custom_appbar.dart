import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.prefix,
    required this.suffix,
    this.onPrefixTap,
  });

  final String title;
  final String prefix;
  final String suffix;
  final VoidCallback? onPrefixTap;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      scrolledUnderElevation: 0.0,
      leading: const SizedBox.shrink(),
      leadingWidth: 0.0,
      title: Row(
        children: [
          GestureDetector(
            onTap: onPrefixTap ?? () => Navigator.pop(context),
            child: SvgPicture.asset(
              prefix,
              width: 24,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            suffix,
            width: 20,
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
