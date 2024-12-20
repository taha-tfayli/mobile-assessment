class ServiceProvider {
  String name;
  String profession;
  String description;
  String phone;
  bool isIndividual;

  ServiceProvider({
    required this.name,
    required this.profession,
    required this.description,
    required this.phone,
    required this.isIndividual,
  });

  @override
  String toString() {
    return 'Name: $name\nProfession: $profession\nPhone: $phone\nDescription: $description';
  }
}

// Sample list of providers
List<ServiceProvider> providers = [
  ServiceProvider(
      name: "John Doe",
      profession: "Plumber",
      description: "Expert in fixing leaks and installing pipes.",
      phone: "123456789",
      isIndividual: true),
  ServiceProvider(
      name: "FixIt Co.",
      profession: "Electrician",
      description: "Top-notch electrical services.",
      phone: "987654321",
      isIndividual: false),
  ServiceProvider(
      name: "Carpenter Jack",
      profession: "Carpenter",
      description: "Experienced in furniture crafting.",
      phone: "555666777",
      isIndividual: true),
];
