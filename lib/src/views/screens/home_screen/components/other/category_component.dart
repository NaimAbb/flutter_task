import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/src/models/firebase_models/category.dart';

class CategoryComponent extends StatelessWidget {
  final Category? category;

  const CategoryComponent({Key? key, @required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          child: Icon(
            CupertinoIcons.bag_fill,
            color: Color(0xfff2cab7),
            size: 25.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color.fromRGBO(253, 231, 220, 1)),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          '${category!.name}',
          style: TextStyle(
              color: const Color.fromRGBO(188, 188, 188, 1),
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
        )
      ],
    );
  }
}
