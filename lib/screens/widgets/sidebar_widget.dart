import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/blocs/blocs.dart';
import '/screens/screens.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Clear the token
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Color(0xffffffff),
        width: 0.9.sw,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CITIZEN FEMME',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'The Stylish Guide for the female Traveller',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff9b93a4),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    trailing: const Icon(Icons.close),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return ListTile(
                          title: Text(category.name),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlogListingScreen(
                                  categoryName: category.name,
                                  categoryId: category.id,
                                ),
                              ),
                            );
                          },
                          trailing: const Icon(Icons.chevron_right),
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Contact Us'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ContactFormScreen(),
                        ),
                      );
                    },
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () => _logout(context),
                    trailing: const Icon(Icons.chevron_right),
                  )
                ],
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No categories available'));
            }
          },
        ),
      ),
    );
  }
}
