import 'package:contactapp/db/db_helper.dart';
import 'package:contactapp/pages/new_contact_page.dart';
import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<ContactModel> contactList = [];
  @override
  void initState() {
    DBHelper.getAllContacts().then((value){
      setState((){
        contactList = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index){
          final contact = contactList[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.number),
            trailing: IconButton(
              icon: Icon(contact.favourite? Icons.favorite : Icons.favorite_border),
              onPressed: () {

            },
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NewContactPage.routeName).then((value) {
            if(value != null){
              final contact = value as ContactModel;
              setState((){
                contactList.add(contact);
              });
            }
          });
        },
        tooltip: 'Add New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
