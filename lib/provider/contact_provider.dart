import 'package:contactapp/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier{
  List<ContactModel> contactList = [];

  getAllContacts(){
    DBHelper.getAllContacts().then((value) {
      contactList = value;
      notifyListeners();
    });
  }
}