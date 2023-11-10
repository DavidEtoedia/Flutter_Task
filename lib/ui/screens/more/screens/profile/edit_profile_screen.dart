import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:flutter_task/utils/textform_input.dart';
import 'package:flutter_task/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'profile_image.dart';
import 'vm/edit_profile_state.dart';
import 'vm/edit_profile_vm.dart';

class EdifProfileScreen extends StatefulHookConsumerWidget {
  final String name;
  final String email;
  const EdifProfileScreen({super.key, this.name = "", this.email = ""});

  @override
  ConsumerState<EdifProfileScreen> createState() => _EdifProfileScreenState();
}

class _EdifProfileScreenState extends ConsumerState<EdifProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    email = TextEditingController(text: widget.email);
    name = TextEditingController(text: widget.name);
    super.initState();
  }

  handleReq() {
    if (email.text.isEmpty || name.text.isEmpty) return;
    ref
        .read(editProfileControllerProvider.notifier)
        .editProfile(name.text, email.text);
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    final edit = ref.watch(editProfileControllerProvider);
    ref.listen<UpdateState>(editProfileControllerProvider, ((previous, state) {
      if (state is UpdateStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      } else if (state is UpdateStateSuccess) {
        context.popToFirst();
      }
    }));

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Edit Profile",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: AbsorbPointer(
          absorbing: edit is UpdateStateLoading ? true : false,
          child: Form(
            key: _formKey,
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
                    controller: name,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateName(value)),
                const Space(20),
                TextFormInput(
                    labelText: "Enter your email",
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateEmail(value)),
                const Space(40),
                MainButton(
                    isLoading: edit is UpdateStateLoading ? true : false,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        handleReq();
                      }
                    },
                    text: "Save Changes"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
