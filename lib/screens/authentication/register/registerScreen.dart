import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../login/loginScreen.dart';
import '../../../utils/helper.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // focus nodes
  FocusNode focusNode1;
  final field1Key = GlobalKey<FormFieldState>();
  FocusNode focusNode2;
  final field2Key = GlobalKey<FormFieldState>();
  FocusNode focusNode3;
  final field3Key = GlobalKey<FormFieldState>();
  FocusNode focusNode4;
  final field4Key = GlobalKey<FormFieldState>();
  FocusNode focusNode5;
  final field5Key = GlobalKey<FormFieldState>();
  FocusNode focusNode6;
  final field6Key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1Key.currentState?.validate();
      }
    });
    focusNode2 = FocusNode();
    focusNode2.addListener(() {
      if (!focusNode2.hasFocus) {
        field2Key.currentState?.validate();
      }
    });
    focusNode3 = FocusNode();
    focusNode3.addListener(() {
      if (!focusNode3.hasFocus) {
        field3Key.currentState?.validate();
      }
    });
    focusNode4 = FocusNode();
    focusNode4.addListener(() {
      if (!focusNode4.hasFocus) {
        field4Key.currentState?.validate();
      }
    });
    focusNode5 = FocusNode();
    focusNode5.addListener(() {
      if (!focusNode5.hasFocus) {
        field5Key.currentState?.validate();
      }
    });
    focusNode6 = FocusNode();
    focusNode6.addListener(() {
      if (!focusNode6.hasFocus) {
        field6Key.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    super.dispose();
  }

  // Future<void> signUpWithGoogle() async {
  //
  //   try {
  //     // Configure Google sign-in.
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //
  //     // Get the authentication credentials.
  //     final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in with Firebase using the obtained credential.
  //     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //     // Access the user information.
  //     final User user = userCredential.user;
  //
  //     // Print the user's display name and email.
  //     print('User signed up with Google:');
  //     print('Display Name: ${user?.displayName}');
  //     print('Email: ${user?.email}');
  //
  //     // Perform additional actions or navigate to a new screen.
  //     // ...
  //   } catch (e) {
  //     print('Google sign-up failed: $e');
  //   }
  // }

  Future<void> registerWithEmailPassword() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // User registration successful
      User user = userCredential.user;
      print('User registered with email: ${user?.email}');
      addUserToFireStore(
        nameController.text,
        emailController.text,
        phoneController.text,
        addressController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registration Successful!"),));
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } catch (e) {
      // Handle registration errors
      print('Registration failed: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addUserToFireStore(
      String name, String email, String contact, String address) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
        'contact': contact,
        'address': address,
        'profile': '',
      });
      print('User data added to FireStore');
    } catch (e) {
      // Handle errors
      print('Error adding user data to FireStore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 2),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 30,
                  right: screenWidth * 30,
                  top: screenWidth * 0),
              child: Image.asset(
                Helper.getAssetName("logo.png", "virtual"),
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Text('Bite Buddies',
                  style: TextStyle(
                    fontSize: screenWidth * 6,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: screenWidth * 10,
            ),
            // name field
            TextFormField(
                key: field1Key,
                focusNode: focusNode1,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Name', labelText: 'Name')),
            SizedBox(
              height: screenWidth * 2,
            ),
            TextFormField(
                key: field2Key,
                focusNode: focusNode2,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // email validation using regex
                  else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Email Address', labelText: 'Email')),
            SizedBox(
              height: screenWidth * 2,
            ),
            // mobile number field
            TextFormField(
                key: field3Key,
                focusNode: focusNode3,
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // mobile number validation using regex
                  else if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Mobile Number', labelText: 'Mobile Number')),
            SizedBox(
              height: screenWidth * 2,
            ),
            // address field
            TextFormField(
                key: field4Key,
                focusNode: focusNode4,
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Address', labelText: 'Address')),
            SizedBox(
              height: screenWidth * 2,
            ),
            // password field
            TextFormField(
                key: field5Key,
                focusNode: focusNode5,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // password length validation
                  else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                obscureText: _obscureText,
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Password', labelText: 'Password')),
            SizedBox(
              height: screenWidth * 2,
            ),
            // confirm password field
            TextFormField(
                key: field6Key,
                focusNode: focusNode6,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // confirm password validation
                  else if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                obscureText: _obscureText,
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password')),
            SizedBox(
              height: screenWidth * 2,
            ),

            SizedBox(
              height: screenWidth * 12,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (field1Key.currentState.validate() &&
                      field2Key.currentState.validate() &&
                      field3Key.currentState.validate() &&
                      field4Key.currentState.validate() &&
                      field5Key.currentState.validate()) {
                    registerWithEmailPassword();
                    // Navigator.of(context).pushNamed(BottomNavigation.routeName);
                  }
                },
                child: isLoading ? Padding(
                  padding: EdgeInsets.all(screenWidth * 2),
                  child: CircularProgressIndicator( color: Colors.white, strokeWidth: screenWidth * 0.5,),
                ):Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: screenWidth * 3.5, color: AppColor.bright),
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 2,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColor.dark,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: screenWidth * 4,
                      color: AppColor.dark,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColor.dark,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth * 40,
                  height: screenWidth * 10,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "fb.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Facebook")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth * 10,
                  width: screenWidth * 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "google.png",
                            "virtual",
                          ),
                        ),
                        Text("Google")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: screenWidth * 3.5, color: AppColor.dark),
                ),
                TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: screenWidth * 3.5, color: AppColor.main),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  InputDecoration textFieldDecoration(double screenWidth,
      {String hintText, String labelText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColor.primary, fontSize: screenWidth * 3.5),
        labelText: labelText,
        labelStyle:
            TextStyle(color: AppColor.primary, fontSize: screenWidth * 3.5),
        focusColor: AppColor.dark,
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 5, vertical: screenWidth * 2),
        floatingLabelStyle:
            TextStyle(color: AppColor.dark, fontSize: screenWidth * 3.5),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColor.placeholder), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColor.placeholder), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColor.placeholder), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColor.placeholder), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        suffixIcon: labelText == "Password"
            ? InkWell(
                onTap: () {
                  setState(() {
                    if (_obscureText == true) {
                      _obscureText = false;
                    } else {
                      _obscureText = true;
                    }
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.main),
              )
            : null);
  }
}
