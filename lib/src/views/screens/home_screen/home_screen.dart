import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/src/views/screens/home_screen/components/other/product_component.dart';
import 'package:flutter_task/src/views/screens/home_screen/components/shimmers/category_shimmer.dart';
import 'package:flutter_task/src/views/screens/home_screen/components/shimmers/product_shimmer.dart';
import 'package:flutter_task/src/views/screens/home_screen/home_screen_notifier.dart';
import 'package:provider/provider.dart';

import 'components/other/category_component.dart';
import 'components/other/special_product_component.dart';
import 'components/shimmers/special_product_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenNotifier>(
      create: (_) => HomeScreenNotifier(),
      child: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeScreenNotifier _homeScreenNotifier =
      Provider.of<HomeScreenNotifier>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: DelayedDisplay(
              delay: Duration(milliseconds: 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search product',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
              ),
            ),
            actions: [
              DelayedDisplay(
                delay: Duration(milliseconds: 300),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.grey,
                    size: 18.h,
                  ),
                  radius: 20.r,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 600),
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            CupertinoIcons.bell_solid,
                            color: Colors.grey,
                            size: 18.h,
                          ),
                          backgroundColor: Colors.grey[100],
                          radius: 20.r,
                        ),
                        PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: CircleAvatar(
                            radius: 6.5.r,
                            backgroundColor: Colors.red,
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 8.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 15.h,
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 900),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xff51428d),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A Summer Surpise',
                        style:
                            TextStyle(color: Colors.white70, fontSize: 11.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Cashback 20%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 80.h,
                  width: double.infinity,
                  child: Selector<HomeScreenNotifier, bool>(
                    selector: (_, value) => value.isLoadingProducts,
                    builder: (_, isLoadingCategories, __) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      itemBuilder: (_, index) => isLoadingCategories
                          ? const CategoryShimmer()
                          : DelayedDisplay(
                              delay: Duration(milliseconds: (index * 2) * 100),
                              child: CategoryComponent(
                                category: _homeScreenNotifier.categories[index],
                              ),
                            ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                      itemCount: isLoadingCategories
                          ? 10
                          : _homeScreenNotifier.categories.length,
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Text(
                      'Special for you',
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.7),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 90.h,
                  width: double.infinity,
                  child: Selector<HomeScreenNotifier, bool>(
                    selector: (_, value) => value.isLoadingSpecialProduct,
                    builder: (_, isLoadingSpecialProduct, __) =>
                        ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      itemBuilder: (_, index) => isLoadingSpecialProduct
                          ? const SpecialProductShimmer()
                          : DelayedDisplay(
                              delay: Duration(milliseconds: index * 200),
                              child: SpecialProductComponent(
                                product: _homeScreenNotifier.products[index],
                              ),
                            ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                      itemCount: isLoadingSpecialProduct
                          ? 10
                          : _homeScreenNotifier.products.length,
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Text(
                      'Popular Product',
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.7),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 110.h,
                width: double.infinity,
                child: Selector<HomeScreenNotifier, bool>(
                  selector: (_, value) => value.isLoadingSpecialProduct,
                  builder: (_, isLoadingSpecialProduct, __) =>
                      ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    itemBuilder: (_, index) => isLoadingSpecialProduct
                        ? const ProductShimmer()
                        : DelayedDisplay(
                            delay: Duration(milliseconds: index * 200),
                            child: const ProductComponent()),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 57.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(6, 0), blurRadius: 10)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: const Color.fromRGBO(233, 193, 173, 1),
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        size: 20.h,
                      ),
                      title: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          CircleAvatar(
                            radius: 2.r,
                            backgroundColor:
                                const Color.fromRGBO(233, 193, 173, 1),
                          ),
                        ],
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: 20.h,
                      ),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chat_bubble_text,
                        size: 20.h,
                      ),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 20.h,
                      ),
                      title: Text('')),
                ],
              ),
            ),
          ),
        ));
  }
}
