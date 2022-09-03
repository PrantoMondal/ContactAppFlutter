import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);
  static const String routeName = '/new_contact';

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final websiteController = TextEditingController();

  final form_key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    companyController.dispose();
    designationController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
        actions: [
          IconButton(onPressed: _saveContact, icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: form_key,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name :',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                if (value.length > 20) {
                  return 'Name must be in 20 character';
                }
              },
            ),
            TextFormField(
              controller: mobileController,
              decoration: const InputDecoration(
                labelText: 'Mobile :',
                prefixIcon: Icon(Icons.call),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                if (value.length > 20) {
                  return 'Number must be in 11 character';
                }
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email :',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address :',
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            TextFormField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: 'Company :',
                prefixIcon: Icon(Icons.home_work),
              ),
            ),
            TextFormField(
              controller: designationController,
              decoration: const InputDecoration(
                labelText: 'Designation :',
                prefixIcon: Icon(Icons.work),
              ),
            ),
            TextFormField(
                controller: websiteController,
                decoration: const InputDecoration(
                  labelText: 'Website :',
                  prefixIcon: Icon(Icons.web),
                )),
          ],
        ),
      ),
    );
  }

  void _saveContact() {

  }
}
