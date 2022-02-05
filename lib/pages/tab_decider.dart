import 'package:badu/pages/aduan_balikpapan/add_incident.dart';
import 'package:badu/pages/tabs/activity_screen.dart';
import 'package:badu/pages/tabs/home_screen.dart';
import 'package:badu/pages/tabs/notification_screen.dart';
import 'package:badu/pages/tabs/profile_screen.dart';
import 'package:badu/settings/color.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class TabDecider extends StatefulWidget {
  @override
  _TabDeciderState createState() => _TabDeciderState();
}

class _TabDeciderState extends State<TabDecider> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFEEEEEE),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: currentPage,
                      children: const [
                        HomeScreen(),
                        ActivityScreen(),
                        NotificationScreen(),
                        ProfileScreen(),
                      ],
                    ),
                  ),

                  //BOTTOM NAVBAR
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentPage = 0;
                            });
                          },
                          child: ItemNavbar(currentPage == 0 ? true : false,
                              icon: Icons.home, itemName: 'Home'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentPage = 1;
                            });
                          },
                          child: ItemNavbar(currentPage == 1 ? true : false,
                              icon: Icons.sticky_note_2_outlined,
                              itemName: 'Aktivitas'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentPage = 2;
                            });
                          },
                          child: ItemNavbar(currentPage == 2 ? true : false,
                              icon: Icons.notifications_none_outlined,
                              itemName: 'Notifikasi'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentPage = 3;
                            });
                          },
                          child: ItemNavbar(currentPage == 3 ? true : false,
                              icon: Icons.account_circle_outlined,
                              itemName: 'Profile'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 40,
                left: MediaQuery.of(context).size.width * 0.38,
                right: MediaQuery.of(context).size.width * 0.38,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TambahIncident(),
                      ),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white.withOpacity(0.8),
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  final active;
  final icon;
  final itemName;
  ItemNavbar(this.active, {this.icon, this.itemName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: active == true ? primaryColor : Colors.black,
          ),
          const SizedBox(height: 2),
          Text(
            itemName,
            style: TextStyle(
              color: active == true ? primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
