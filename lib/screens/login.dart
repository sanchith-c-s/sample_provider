import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
              
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                  
                  color:Colors.redAccent[100],
                   borderRadius: BorderRadius.circular(15),
                
                ),
                child: Center(child: authProvider.loading ? CircularProgressIndicator(color: Colors.white,): Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}