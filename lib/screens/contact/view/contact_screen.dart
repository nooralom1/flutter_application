import 'package:flutter/material.dart';
import 'package:flutter_application/screens/contact/wisget/contact_caed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Contact> get filteredContacts {
    if (_searchQuery.isEmpty) {
      return contacts;
    }
    return contacts.where((contact) {
      return contact.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          contact.email.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'M360ICT',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: 'Search contacts',
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
                      fillColor: Colors.grey.withOpacity(0.15)),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(
                    '${filteredContacts.length} Contacts',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = filteredContacts[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ContactCard(contact: contact),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phone;
  final String address;
  final int ticketCount;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.ticketCount = 0,
  });
}

final List<Contact> contacts = [
  Contact(
    name: 'Michale Kahnwald',
    email: 'michel@email.com',
    phone: '+12 34 56 78 90',
    address: '12A, Lillistrom, Norway',
    ticketCount: 7,
  ),
  Contact(
    name: 'Noah',
    email: 'michel@email.com',
    phone: '+12 34 56 78 90',
    address: '12A, Lillistrom, Norway',
    ticketCount: 5,
  ),
  Contact(
    name: 'Jonus Kajhnw',
    email: 'michel@email.com',
    phone: '+12 34 56 78 90',
    address: '12A, Lillistrom, Norway',
    ticketCount: 3,
  ),
  Contact(
    name: 'Ines',
    email: 'michel@email.com',
    phone: '+12 34 56 78 90',
    address: '',
    ticketCount: 1,
  ),
];
