// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurants_app/core/config/size_config.dart';

class CustmCircleImgeWithFlag extends StatelessWidget {
  final String imageUrl;
  final double borderRadius, circleRaides, width, height;
  const CustmCircleImgeWithFlag({
    super.key,
    required this.imageUrl,
    this.borderRadius = 150,
    this.circleRaides = 35,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circleRaides.r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: SvgPicture.asset(
          imageUrl,
          width: width.w,
          height: height.w,
        ),
      ),
    );
  }
}
