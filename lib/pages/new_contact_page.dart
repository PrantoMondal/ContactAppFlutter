import 'dart:io';

import 'package:contactapp/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  String? _dob;
  String? _genderGroupValue;
  String? _imagePath;

  ImageSource _imageSource = ImageSource.camera;

  final form_key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();

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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email :',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address :',
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: _selectDate,
                      child: Text('Select Date of Birth')),
                  Text(_dob == null ? 'No Date Chosen' : _dob!),
                ],
              ),
            ), //date of birth
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select Gender'),
                  Radio<String>(
                      value: 'Male',
                      groupValue: _genderGroupValue,
                      onChanged: (value) {
                        setState(() {
                          _genderGroupValue = value;
                        });
                      }),
                  Text('Male'),
                  Radio<String>(
                      value: 'Female',
                      groupValue: _genderGroupValue,
                      onChanged: (value) {
                        setState(() {
                          _genderGroupValue = value;
                        });
                      }),
                  Text('Female'),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: _imagePath == null
                  ? Image.asset(
                      'images/images.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    )
                  : Image.file(
                      File(_imagePath!),
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _imageSource = ImageSource.camera;
                      _getImage();
                    },
                    child: const Text('Camera')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _imageSource = ImageSource.gallery;
                      _getImage();
                    },
                    child: const Text('Gallery')),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _saveContact() {
    if (form_key.currentState!.validate()) {
      final contact = ContactModel(
        name: nameController.text,
        number: mobileController.text,
        email: emailController.text,
        address: addressController.text,
      );

      print(contact.toString());
    }
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if(selectedDate!=null){
      setState((){
        _dob=DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void _getImage() {

  }
}
