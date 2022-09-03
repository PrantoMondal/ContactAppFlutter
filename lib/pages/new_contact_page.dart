import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);
  static const String routeName = '/new_contact';

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name :',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                if(value.length>20){
                  return 'Name must be in 20 character';
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
