import '../widgets/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/categories_widget.dart';
import '../widgets/popular_item_widget.dart';
import 'package:badges/badges.dart' as badges;
import '../widgets/bottom_cart_sheet_widget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Thanh tiêu đề
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A368),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 2,
                          )
                        ],
                      ),
                      child: badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Colors.red,
                          padding: EdgeInsets.all(5),
                        ),
                        badgeContent: const Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showSlidingBottomSheet(
                              context,
                              builder: (context) {
                                return SlidingSheetDialog(
                                  elevation: 8,
                                  cornerRadius: 16,
                                  builder: (context, state) {
                                    return const BottomCartSheet();
                                  },
                                );
                              },
                            );
                          },
                          child: const Icon(
                            CupertinoIcons.cart,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Chào mừng
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chào mừng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Bạn muốn mua gì?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              // Thanh tìm kiếm
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.all(15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Expanded(
                      child: Container(
                        width: 250,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Tìm kiếm ...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.filter_list),
                  ],
                ),
              ),

              // Sản phẩm
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  children: [
                    CategoriesWidget(),
                    PopularItemWidget(),
                    ItemsWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
