import 'package:blog_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({Key? key}) : super(key: key);

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xfffefefe),
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ContactBloc(context.read<ContactRepository>()),
        child: BlocConsumer<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is ContactSubmitted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Success'),
                  content: HtmlWidget(state.confirmationMessage),
                  actions: [
                    TextButton(
                      onPressed: () => {
                        Navigator.of(context).pop(),
                        Navigator.of(context).pop()
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else if (state is ContactError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Inputfield(
                      required: true,
                      controller: _nameController,
                      title: "Name",
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your name' : null,
                    ),
                    Inputfield(
                      required: true,
                      controller: _emailController,
                      title: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else {
                          String emailPattern =
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                          RegExp regExp = RegExp(emailPattern);

                          if (!regExp.hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                        }
                        return null;
                      },
                    ),
                    Inputfield(
                      required: true,
                      controller: _subjectController,
                      title: "Subject",
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a subject' : null,
                    ),
                    Inputfield(
                      title: "Message",
                      controller: _messageController,
                      maxLines: 5,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a message' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<ContactBloc>(context).add(
                            SubmitContactForm(
                              name: _nameController.text,
                              email: _emailController.text,
                              subject: _subjectController.text,
                              message: _messageController.text,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                        minimumSize:
                            Size(double.infinity, 60.h), // Increase height
                      ),
                      child: state is ContactSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Submit',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
