import 'package:flutter_svg/flutter_svg.dart';
import 'package:web/featurs/planner/screen/planner_screen.dart';
import 'package:web/featurs/pricing/screen/pricing_screen.dart';

import '../../featurs/connection_screen/screen/connection_screen.dart';
import '../../featurs/home/screen/home_screen.dart';
import '../../featurs/profile/screen/profile_screen.dart';
import 'bottom_tab_item.dart';

final List<BottomTabItem> bottomTabs = [
  BottomTabItem(
    label: "Home",
    icon: SvgPicture.asset("assets/chat.svg"),
    page: HomeScreen(),
    isCenter: true,
  ),
  BottomTabItem(
    label: "Connection",
    icon: SvgPicture.asset("assets/chat.svg"),
    page: ConnectionScreen(),
  ),
  BottomTabItem(
    label: "Planner",
    icon:SvgPicture.asset("assets/chat.svg"),
    page: PlannerScreen(),
  ),
  BottomTabItem(
    label: "Pricing",
    icon: SvgPicture.asset("assets/chat.svg"),
    page: PricingScreen()
),
  BottomTabItem(
    label: "Profile",
    icon: SvgPicture.asset("assets/profile.svg"),
    page: ProfileScreen(),
  ),
];