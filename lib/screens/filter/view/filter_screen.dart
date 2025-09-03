import 'package:flutter/material.dart';
import 'package:flutter_application/provider/all_providers.dart';
import 'package:flutter_application/screens/filter/static_data/ststic_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProviders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 20.sp,
            )),
        title: Text(
          'Filters',
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Section
            Text(
              'Status',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Column(
              children: statusOptions.map((status) {
                return Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                      child: Checkbox(
                        value: selectedStatus[status],
                        onChanged: (value) {
                          setState(() {
                            selectedStatus[status] = value!;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        status,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),

            SizedBox(height: 16.h),

            // Priority Section
            Text(
              'Priority',
              style: TextStyle(fontSize: 16.sp),
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5.w, color: Colors.black),
                  borderRadius: BorderRadius.circular(4.r)),
              child: DropdownButton<String>(
                value: provider.selectedPriority,
                isExpanded: true,
                items: priorityOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    provider.selectedPriority = newValue!;
                  });
                },
              ),
            ),

            SizedBox(height: 16.h),

            // Tags Section
            Text(
              'Tags',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search tags',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 22.sp,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1)),
                onChanged: (value) {
                  setState(() {
                    provider.tagSearchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: 12.h),

            // Selected Tags (now filtered based on search)
            Wrap(
              spacing: 8.w,
              children: provider.filteredTags.asMap().entries.map((entry) {
                final index = entry.key;
                final tag = entry.value;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 80.w,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: provider.selectedIndex == index
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      color: provider.selectedIndex == index
                          ? Colors.blue.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (provider.selectedIndex == index)
                          Icon(
                            Icons.check,
                            size: 12.sp,
                          ),
                        SizedBox(width: 4.w),
                        Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
