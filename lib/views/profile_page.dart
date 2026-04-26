import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textile_mobile_app/providers/auth_provider.dart';
import 'package:textile_mobile_app/views/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _openEditProfile(
    BuildContext context,
    AuthProvider authProvider,
  ) async {
    final user = authProvider.user;
    if (user == null) return;
    final firstName = TextEditingController(text: user.firstName);
    final lastName = TextEditingController(text: user.lastName);
    final city = TextEditingController(text: user.city);
    final phone = TextEditingController(text: user.phone);
    final address = TextEditingController(text: user.address);
    final formKey = GlobalKey<FormState>();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: firstName,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lastName,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: city,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: address,
                maxLines: 2,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.updateUserProfile(
                    firstName: firstName.text.trim(),
                    lastName: lastName.text.trim(),
                    city: city.text.trim(),
                    phone: phone.text.trim(),
                    address: address.text.trim(),
                  );
                  if (context.mounted) Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          final user = authProvider.user;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151515),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF2F2F2F)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.fullName.isNotEmpty == true
                            ? user!.fullName
                            : 'Guest User',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user?.email.isNotEmpty == true
                            ? user!.email
                            : 'Please login to continue',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      if (user != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'City: ${user.city}  Phone: ${user.phone}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (user.address.isNotEmpty)
                          Text(
                            'Address: ${user.address}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (!authProvider.isLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text('Login / Register'),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            _openEditProfile(context, authProvider),
                        child: const Text('Edit Personal Details'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => authProvider.logout(),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
