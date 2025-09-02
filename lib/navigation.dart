// ignore_for_file: unused_field, deprecated_member_use, unnecessary_string_interpolations
import 'dart:io';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/common_widget/custom_button.dart';
import 'package:flutter_application/screens/tickets/view/ticket_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class NavigationSCreen extends StatefulWidget {
  final int? pageNum;

  const NavigationSCreen({
    super.key,
    this.pageNum,
  });

  @override
  State<NavigationSCreen> createState() => _NavigationSCreenState();
}

class _NavigationSCreenState extends State<NavigationSCreen> {
  int _currentIndex = 0;

  final List _screens = [
    const TicketScreen(),
    const TicketScreen(),
    const TicketScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight + 35.h,
          child: CustomNavigationBar(
            iconSize: 24.r,
            strokeColor: Colors.blue,
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.confirmation_number),
                title: _currentIndex == 0
                    ? Text(
                        "${"Tickets"}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.sp,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10.w,
                        ),
                      )
                    : const SizedBox(),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.group_outlined),
                title: _currentIndex == 1
                    ? Text(
                        "${"Contacts"}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.sp,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10.w,
                        ),
                      )
                    : const SizedBox(),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                title: _currentIndex == 2
                    ? Text(
                        "${"Profile"}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.sp,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10.w,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

void showMaterialDialog(
  BuildContext context,
) {
  showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              "Do you want to exit the app?",
              textAlign: TextAlign.center,
              // style: TextFontStyle.headline14StyleMontserrat,
            ),
            actions: <Widget>[
              CustomButton(
                text: "No",
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                borderRadius: 30.r,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Yes",
                onTap: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                borderRadius: 30.r,
                borderColor: Colors.blue,
              ),
            ],
          ));
}
