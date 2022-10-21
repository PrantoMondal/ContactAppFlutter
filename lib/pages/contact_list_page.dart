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
              return Dismissible(
                key: ValueKey(contact.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: _showConfirmationDialog,
                onDismissed: (direction){
                  provider.deleteContact(contact.id!);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
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
                      final value = contact.favourite ? 0 : 1;
                      provider.updateFavorite(contact.id!, value, index);
                    },
                  ),
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

  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Delete COntact'),
              content: const Text('Are you sure to delete this contact ?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('No')),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Yes'
                        '')),
              ],
            ));
  }
}
