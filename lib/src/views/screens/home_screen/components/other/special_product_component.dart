import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/src/models/firebase_models/product.dart';

class SpecialProductComponent extends StatelessWidget {
  final Product? product;
  const SpecialProductComponent({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage('${product!.image}'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${product!.name}',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            '${product!.numberBrands} Brands',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          )
        ],
      ),
    );
  }
}
