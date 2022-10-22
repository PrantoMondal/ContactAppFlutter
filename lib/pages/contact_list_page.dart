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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Consumer<ContactProvider>(
          builder:(context, provider, _) =>  BottomNavigationBar(
            currentIndex: selectedIndex,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            onTap: (value) {
              provider.loadContent(selectedIndex);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'All'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite'
              ),
            ],
          ),
        ),
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
                onDismissed: (direction) {
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
                    icon: Icon(contact.favorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      final value = contact.favorite ? 0 : 1;
                      provider.updateFavorite(contact.id!, value, index);
                    },
                  ),
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
