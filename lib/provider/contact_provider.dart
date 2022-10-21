import 'package:contactapp/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  getAllContacts() {
    DBHelper.getAllContacts().then((value) {
      contactList = value;
      notifyListeners();
    });
  }
  getAllFavoriteContacts() {
    DBHelper.getAllFavoriteContacts().then((value) {
      contactList = value;
      notifyListeners();
    });
  }

  void loadContent(int index) {
    switch(index){
      case 0:
        getAllContacts();
        break;
      case 1:
        getAllFavoriteContacts();
        break;
    }
  }

  Future<ContactModel> getContactById(int id) => DBHelper.getContactById(id);

  Future<bool> addNewContact(ContactModel contactModel) async {
    final rowId = await DBHelper.insertContact(contactModel);
    if (rowId > 0) {
      contactModel.id = rowId;
      contactList.add(contactModel);
      notifyListeners();
      return true;
    }
    return false;
  }

  updateFavorite(int id, int value, int index) {
    DBHelper.updateFavorite(id, value).then((_) {
      contactList[index].favourite = !contactList[index].favourite;
      notifyListeners();
    });
  }
  deleteContact(int id) async{
    final rowId = await DBHelper.deleteContact(id);
    if(rowId > 0){
      contactList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
