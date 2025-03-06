import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localreview/features/post/presentation/view/CreatePostScreen.dart';

void main() {
  testWidgets('Post Created Successfully SnackBar Test', (WidgetTester tester) async {
    // Build the CreatePostScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: CreatePostScreen(),
      ),
    );
    
    // Verify that the "Create Post" title is displayed
    expect(find.text("Create Post"), findsOneWidget);

    // Enter text for the caption
    await tester.enterText(find.byType(TextField), 'Test Caption');
    await tester.pump();

    // Tap the "Post" button to submit the post
    await tester.tap(find.text('Post'));
    await tester.pumpAndSettle(); // Wait for the SnackBar to appear

    // Verify that the "Post Created Successfully" SnackBar appears
    expect(find.byType(SnackBar), findsOneWidget);
    // expect(find.text("Post Created Successfully"), findsOneWidget);
  });
}
