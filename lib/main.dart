import 'package:flutter/material.dart';

import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DesignForm(),
    );
  }
}

class DesignForm extends StatefulWidget {
  const DesignForm({Key? key}) : super(key: key);

  @override
  State<DesignForm> createState() => _DesignFormState();
}

final _formKey = GlobalKey<FormState>();
final controller1 = TextEditingController();
final controller2 = TextEditingController();
final controller3 = TextEditingController();
final controller4 = TextEditingController();
final controller5 = TextEditingController();

String name = '';
String address = '';
String email = '';
String password = '';
String phone = '';

class _DesignFormState extends State<DesignForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Application Form :'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller1,
                      decoration: const InputDecoration(
                        labelText: 'Name :',
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Name !';
                        } else {
                          ('');
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller2,
                      decoration: const InputDecoration(
                        labelText: 'Address :',
                        prefixIcon: Icon(Icons.streetview),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      onFieldSubmitted: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Address !';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller3,
                      decoration: const InputDecoration(
                        labelText: 'Phone No.:',
                        prefixIcon: Icon(Icons.phone_android_rounded),
                      ),
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required phone no. !';
                        }
                        if (!RegExp(r"^(?=.*[0-9]).{10,}$").hasMatch(value)) {
                          return 'Phone number must be min 10 digits';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller4,
                      decoration: const InputDecoration(
                        labelText: 'email-id :',
                        prefixIcon: Icon(Icons.mail),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty && !value.contains('@')) {
                          return 'Invalid email-id !';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller5,
                      decoration: const InputDecoration(
                        labelText: 'Password :',
                        prefixIcon: Icon(Icons.key_off_rounded),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty && value.length < 7) {
                          return 'Invalid password !';
                        }
                        if (RegExp(
                                r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                            .hasMatch(password)) {
                          return 'Check your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    name: controller1.text,
                                    address: controller2.text,
                                    phone: controller3.text,
                                    email: controller4.text,
                                    password: controller5.text,
                                  )),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
