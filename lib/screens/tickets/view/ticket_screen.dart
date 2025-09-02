import 'package:flutter/material.dart';
import 'package:flutter_application/screens/filter/view/filter_screen.dart';
import 'package:flutter_application/screens/tickets/widget/ticket_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   'M360ICT',
        //   style: TextStyle(color: Colors.black),
        // ),
        // centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.notifications_outlined),
                Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${tickets.length} Tickets',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterScreen()));
                        },
                        child: const Icon(Icons.filter_list)),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return TicketCard(ticket: tickets[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ticket {
  final String id;
  final String title;
  final String status;
  final String customer;
  final DateTime date;
  final String priority;
  final String state;
  final bool isSpam;
  final bool isOverdue;

  Ticket({
    required this.id,
    required this.title,
    required this.status,
    required this.customer,
    required this.date,
    required this.priority,
    required this.state,
    this.isSpam = false,
    this.isOverdue = false,
  });
}

List<Ticket> tickets = [
  Ticket(
    id: '132198423',
    title:
        'Search view, which can display dynamic suggestions, is the focused state of search bar.',
    status: 'New',
    customer: 'Michale',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Low',
    state: 'Open',
  ),
  Ticket(
    id: '132198424',
    title: 'Ticket subject small',
    status: 'First response overdue',
    customer: 'Noah',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Urgent',
    state: 'Open',
    isOverdue: true,
    isSpam: true,
  ),
  Ticket(
    id: '132198423',
    title:
        'Search view, which can display dynamic suggestions, is the focused state of search bar.',
    status: 'New',
    customer: 'Michale',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Low',
    state: 'Open',
  ),
  Ticket(
    id: '132198424',
    title: 'Ticket subject small',
    status: 'First response overdue',
    customer: 'Noah',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Urgent',
    state: 'Open',
    isOverdue: true,
    isSpam: true,
  ),
  Ticket(
    id: '132198425',
    title:
        'Search view, which can display dynamic suggestions, is the focused state of search bar.',
    status: 'Customer responded',
    customer: 'Jonus',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Low',
    state: 'Open',
  ),
  Ticket(
    id: '132198424',
    title: 'Ticket subject small',
    status: 'First response overdue',
    customer: 'Noah',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Urgent',
    state: 'Open',
    isOverdue: true,
    isSpam: true,
  ),
  Ticket(
    id: '132198425',
    title:
        'Search view, which can display dynamic suggestions, is the focused state of search bar.',
    status: 'Customer responded',
    customer: 'Jonus',
    date: DateTime(2023, 12, 23, 15, 43),
    priority: 'Low',
    state: 'Open',
  ),
];
