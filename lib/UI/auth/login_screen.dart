
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoneappas1/UI/auth/posts/post_screen.dart';
import 'package:phoneappas1/UI/auth/sign_screen.dart';
import 'package:phoneappas1/utils/utils.dart';
import 'package:phoneappas1/widgets/round_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()).then((value){
          utils().toastMessage(value.user!.email.toString());
          Navigator.push(
              context as BuildContext,
              MaterialPageRoute(builder: (context) => Postscreen())
          );
          setState(() {
            loading = false;
          });
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      utils().toastMessage(error.toString());

    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            helperText: 'enter Email eg: john@gmail.com',
                            prefixIcon: Icon(Icons.alternate_email)
                        ),
                        validator:  (value){
                          if(value!.isEmpty){
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            helperText: 'enter password ',
                            prefixIcon: Icon(Icons.password_outlined)
                        ),
                        validator:  (value){
                          if(value!.isEmpty){
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),

                    ],
                  )
              ),
              const SizedBox(height: 30,),
              Roundbutton(
                title: 'Login',
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    login();
                  }
                },
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder:(context) => signupscreen())
                    );
                  },
                      child: Text('Sign up'),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
