// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:localreview/features/post/domain/entity/post_entity.dart';
// import 'package:localreview/features/post/presentation/view_model/bloc/post_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class CreatePostScreen extends StatefulWidget {
//   const CreatePostScreen({super.key});

//   @override
//   State<CreatePostScreen> createState() => _CreatePostScreenState();
// }

// class _CreatePostScreenState extends State<CreatePostScreen> {
//   final TextEditingController _captionController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   XFile? _selectedImage;
//   double _rating = 3; // Default rating

//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() => _selectedImage = image);
//     }
//   }

//   void _uploadPost() {
//     if (_selectedImage == null || _captionController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please select an image and add a caption")),
//       );
//       return;
//     }

//     final post = PostEntity(
//       id: '',
//       authorId: 'currentUserId',
//       imageUrl: _selectedImage!.path,
//       caption: _captionController.text,
//       likes: [],
//       comments: [],
//       rating: _rating.toInt(),
//       createdAt: DateTime.now(),
//     );

//     BlocProvider.of<PostBloc>(context).add(AddPostEvent(post, context));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isTablet = MediaQuery.of(context).size.width > 600;
//     final themeColor = Colors.red[400];
    
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create Post"),
//         backgroundColor: themeColor,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             constraints: const BoxConstraints(maxWidth: 500),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 InkWell(
//                   onTap: _pickImage,
//                   child: Container(
//                     width: double.infinity,
//                     height: isTablet ? 250 : 200,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: _selectedImage != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
//                           )
//                         : const Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 TextField(
//                   controller: _captionController,
//                   decoration: const InputDecoration(
//                     labelText: "Caption",
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 2,
//                 ),
//                 const SizedBox(height: 16),

//                 // Rating Bar
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Rating: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                     RatingBar.builder(
//                       initialRating: _rating,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
//                       onRatingUpdate: (rating) {
//                         setState(() => _rating = rating);
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 // Submit Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: themeColor),
//                     onPressed: _uploadPost,
//                     child: const Text("Post", style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localreview/features/post/domain/entity/post_entity.dart';
import 'package:localreview/features/post/presentation/view_model/bloc/post_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  double _rating = 3; // Default rating

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = image);
    }
  }

  void _uploadPost() {
    if (_selectedImage == null || _captionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an image and add a caption")),
      );
      return;
    }

    final post = PostEntity(
      id: '',
      authorId: 'currentUserId',
      imageUrl: _selectedImage!.path,
      caption: _captionController.text,
      likes: [],
      comments: [],
      rating: _rating.toInt(),
      createdAt: DateTime.now(),
    );

    // Mocking a successful post creation
    // BlocProvider.of<PostBloc>(context).add(AddPostEvent(post, context));

    // Show Snackbar message after post creation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Post Created Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Colors.white, // Neutral color for the AppBar
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Picker Area with Border and Shadow
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: isTablet ? 250 : 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: _selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(File(_selectedImage!.path), fit: BoxFit.cover),
                          )
                        : const Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 16),

                // Caption TextField with Enhanced Styling
                TextField(
                  controller: _captionController,
                  decoration: InputDecoration(
                    labelText: "Caption",
                    hintText: "Enter a caption...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  maxLines: 3,
                  minLines: 1,
                ),
                const SizedBox(height: 16),

                // Rating Bar Section with Better Spacing and Design
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Rating: ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        setState(() => _rating = rating);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Submit Button with Enhanced Styling and Shadow
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Neutral button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    onPressed: _uploadPost,
                    child: const Text("Post", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
