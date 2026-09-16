import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.prefix,
    required this.suffix,
  });

  final String title;
  final String prefix;
  final String suffix;

  @override
  //TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0.0,
      title: Row(
        children: [
          SvgPicture.asset(prefix,width: 24,),
          Spacer(),
          Text(title,style: GoogleFonts.inter(textStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          )),),
          Spacer(),
          SvgPicture.asset(suffix,width: 20,)
        ],
      ),

      centerTitle: true,

      backgroundColor: Colors.white,
    );
  }
}
