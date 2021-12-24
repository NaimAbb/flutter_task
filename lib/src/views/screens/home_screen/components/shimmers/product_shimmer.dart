import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15.r),
          // color: Colors.grey[300]
        ),
      ),
      baseColor: (Colors.grey[200])!,
      highlightColor: (Colors.grey[400])!,
    );
  }
}
