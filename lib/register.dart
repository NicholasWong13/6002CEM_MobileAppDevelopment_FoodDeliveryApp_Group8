import 'package:budgetbuddy/main.dart';
import 'package:flutter/material.dart';

import 'auth.dart';


class Register extends StatefulWidget {
   Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Use this check if it's login or register
  final bool _isLogin = false;

  //Use this form key to validate user's input
  final _formKey = GlobalKey<FormState>();

  //Use this to store user inputs
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  handleSubmit() async {
    //Validate user inputs using formkey
    if (_formKey.currentState!.validate()) {
      //Get inputs from the controllers
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      //Check if is login or register
      if(_isLogin) {
        await Auth().signInWithEmailAndPassword(email, password);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                AuthScreen()));
      } else {
        await Auth().registerWithEmailAndPassword(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //Add form to key to the Form Widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.cyan.shade50,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black,width: 3)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue,width: 3)
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {},
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(height: 25,),

              TextFormField(
                //Assign controller
                controller:_emailController,
                //Use this function to validate user input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Your Email ID',
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.cyan.shade50,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black,width: 3)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue,width: 3)
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {
                    _emailController.clear();
                  },
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(height: 25,),

              TextFormField(
                //Assign controller
                controller:_passwordController,
                obscureText: true,
                //Use this function to validate user
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.cyan.shade50,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black,width: 3)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue,width: 3)
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: () {},
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 40.0),

              ElevatedButton(
                //Assigned onPressed to submit
                onPressed: handleSubmit,
                //Conditionally show the button label
                child: Text(_isLogin ? 'Login' :'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
