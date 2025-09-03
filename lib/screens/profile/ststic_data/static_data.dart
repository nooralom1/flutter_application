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
