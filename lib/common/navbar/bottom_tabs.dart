import 'package:flutter/material.dart';
import 'package:web/featurs/planner/screen/planner_screen.dart';
import 'package:web/featurs/pricing/screen/pricing_screen.dart';
import 'package:web/featurs/brand%20template/screen/brand_template_screen.dart';
import 'package:web/featurs/carousel/screen/carousel_screen.dart';
import 'package:web/featurs/analytics/screen/analytics_screen.dart';

import '../../featurs/connection_screen/screen/connection_screen.dart';
import '../../featurs/home/screen/home_screen.dart';
import '../../featurs/profile/screen/profile_screen.dart';
import 'bottom_tab_item.dart';

final List<BottomTabItem> bottomTabs = [
  BottomTabItem(
    label: "Home",
    icon: const Icon(Icons.home_rounded),
    page: const HomeScreen(),
    isWebOnly: true,
  ),
  BottomTabItem(
    label: "Brand",
    icon: const Icon(Icons.auto_awesome_mosaic_rounded),
    page: const BrandTemplateScreen(),
    isWebOnly: true,
  ),
  BottomTabItem(
    label: "Carousel",
    icon: const Icon(Icons.view_carousel_rounded),
    page: const CarouselScreen(),
  ),
  BottomTabItem(
    label: "Connection",
    icon: const Icon(Icons.people_alt_rounded),
    page: const ConnectionScreen(),
  ),
  BottomTabItem(
    label: "Planner",
    icon: const Icon(Icons.calendar_month_rounded),
    page: const PlannerScreen(),
  ),
  BottomTabItem(
    label: "Analytics",
    icon: const Icon(Icons.analytics_rounded),
    page: const AnalyticsScreen(),
    isWebOnly: true,
  ),
  BottomTabItem(
    label: "Pricing",
    icon: const Icon(Icons.account_balance_wallet_rounded),
    page: const PricingScreen()
  ),
  BottomTabItem(
    label: "Profile",
    icon: const Icon(Icons.person_rounded),
    page: const ProfileScreen(),
  ),
];