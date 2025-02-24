import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localreview/features/profile/presentation/view_model/user_profile/user_profile_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const ProfileScreen(),
//     );
//   }
// }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _img;
  final _key = GlobalKey<FormState>();
  final TextEditingController _bioController = TextEditingController();

  // Check for camera permissions
  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  // Pick an image from Camera or Gallery
  Future<void> _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          context.read<UserProfileBloc>().add(UploadImage(file: _img!));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Handle Save Profile Button
  void _saveProfile() {
    if (_bioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a bio!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile Saved! Bio: ${_bioController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[300],
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              checkCameraPermission();
                              _browseImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _browseImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.image),
                            label: const Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: _img != null
                      ? FileImage(_img!)
                      : const AssetImage('assets/images/logo.png')
                          as ImageProvider,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_key.currentState!.validate()) {
                    //   final registerState =
                    //       context.read<UserProfileBloc>().state;
                    //   final imageName = registerState.imageName;
                    //   context.read<UserProfileBloc>().add(
                    //         CreateUserProfile(
                    //           context: context,
                    //           bio: _bioController.text,
                    //           image: imageName,
                    //         ),
                    //       );
                    // }
                    if (_img == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please select an image!')),
                      );
                      return;
                    }

                    if (_key.currentState!.validate()) {
                      context.read<UserProfileBloc>().add(
                            CreateUserProfile(
                              context: context,
                              bio: _bioController.text,
                              image: context
                                  .read<UserProfileBloc>()
                                  .state
                                  .imageName,
                            ),
                          );
                    }
                  },
                  child: const Text('Save Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
