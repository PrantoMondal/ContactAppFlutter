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

  Future<bool>addNewContact(ContactModel contactModel) async {
    final rowId = await DBHelper.insertContact(contactModel);
      if(rowId > 0){
        contactModel.id = rowId;
        contactList.add(contactModel);
        notifyListeners();
        return true;
    }
      return false;
  }
}