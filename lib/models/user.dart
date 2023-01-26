class User {
  final String username;
  final String email;
  final String dateOfBirth;
  final String phoneNumber;
  final String language;

  User(
      {required this.username,
      required this.email,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.language});
}

List<User> users = [
  User(
      username: 'Jennie Kim',
      email: 'jennie123@gmail.com',
      dateOfBirth: '01 Januari 1990',
      phoneNumber: '08123456789',
      language: 'Indonesia'),
];
