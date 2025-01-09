import 'package:flutter/material.dart';
import 'package:localreview/core/themes/mythemes.dart'; // Import your custom theme.

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Image.asset(
                    'assets/images/star.png',
                    width: double.infinity,
                    height: 255,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 17),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Discover and Review places.',
                          style: AppTheme.bodyMedium.copyWith(
                            fontFamily: 'Playfair Display',
                            color: AppTheme.primary,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 27),
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      // Navigate to Search Results Page
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: AppTheme.primary,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          bottom: 2),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Search places, reviews...',
                                          hintStyle:
                                              AppTheme.bodyMedium.copyWith(
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                        style: AppTheme.bodyMedium.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 15, 0, 20),
                            child: Text(
                              'Popular Categories',
                              style: AppTheme.bodyMedium.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<List<dynamic>>(
                          future: getCategories(), // Your API call here.
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme.primary),
                                  ),
                                ),
                              );
                            }
                            final categories = snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.6,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return InkWell(
                                  onTap: () {
                                    // Navigate to Category Details Page (e.g., reviews by category)
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.brown[200],
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5, 0, 5, 0),
                                        child: Text(
                                          category['displayName'],
                                          textAlign: TextAlign.center,
                                          style: AppTheme.titleSmall.copyWith(
                                            fontFamily: 'Playfair Display',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 15, 0, 20),
                            child: Text(
                              'Top 10  Reviewed Places',
                              style: AppTheme.bodyMedium.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<List<dynamic>>(
                          future: getTopCategories(), // Your API call here.
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme.primary),
                                  ),
                                ),
                              );
                            }
                            final categories = snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.6,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return InkWell(
                                  onTap: () {
                                    // Navigate to Category Details Page (e.g., reviews by category)
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.orange[300],
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5, 0, 5, 0),
                                        child: Text(
                                          category['displayName'],
                                          textAlign: TextAlign.center,
                                          style: AppTheme.titleSmall.copyWith(
                                            fontFamily: 'Playfair Display',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<dynamic>> getCategories() async {
    // Mock data - Replace with your API call for review categories
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        {'displayName': 'Restaurants'},
        {'displayName': 'Art Galleries'},
        {'displayName': 'Cafes'},
        {'displayName': 'Shops'},
      ],
    );
  }

  Future<List<dynamic>> getTopCategories() async {
    // Mock data - Replace with your API call for review categories
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        {'displayName': 'Top Restaurants'},
        {'displayName': 'Top Art Galleries'},
        {'displayName': 'Top Cafes'},
        {'displayName': 'Top Shops'},
      ],
    );
  }
}
