import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Entry point of the Flutter app
void main() => runApp(const MyApp());

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'BrainQuery', // Title of the app
      color: Colors.white, // Base color of the app
      theme: ThemeData(
        primarySwatch: Colors.amber, // Primary theme color
      ),
      home: const MyPageView(), // Default page of the app
    );
  }
}

// Stateful widget for the page view and indicator
class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

// State class for managing page view and indicator logic
class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController(); // Controls the page view
  int _currentPage = 0; // Tracks the current page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0; // Updates the page index
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Clean up controller when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BrainQuery',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Black text for the app title
          ),
        ),
        centerTitle: true, // Centers the title in the AppBar
        backgroundColor: Colors.white, // White background for the AppBar
        elevation: 0, // Removes AppBar shadow
        iconTheme: const IconThemeData(color: Colors.black), // Black icons in AppBar
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255), // White background for the body
        child: Column(
          children: [
            // PageView widget for swipeable pages
            Expanded(
              child: PageView(
                controller: _pageController, // Controller for PageView
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index; // Updates the current page on swipe
                  });
                },
                children: const <Widget>[
                  Page1(), // First page
                  Page2(), // Second page
                  Page3(), // Third page
                ],
              ),
            ),
            // Row for the page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // Total number of pages
                (index) => _buildIndicator(isActive: index == _currentPage),
              ),
            ),
            const SizedBox(height: 16), // Spacing below the indicators
          ],
        ),
      ),
    );
  }

  // Widget to build the page indicator
  Widget _buildIndicator({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Smooth animation duration
      margin: const EdgeInsets.symmetric(horizontal: 4), // Spacing between indicators
      width: isActive ? 16 : 12, // Larger size for the active indicator
      height: 12, // Fixed height for all indicators
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.black12, // Color based on active state
        borderRadius: BorderRadius.circular(6), // Rounded corners
      ),
    );
  }
}

// First page widget
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding for the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center-align the content
        children: [
          const Spacer(), // Flexible empty space above the content
          // Image/illustration for the page
          SizedBox(
            height: 389,
            width: 389,
            child: Image.asset(
              'assets/images/illustration1.png', // Path to the image
              fit: BoxFit.cover, // Scale the image proportionally to cover
            ),
          ),
          const SizedBox(height: 24), // Spacing below the image
          // Title text
          Text(
            "Your Study Secret",
            style: GoogleFonts.lato(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Black text
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const SizedBox(height: 8), // Spacing below the title
          // Subtitle text
          Text(
            "Custom AI quizzes & flashcards to boost your grades.",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.black54, // Lighter text color
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const Spacer(), // Flexible empty space below the content
          // Buttons for user actions
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center-align buttons
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic for "Get Started" button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Spacing between buttons
              OutlinedButton(
                onPressed: () {
                  // Logic for "Log In" button
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black), // Black border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black, // Black text color
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24), // Spacing below the buttons
        ],
      ),
    );
  }
}

// Page2 and Page3 are structured the same as Page1 with different content
class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding for the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center-align the content
        children: [
          const Spacer(), // Flexible empty space above the content
          // Image/illustration for the page
          SizedBox(
            height: 389,
            width: 389,
            child: Image.asset(
              'assets/images/illustration2.png', // Path to the image
              fit: BoxFit.cover, // Scale the image proportionally to cover
            ),
          ),
          const SizedBox(height: 24), // Spacing below the image
          // Title text
          Text(
            "Study Wherever, Whenever",
            style: GoogleFonts.lato(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Black text
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const SizedBox(height: 8), // Spacing below the title
          // Subtitle text
          Text(
            "Master your subjects at your own pace, anywhere, anytime.",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.black54, // Lighter text color
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const Spacer(), // Flexible empty space below the content
          // Buttons for user actions
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center-align buttons
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic for "Get Started" button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Spacing between buttons
              OutlinedButton(
                onPressed: () {
                  // Logic for "Log In" button
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black), // Black border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black, // Black text color
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24), // Spacing below the buttons
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding for the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center-align the content
        children: [
          const Spacer(), // Flexible empty space above the content
          // Image/illustration for the page
          SizedBox(
            height: 389,
            width: 389,
            child: Image.asset(
              'assets/images/illustration3.png', // Path to the image
              fit: BoxFit.cover, // Scale the image proportionally to cover
            ),
          ),
          const SizedBox(height: 24), // Spacing below the image
          // Title text
          Text(
            "Snap to Create Instantly.",
            style: GoogleFonts.lato(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Black text
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const SizedBox(height: 8), // Spacing below the title
          // Subtitle text
          Text(
            "Generate quizzes & flashcards effortlessly with a quick photo or upload.",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.black54, // Lighter text color
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
          const Spacer(), // Flexible empty space below the content
          // Buttons for user actions
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center-align buttons
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic for "Get Started" button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Spacing between buttons
              OutlinedButton(
                onPressed: () {
                  // Logic for "Log In" button
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black), // Black border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12, // Padding for the button text
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black, // Black text color
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24), // Spacing below the buttons
        ],
      ),
    );
  }
}
