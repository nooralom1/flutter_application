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
