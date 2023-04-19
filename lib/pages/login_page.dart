import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/components/my_button.dart';
import 'package:google_auth/components/my_textfield.dart';
import 'package:google_auth/components/square_tile.dart';
import 'package:google_auth/services/auth_services.dart';
import 'package:google_auth/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool hidePasswordEmailAuth = true;

  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async{
    showDialog(context: context, builder: (context) {
        return const Center(child: CircularProgressIndicator(),);
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text);
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please use the correct username/password or login with Google or Apple id.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children:[
             Positioned(
              right: 20,
               child: InkWell(
                onTap: () { toggleThemeFunction!(); },
                child: const Icon(Icons.dark_mode)),
             ),
             Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
              
                    // logo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset("lib/images/appstore.png", height: 100, width: 100)),
              
                    const SizedBox(height: 25),
                    const Text ("p:Navigator" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10),
                    // welcome back, you've been missed!
                    const Text(
                      'Your Personal Guide to\nSelf-Discovery & Growth',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  
                    const SizedBox(height: 24),
          
                            
                    if (!hidePasswordEmailAuth) Column(children: [
                 
              
                   
              
                    // username textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
              
                    const SizedBox(height: 10),
              
                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
              
                    const SizedBox(height: 10),
              
                  
              
                    const SizedBox(height: 25),
              
                    // sign in button
                    MyButton(
                      onTap: signUserIn,
                    ),
                    const SizedBox(height: 50),
                    ],),
                  
                     // or continue with
                    
              
                    
              
                   
              
                    
               Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
          
                     const SizedBox(height: 24),
                    
              
                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        GestureDetector(
                          child: const SquareTile(imagePath: 'lib/images/google.png'),
                          onTap: () {
                            AuthService().signInWithGoogle();
                          },
                        ),
              
                        const SizedBox(width: 25),
              
                        // apple button
                        const SquareTile(imagePath: 'lib/images/apple.png')
                      ],
                    ),
              
                    const SizedBox(height: 24),
          
                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Register Later?',
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Skip now',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(height: 20,),
                    if(hidePasswordEmailAuth) 
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hidePasswordEmailAuth = !hidePasswordEmailAuth;
                        });
                      },
                      child: const Text("Login with Email/Pass")
                    ),
                  
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
