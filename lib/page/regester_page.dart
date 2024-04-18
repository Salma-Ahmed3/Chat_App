import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/page/chat_page.dart';
import 'package:chat_app/page/logain_pages.dart';
import 'package:chat_app/widgets/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegesterPage extends StatefulWidget {
  const RegesterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  String? email;

  String? password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Image.network(
                  kLogo,
                  height: 120,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomFormTextFaild(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomFormTextFaild(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      // Navigator.push(context, route);
                      isLoding = true;
                      setState(() {});
                      try {
                        await registerUser();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          ChatPage.id,
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          // ignore: use_build_context_synchronously
                          showSnakBar(context, 'Week Password');
                        } else if (ex.code == 'email-already-in-use') {
                          // ignore: use_build_context_synchronously
                          showSnakBar(context, 'Email Already Exists');
                        }
                      } catch (ex) {
                        // ignore: use_build_context_synchronously
                        showSnakBar(context, 'There Was An Error');
                      }
                      isLoding = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'REGISTER',
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          LoginPage.id,
                        );
                      },
                      child: const Text(
                        '  Login',
                        style: TextStyle(
                          color: Color(0xffC4E9E6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    // ignore: unused_local_variable
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
