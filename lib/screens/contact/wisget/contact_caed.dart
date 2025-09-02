import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/contact/view/contact_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactCard extends StatefulWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name and Ticket Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        width: 40.h,
                        height: 40.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      widget.contact.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.grey),
                  offset: const Offset(0, 40),
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'view_tickets',
                      child: Text('View tickets'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        break;
                      case 'view_tickets':
                        break;
                      case 'delete':
                        break;
                    }
                  },
                )
              ],
            ),

            const SizedBox(height: 12),

            // Email
            Row(
              children: [
                const Icon(Icons.email, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.contact.email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Phone
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.contact.phone,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            if (widget.contact.address.isNotEmpty) ...[
              const SizedBox(height: 8),

              // Address
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.contact.address,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
