import 'package:flutter/material.dart';

import '../../../common/model/current_auth_model.dart';

class PersonalInfo extends StatelessWidget {
  final CurrentAuthModel user;

  const PersonalInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Personal Information"),
            _buildInfoTile("Name", "${user.firstName} ${user.lastName}"),
            _buildInfoTile("Username", user.username),
            _buildInfoTile("Email", user.email),
            _buildInfoTile("Phone", user.phone),
            _buildInfoTile("Gender", user.gender),
            _buildInfoTile("Age", "${user.age}"),
            _buildInfoTile("Birth Date", user.birthDate),
            const SizedBox(height: 16),
            _buildSectionTitle("Address"),
            _buildInfoTile("Address", user.address?.address ?? "N/A"),
            _buildInfoTile("City", user.address?.city ?? "N/A"),
            _buildInfoTile("State", user.address?.state ?? "N/A"),
            _buildInfoTile("Postal Code", user.address?.postalCode ?? "N/A"),
            _buildInfoTile("Country", user.address?.country ?? "N/A"),
            const SizedBox(height: 16),
            _buildSectionTitle("Company"),
            _buildInfoTile("Company Name", user.company?.name ?? "N/A"),
            _buildInfoTile("Department", user.company?.department ?? "N/A"),
            _buildInfoTile("Title", user.company?.title ?? "N/A"),
            const SizedBox(height: 16),
            _buildSectionTitle("Bank"),
            _buildInfoTile("Card Type", user.bank?.cardType ?? "N/A"),
            _buildInfoTile("Card Number", user.bank?.cardNumber ?? "N/A"),
            _buildInfoTile("Currency", user.bank?.currency ?? "N/A"),
            _buildInfoTile("IBAN", user.bank?.iban ?? "N/A"),
            const SizedBox(height: 16),
            _buildSectionTitle("Appearance"),
            _buildInfoTile("Eye Color", user.eyeColor),
            _buildInfoTile("Hair Type", user.hair?.type ?? "N/A"),
            _buildInfoTile("Hair Color", user.hair?.color ?? "N/A"),
            _buildInfoTile("Height", "${user.height} cm"),
            _buildInfoTile("Weight", "${user.weight} kg"),
            const SizedBox(height: 16),
            _buildSectionTitle("Other"),
            _buildInfoTile("Blood Group", user.bloodGroup),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(value, style: const TextStyle(color: Colors.black87)),
    );
  }
}
