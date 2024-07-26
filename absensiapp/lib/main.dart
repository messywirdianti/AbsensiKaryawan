import 'package:absensiapp/screens/SignIn_Screen.dart'; // Import SignInScreen
import 'package:absensiapp/screens/Welcome_Screen.dart';
import 'package:absensiapp/services/auth_service.dart';
import 'package:absensiapp/widgets/homepage.dart';
import 'package:absensiapp/widgets/jam_kerja.dart';
import 'package:absensiapp/widgets/logout.dart';
import 'package:absensiapp/widgets/profil.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:absensiapp/splashscreen.dart'; // Import SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(), // Set SignInScreen as the home
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    ); 
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 4; // Update maxCount to 4
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      HomePage(),
      JamKerja(),
      Profil(),
      Container(),
      Logout(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.blue,
        showLabel: true,
        notchColor: Color.fromRGBO(255, 255, 255, 1.0),
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: true,
        durationInMilliSeconds: 150,
        itemLabelStyle: const TextStyle(
          fontSize: 10,
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
        kBottomRadius: 20.0,
        kIconSize: 24.0,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blue,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.share_arrival_time_rounded,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.share_arrival_time_rounded,
              color: Colors.blue,
            ),
            itemLabel: 'Jam Kerja',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.supervised_user_circle,
              color: Colors.blue,
            ),
            itemLabel: 'Profil',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.camera_alt,
              color: Colors.blue,
            ),
            itemLabel: 'Kamera',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            itemLabel: 'Logout',
          ),
        ],
        onTap: (index) async {
          if (index == 3) {
            // Open camera
            final pickedFile =
                await _picker.pickImage(source: ImageSource.camera);
            if (pickedFile != null) {
              // Handle the picked file (e.g., upload to server, display in the app, etc.)
              print('Picked image: ${pickedFile.path}');
            }
          } else if (index == 4) {
            // Logout
            final authService = AuthService();
            await authService.logout();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          } else {
            _pageController.jumpToPage(index);
          }
        },
      ),
    );
  }
}
