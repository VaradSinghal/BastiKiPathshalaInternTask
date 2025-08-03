class Volunteer {
  final String name;
  final String phone;
  final String city;

  Volunteer({
    required this.name,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'city': city,
      };
}