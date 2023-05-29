import 'bottom_cart_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "\$120",
              style: TextStyle(
                color: Color(0xFF00A368),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A368),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Thêm vào giỏ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
