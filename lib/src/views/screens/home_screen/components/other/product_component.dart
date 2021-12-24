import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTML9jSTLkgQI8dlaY3BcQuiEL4V4ohcNwwShV9ob33UxsigBbA5Tl3l8CkPDkewml6CtQ&usqp=CAU')),
        borderRadius: BorderRadius.circular(15.r),
        // color: Colors.grey[300]
      ),
    );
  }
}
