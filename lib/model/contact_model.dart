class ContactModel {
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? dob;
  String? gender;
  String? image;
  bool isFavourite;

  ContactModel(
      {this.id,
      required this.name,
      required this.number,
      this.email,
      this.address,
      this.dob,
      this.gender,
      this.image,
      this.isFavourite = false});

  @override
  String toString() {
    return 'ContactModel{id: $id,'
        ' name: $name,'
        ' number: $number,'
        ' email: $email,'
        ' address: $address,'
        ' dob: $dob,'
        ' gender: $gender,'
        ' image: $image,'
        ' isFavourite: $isFavourite}';
  }
/*  String? company;
  String? designation;
  String? website;*/
/*  ContactModel({
    this.id,
    required this.name,
    required this.number,
    this.email,
    this.address,
    // this.company,
    // this.designation,
    // this.website,
    this.isFavourite = false,
  });

  @override
  String toString() {
    return 'ContactModel{id: $id,'
        ' name: $name,'
        ' number: $number,'
        ' email: $email,'
        ' address: $address,'
        ' company: $company,'
        ' designation: $designation,'
        ' website: $website, '
        'isFavourite: $isFavourite'
        '}';
  }*/

}
