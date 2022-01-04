class Person {

  final int id;

  final String firstName;

  final String lastName;

  final String dob;

  final String email;

  final String pic;


  Person(this.id,
      this.firstName,
      this.lastName,
      this.dob,
      this.email,
      this.pic);


  Map<String, dynamic> toMap() {
    return {

      "firstName": firstName,
      "lastName": lastName,
      "dob": dob,
      "email": email,
      "pic": pic
    };
  }

}