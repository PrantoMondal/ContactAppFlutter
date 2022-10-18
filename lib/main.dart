import 'package:contactapp/pages/contact_details_page.dart';
import 'package:contactapp/pages/contact_list_page.dart';
import 'package:contactapp/pages/new_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/contact_provider.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => ContactProvider() .. getAllContacts()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ContactListPage.routeName ,
      routes:{
        ContactListPage.routeName : (context) => ContactListPage(),
        NewContactPage.routeName : (context) => NewContactPage(),
        ContactDetailsPage.routeName : (context) => ContactDetailsPage(),
      },
    );
  }
}


