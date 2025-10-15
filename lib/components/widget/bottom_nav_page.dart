import 'package:flutter/material.dart';
import 'package:food_score/auth/model/signup_data.dart';
import 'package:food_score/components/screens/discover_page.dart';
import 'package:food_score/components/screens/disease_page.dart';
import 'package:food_score/components/screens/home_page.dart';
import 'package:food_score/components/screens/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  final SignupData signupData;
  const BottomNavPage({super.key, required this.signupData});
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currenIndex = 0;
  final Color borderColor = const Color.fromRGBO(0, 0, 0, 0.1);

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Pass signupData to pages
    _pages = [
      HomePage(signupData: widget.signupData),
      DiseasePage(),
      DiscoverPage(),
      ProfilePage(signupData: widget.signupData),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currenIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: borderColor, width: 1)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currenIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF030213),
            unselectedItemColor: const Color(0xFF717182),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            onTap: (index) => setState(() => _currenIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'Disease',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
