// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:localreview/core/themes/mythemes.dart';
// import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:localreview/view/navbar_view.dart';
// import 'package:localreview/view/signup_screen_view.dart';

// class LoginScreenView extends StatefulWidget {
//   const LoginScreenView({super.key});

//   @override
//   State<LoginScreenView> createState() => _LoginScreenViewState();
// }

// class _LoginScreenViewState extends State<LoginScreenView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.primary,
//       body: Container(
//         width: MediaQuery.sizeOf(context).width,
//         height: MediaQuery.sizeOf(context).height,
//         color: AppTheme.tertiary,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             // Top Image Section
//             Container(
//               width: double.infinity,
//               height: 200, // Adjust height as needed
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('assets/images/onboarding3.jpg'),
//                 ),
//               ),
//             ),
//             // Bottom Content Section
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: AppTheme.secondaryBackground,
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 7,
//                       color: Color(0x4D090F13),
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 56),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/logo.png',
//                                 width: 150,
//                                 height: 150,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 24, bottom: 4),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Welcome Back,',
//                                 style: AppTheme.displaySmall,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 16),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: 'Email Address',
//                                     hintText: 'Enter your email here...',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: AppTheme.lineGray,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     filled: true,
//                                     fillColor: AppTheme.secondaryBackground,
//                                     contentPadding: const EdgeInsets.fromLTRB(
//                                         16, 24, 0, 24),
//                                   ),
//                                   style: AppTheme.titleSmall,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 16),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                     labelText: 'Password',
//                                     hintText: 'Enter your password here...',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: AppTheme.lineGray,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     filled: true,
//                                     fillColor: AppTheme.secondaryBackground,
//                                     contentPadding: const EdgeInsets.fromLTRB(
//                                         16, 24, 24, 24),
//                                   ),
//                                   style: AppTheme.titleSmall,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 24),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Forgot Password?',
//                                   style: AppTheme.titleSmall,
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     context.read<LoginBloc>().add(
//                                           LoginStudentEvent(
//                                             context: context,
//                                             username: _usernameController.text,
//                                             password: _passwordController.text,
//                                           ),
//                                         );
//                                   }
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppTheme.primary,
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(40),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'Login',
//                                   style: AppTheme.titleMedium,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 12, bottom: 24),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Don\'t have an account?',
//                                 style: AppTheme.bodyMedium,
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   context.read<LoginBloc>().add(
//                                         NavigateRegisterScreenEvent(
//                                           destination: const SignupScreenView(),
//                                           context: context,
//                                         ),
//                                       );
//                                 },
//                                 child: Text(
//                                   'Create Account',
//                                   style: AppTheme.titleSmall.copyWith(
//                                     color: const Color(0xFF39D2C0),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localreview/core/themes/mythemes.dart';
import 'package:localreview/features/auth/presentation/view/signup/signup_screen_view.dart';
import 'package:localreview/features/auth/presentation/view_model/login/login_bloc.dart';


class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  // Declare controllers for the form fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Declare a global key for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: AppTheme.tertiary,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Top Image Section
            Container(
              width: double.infinity,
              height: 200, // Adjust height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/onboarding3.jpg'),
                ),
              ),
            ),
            // Bottom Content Section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0x4D090F13),
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 56),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 150,
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back,',
                                style: AppTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          hintText: 'Enter your email here...',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.lineGray,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: AppTheme.secondaryBackground,
                                          contentPadding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
                                        ),
                                        style: AppTheme.titleSmall,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter an email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          hintText: 'Enter your password here...',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppTheme.lineGray,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: AppTheme.secondaryBackground,
                                          contentPadding: const EdgeInsets.fromLTRB(16, 24, 24, 24),
                                        ),
                                        style: AppTheme.titleSmall,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: AppTheme.titleSmall,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(
                                          LoginStudentEvent(
                                            context: context,
                                            username: _usernameController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primary,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: AppTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: AppTheme.bodyMedium,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.  read<LoginBloc>().add(
                                        NavigateRegisterScreenEvent(
                                          destination: const SignupScreenView(),
                                          context: context,
                                        ),
                                      );
                                  
                                },
                                child: Text(
                                  'Create Account',
                                  style: AppTheme.titleSmall.copyWith(
                                    color: const Color(0xFF39D2C0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
