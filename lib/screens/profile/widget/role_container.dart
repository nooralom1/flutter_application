// Stateless widget class for role container
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/profile/view/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleContainer extends StatelessWidget {
  final Role role;

  const RoleContainer({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.only(right: 12.sp),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 248, 249, 1),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role.title,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          const Divider(),
          Text(
            'Group',
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            role.group,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 12.sp),
          Text(
            'Manager',
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150.r),
                child: CachedNetworkImage(
                  placeholder: (context, url) => CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20.r,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20.r,
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/6858/6858504.png',
                  width: 30.h,
                  height: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                role.manager,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
