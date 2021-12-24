import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SpecialProductShimmer extends StatelessWidget {
  const SpecialProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: 230.w,
        height: 90.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), color: Colors.grey),
      ),
      baseColor: (Colors.grey[200])!,
      highlightColor: (Colors.grey[400])!,
    );
  }
}
