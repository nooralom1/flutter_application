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
