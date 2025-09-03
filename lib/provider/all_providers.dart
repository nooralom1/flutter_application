import 'package:flutter/material.dart';
import 'package:flutter_application/screens/contact/ststic_data/static_data.dart';
import 'package:flutter_application/screens/filter/static_data/ststic_data.dart';

final class AllProviders extends ChangeNotifier {
  ////////////----------- Filter Screen ---------------/////////////
  String selectedPriority = 'Select priority';
  int selectedIndex = -1;
  String tagSearchQuery = '';

  // Filtered tags based on search query
  List<String> get filteredTags {
    if (tagSearchQuery.isEmpty) {
      return selectedTags;
    }
    return selectedTags
        .where(
            (tag) => tag.toLowerCase().contains(tagSearchQuery.toLowerCase()))
        .toList();
  }

////////////----------- Contact Screen ---------------/////////////
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  List<Contact> get filteredContacts {
    if (searchQuery.isEmpty) {
      return contacts;
    }
    return contacts.where((contact) {
      return contact.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          contact.email.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
}
