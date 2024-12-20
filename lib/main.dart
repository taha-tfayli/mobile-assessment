import 'package:flutter/material.dart';
import 'service_provider.dart';

void main() {
  runApp(ServiceFinderApp());
}

class ServiceFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedType = "Any"; // Individual, Company, or Any
  String? selectedProfession;
  String? selectedProviderName;

  @override
  Widget build(BuildContext context) {
    // Filter providers based on selections
    List<ServiceProvider> filteredProviders = providers.where((provider) {
      if (selectedType != "Any") {
        if (selectedType == "Individual" && !provider.isIndividual) return false;
        if (selectedType == "Company" && provider.isIndividual) return false;
      }
      if (selectedProfession != null &&
          provider.profession != selectedProfession) return false;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Service Finder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Type:"),
            Row(
              children: [
                Radio(
                  value: "Individual",
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                Text("Individual"),
                Radio(
                  value: "Company",
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                Text("Company"),
                Radio(
                  value: "Any",
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                Text("Any"),
              ],
            ),
            SizedBox(height: 10),
            Text("Select Profession:"),
            DropdownButton<String>(
              value: selectedProfession,
              onChanged: (value) {
                setState(() {
                  selectedProfession = value;
                });
              },
              items: ["Plumber", "Electrician", "Carpenter"]
                  .map((profession) => DropdownMenuItem(
                        value: profession,
                        child: Text(profession),
                      ))
                  .toList(),
              hint: Text("Choose a profession"),
            ),
            SizedBox(height: 10),
            Text("Select Provider:"),
            DropdownButton<String>(
              value: selectedProviderName,
              onChanged: (value) {
                setState(() {
                  selectedProviderName = value;
                });
              },
              items: filteredProviders
                  .map((provider) => DropdownMenuItem(
                        value: provider.name,
                        child: Text(provider.name),
                      ))
                  .toList(),
              hint: Text("Choose a provider"),
            ),
            SizedBox(height: 10),
            if (selectedProviderName != null)
              Text(
                filteredProviders
                    .firstWhere((provider) => provider.name == selectedProviderName)
                    .toString(),
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
