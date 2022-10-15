import 'package:contactapp/pages/contact_details_page.dart';
import 'package:contactapp/pages/new_contact_page.dart';
import 'package:contactapp/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemCount: provider.contactList.length,
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return ListTile(
                onTap: () => Navigator.pushNamed(
                    context, ContactDetailsPage.routeName,
                    arguments: contact.id),
                title: Text(contact.name),
                subtitle: Text(contact.number),
                trailing: IconButton(
                  icon: Icon(contact.favourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {

                  },
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewContactPage.routeName);
        },
        tooltip: 'Add New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
