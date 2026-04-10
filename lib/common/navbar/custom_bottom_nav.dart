import 'package:flutter/material.dart';
import '../custom_color.dart';
import 'bottom_tab_item.dart';

class CustomBottomNav extends StatelessWidget {
  final List<BottomTabItem> tabs;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (i) {
          return _navItem(i);
        }),
      ),
    );
  }

  Widget _navItem(int index) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isActive ? 60 : 45,
            height: isActive ? 50 : 45,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              boxShadow: isActive
                  ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
                  : [],
            ),
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.white : Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
                child: tabs[index].icon,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tabs[index].label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColors.primary : Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}