import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/profile/widget/info_row.dart';
import 'package:flutter_application/screens/profile/widget/role_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(228, 243, 254, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Image
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150.r),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20.r,
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                          errorWidget: (context, url, error) => CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20.r,
                            child: const Icon(Icons.error, color: Colors.white),
                          ),
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/6858/6858504.png',
                          width: 60.h,
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Name and Support Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jonaus Kahnwald',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(height: 4.sp),
                          Text(
                            'Support',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: const Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.sp),

            // Basic Info Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Basic info',
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoRow(label: 'First Name', value: 'Jonaus'),
                  SizedBox(height: 12.sp),
                  const InfoRow(label: 'Last Name', value: 'Kahnwald'),
                  SizedBox(height: 12.sp),
                  const InfoRow(label: 'Email', value: 'Username@email.com'),
                ],
              ),
            ),
            SizedBox(height: 24.sp),
            // Assigned Roles Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Assigned roles (${assignedRoles.length})',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.sp),

            // Horizontal ListView for Roles
            Padding(
              padding: EdgeInsets.only(left: 16.sp),
              child: SizedBox(
                height: 190.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: assignedRoles.length,
                  itemBuilder: (context, index) {
                    final role = assignedRoles[index];
                    return Column(
                      children: [
                        RoleContainer(role: role),
                      ],
                    );
                  },
                ),
              ),
            ),

            // Logout Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.sp,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(253, 220, 225, 1),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 20.sp, color: Colors.red),
                      SizedBox(width: 8.sp),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Role {
  final String title;
  final String group;
  final String manager;

  Role({
    required this.title,
    required this.group,
    required this.manager,
  });
}

final List<Role> assignedRoles = [
  Role(
    title: 'Manager',
    group: 'Codecayaneon support',
    manager: 'Jonaus Kahnwald',
  ),
  Role(
    title: 'Developer',
    group: 'Mobile Team',
    manager: 'Sarah Johnson',
  ),
  Role(
    title: 'Designer',
    group: 'UI/UX Team',
    manager: 'Mike Chen',
  ),
];
