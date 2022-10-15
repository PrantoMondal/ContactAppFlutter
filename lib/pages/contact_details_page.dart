import 'package:contactapp/model/contact_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../provider/contact_provider.dart';


class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({Key? key}) : super(key: key);
  static const String routeName = '/contact_details';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  int? id;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Details'),),
      body: Center(
        child: Consumer<ContactProvider>(
          builder:(context, provider, _) => FutureBuilder<ContactModel>(
            future: provider.getContactsById(id!),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView(
                  children: [

                  ],
                );
              }
              if(snapshot.hasError){
                return const Text('Failed to fetch data');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}