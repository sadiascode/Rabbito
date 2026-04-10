import 'package:flutter_svg/flutter_svg.dart';

import 'bottom_tab_item.dart';

final List<BottomTabItem> bottomTabs = [
  BottomTabItem(
    label: "Home",
    icon: SvgPicture.asset("assets/homes.svg"),
    page: HomeScreen(),
    isCenter: true,
  ),
  BottomTabItem(
    label: "Medicine",
    icon: SvgPicture.asset("assets/medicine.svg"),
    page: MedicineScreen(),
  ),
  BottomTabItem(
    label: "Doctor",
    icon: SvgPicture.asset("assets/doctor.svg"),
    page: DoctorScreen(),
  ),
  BottomTabItem(
    label: "Chat",
    icon: SvgPicture.asset("assets/chat.svg"),
    page: NotificationScreen(),
  ),
  BottomTabItem(
    label: "Profile",
    icon: SvgPicture.asset("assets/profile.svg"),
    page: ProfileScreen(),
  ),
];