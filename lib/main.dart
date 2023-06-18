import 'package:budgetbuddy/register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budgetbuddy/core/constants/app/app_constants.dart';
import 'package:budgetbuddy/core/theme/app_theme/app_theme.dart';
import 'package:budgetbuddy/feature/add_transaction/cubit/transaction_cubit.dart';
import 'package:budgetbuddy/product/init/localization/localizaton_manager.dart';
import 'package:budgetbuddy/product/init/product_init.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';

import 'feature/tab_controller/viewmodel/tab_controller_viewmodel.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await ProductInit.getInstance.initProduct();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      path: AppConstants.getInstance.localizationPath,
      supportedLocales: LocalizationManager.getInstance.supportedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.getInstance.appTitle,
        key: UniqueKey(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.getInstance.appTheme,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabControllerView();
            } else {
              return AuthScreen();
            }
          },
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {

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

      await Auth().signInWithEmailAndPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Budget Buddy - Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          //Add form to key to the Form Widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/logo.jpg'),width: 140,),
              SizedBox(height: 15,),
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
              SizedBox(
                height: 20,
              ),
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
              SizedBox(height: 30.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      handleSubmit();
                    },
                    //Conditionally show the button label
                    child: Text('Login' ,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                      width: 50.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              Register()));
                    },
                    //Conditionally show the button label
                    child: Text('Register' ,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

