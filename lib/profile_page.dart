import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(
      {Key? key,
      required this.name,
      required this.address,
      required this.phone,
      required this.email,
      required this.password})
      : super(key: key);
  final String name;
  final String address;
  final String phone;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name '),
      ),
      body: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [Text('Name :'), Text(name)],
          ),
          TableRow(
            children: [Text('Addresss :'), Text(address)],
          ),
          TableRow(
            children: [Text('Phone :'), Text(phone)],
          ),
          TableRow(
            children: [Text('email:'), Text(email)],
          ),
          TableRow(
            children: [Text('Password :'), Text(password)],
          ),
        ],
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Text(name),
      //     Text(address),
      //     Text(phone),
      //     Text(email),
      //     Text(password),
      //     const SizedBox(
      //       height: 50,
      //     ),
      //     Center(
      //       child:
      //           ElevatedButton(onPressed: () {}, child: const Text('Go Back')),
      //     ),
      //   ],
      // ),
    );
  }
}
