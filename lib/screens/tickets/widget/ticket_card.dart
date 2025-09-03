import 'package:flutter/material.dart';
import 'package:flutter_application/screens/tickets/view/ticket_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 248, 249, 1),
          borderRadius: BorderRadius.circular(8.r)),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                  color: ticket.isOverdue
                      ? Colors.orange.withOpacity(0.1)
                      : ticket.status == 'Customer responded'
                          ? Colors.purple.withOpacity(0.1)
                          : Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Text(
                ticket.status.toUpperCase(),
                style: TextStyle(
                  color: ticket.isOverdue
                      ? Colors.orange
                      : ticket.status == 'Customer responded'
                          ? Colors.purple
                          : Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '#ID ${ticket.id}',
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              ticket.title,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  ticket.customer,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
                const Text(' • '),
                Text(
                  '${ticket.date.day} ${_getMonthName(ticket.date.month)} ${ticket.date.year} ${ticket.date.hour}:${ticket.date.minute.toString().padLeft(2, '0')} ${ticket.date.hour < 12 ? 'AM' : 'PM'}',
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Divider(color: Colors.grey, thickness: 0.5.h),
            SizedBox(height: 6.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 0.5.w, color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: ticket.priority == "Urgent"
                            ? Colors.red
                            : Colors.green,
                        size: 6.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        ticket.priority,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(width: 0.5.w, color: Colors.grey),
                  ),
                  child: Text(
                    ticket.state,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  Color _getStateColor(String state) {
    switch (state.toLowerCase()) {
      case 'open':
        return Colors.blue;
      case 'closed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
