import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:flutter_task/utils/textform_input.dart';

import 'profile_image.dart';

class EdifProfileScreen extends StatefulWidget {
  const EdifProfileScreen({super.key});

  @override
  State<EdifProfileScreen> createState() => _EdifProfileScreenState();
}

class _EdifProfileScreenState extends State<EdifProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Edit Profile",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            const Center(
              child: ProfileImage(
                height: 130,
                width: 130,
                isProfile: true,
              ),
            ),
            const Space(30),
            TextFormInput(
                labelText: "Enter your Full name",
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value),
            const Space(20),
            TextFormInput(
                labelText: "Enter your username",
                controller: userName,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value),
            const Space(20),
            TextFormInput(
                labelText: "Enter your email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value),
            const Space(40),
            MainButton(onPressed: null, text: "Save Changes"),
          ],
        ),
      ),
    );
  }
}
