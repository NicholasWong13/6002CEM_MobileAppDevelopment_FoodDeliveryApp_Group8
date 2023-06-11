import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../../operations/permission_handler.dart';
import '../../widgets/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _selectedImage;
  Uint8List _imageBytes;
  String profileImageString;
  
  bool isLoading = false;

  bool _obscureText = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot> getUserData(String email) async {
    QuerySnapshot querySnapshot =
        await usersCollection.where('email', isEqualTo: email).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      throw Exception('User not found');
    }
  }

  void fetchUserData() async {
    try {
      String email = await fetchEmail();
      DocumentSnapshot userSnapshot = await getUserData(email);
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      String name = userData['name'];
      String contact = userData['contact'];
      String address = userData['address'];

      // Now you can use the fetched user details as desired
      print('Name: $name');
      print('Contact: $contact');
      print('Address: $address');
      setState(() {
        nameController.text = userData['name'];
        emailController.text = userData['email'];
        numberController.text = userData['contact'];
        addressController.text = userData['address'];
        if (userData['profileImage'] != null) {
          // Decode the base64-encoded string back to Uint8List
          Uint8List imageBytes = base64Decode(userData['profileImage']);
          _imageBytes = imageBytes;
        }
      });
      
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
    }
  }

  // Fetch the email from shared preferences
  Future<String> fetchEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    print('Fetched email from shared preferences: $email');

    return email;
  }

  // show image picker
  Future<void> _showImagePickerDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Upload Image"),
          content: Text("Choose an option to upload an image:"),
          actions: [
            TextButton(
              child: Text("Gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                File image = await _pickImageFromGallery();
                if (image != null) {
                  setState(() {
                    _selectedImage = image;
                  });
                }
              },
            ),
            TextButton(
              child: Text("Camera"),
              onPressed: () async {
                Navigator.of(context).pop();
                File image = await _pickImageFromCamera();
                if (image != null) {
                  setState(() {
                    _selectedImage = image;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Future<File> _pickImageFromGallery() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     final imageBytes = await pickedImage.readAsBytes();
  //     setState(() {
  //       _imageBytes = imageBytes;
  //       profileImageString = base64Encode(imageBytes);
  //     });
  //     return File(pickedImage.path);
  //   }
  //   return null;
  // }
  //
  // Future<File> _pickImageFromCamera() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.camera);
  //   if (pickedImage != null) {
  //     final imageBytes = await pickedImage.readAsBytes();
  //     setState(() {
  //       _imageBytes = imageBytes;
  //       profileImageString = base64Encode(imageBytes);
  //     });
  //     return File(pickedImage.path);
  //   }
  //   return null;
  // }


  Future<File> _pickImageFromGallery() async {
    bool hasPermission = await checkGalleryPermission();
    if (!hasPermission) {
      bool granted = await requestGalleryPermission();
      if (!granted) {
        // Permission not granted, handle accordingly
        return null;
      }
    }

    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
        profileImageString = base64Encode(imageBytes);
      });
      return File(pickedImage.path);
    }

    return null;
  }

  Future<File> _pickImageFromCamera() async {
    bool hasPermission = await checkCameraPermission();
    if (!hasPermission) {
      bool granted = await requestCameraPermission();
      if (!granted) {
        // Permission not granted, handle accordingly
        return null;
      }
    }

    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
        profileImageString = base64Encode(imageBytes);
      });
      return File(pickedImage.path);
    }

    return null;
  }

  Future<void> updateUserData(
      String name, String contact, String address, String profileImage) async {
    setState(() {
      isLoading = true;
    });
    try {
      String email = await fetchEmail();
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).limit(1).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;
        String userId = userSnapshot.id;

        await usersCollection.doc(userId).update({
          'name': name,
          'contact': contact,
          'address': address,
          'profileImage': profileImage,
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Profile Updated"),));
        print('User data updated in FireStore');
      } else {
        throw Exception('User not found');
      }
      
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong!"),));
      print('Error updating user data in FireStore: $e');
    }
    setState(() {
      isLoading = false;
    });
    
  }

  @override
  void initState() {
    super.initState();

    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return Scaffold(
      appBar: customAppBar(context, title: 'Profile', backButton: false),
      backgroundColor: AppColor.bright,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: screenHeight * 8,
                    backgroundColor: AppColor.placeholder,
                    child: _imageBytes != null
                        ? Container(
                            width: screenHeight * 15,
                            height: screenHeight * 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(_imageBytes),
                              ),
                            ),
                          )
                        : Container(
                            width: screenHeight * 15,
                            height: screenHeight * 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/real/fruit.jpg'),
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    right: screenHeight * 2,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        _showImagePickerDialog();
                      },
                      child: CircleAvatar(
                        radius: screenHeight * 2,
                        backgroundColor: AppColor.placeholder,
                        child: Icon(
                          Icons.edit,
                          color: AppColor.bright,
                          size: screenHeight * 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * 10,
            ),
            TextFormField(
                controller: nameController,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Enter Full Name', labelText: 'Name')),
            SizedBox(
              height: screenWidth * 5,
            ),
            TextFormField(
                readOnly: true,
                controller: emailController,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Email Address', labelText: 'Email')),
            SizedBox(
              height: screenWidth * 5,
            ),
            TextFormField(
                controller: numberController,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Mobile Number', labelText: 'Number')),
            SizedBox(
              height: screenWidth * 5,
            ),
            TextFormField(
                controller: addressController,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Enter Address', labelText: 'Address')),
            // SizedBox(
            //   height: screenWidth * 5,
            // ),
            // TextFormField(
            //     controller: passwordController,
            //     style: TextStyle(color: AppColor.dark),
            //     obscureText: _obscureText,
            //     decoration: textFieldDecoration(screenWidth,
            //         hintText: 'Enter Password', labelText: 'Password')),
            // SizedBox(
            //   height: screenWidth * 5,
            // ),
            // TextFormField(
            //     controller: confirmPasswordController,
            //     style: TextStyle(color: AppColor.dark),
            //     decoration: textFieldDecoration(screenWidth,
            //         hintText: 'Confirm Password', labelText: 'Confirm')),
            SizedBox(
              height: screenWidth * 5,
            ),
            SizedBox(
              height: screenWidth * 12,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.main,
                  ),
                ),
                onPressed: () {
                  String name = nameController.text;
                  String contact = numberController.text;
                  String address = addressController.text;
                  String profileImage = profileImageString;

                  updateUserData(name, contact, address, profileImage);
                },
                child: isLoading ? Padding(
                  padding: EdgeInsets.all(screenWidth * 2),
                  child: CircularProgressIndicator( color: Colors.white, strokeWidth: screenWidth * 0.5,),
                ):Text(
                  "Update",
                  style: TextStyle(
                      fontSize: screenWidth * 4, color: AppColor.bright),
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 5,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(double screenWidth,
      {String hintText, String labelText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.primary),
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.primary),
        focusColor: AppColor.dark,
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 5, vertical: screenWidth * 4),
        floatingLabelStyle:
            TextStyle(color: AppColor.dark, fontSize: screenWidth * 4),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        suffixIcon: labelText == "Password" || labelText == "Confirm"
            ? InkWell(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColor.main),
              )
            : null);
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key key,
    String label,
    String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.bright,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
