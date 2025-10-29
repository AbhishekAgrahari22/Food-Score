import 'package:flutter/material.dart';
import 'package:food_score/auth/model/signup_data.dart';
import 'package:food_score/components/widget/full_width_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final SignupData signupData;
  const ProfilePage({super.key, required this.signupData});

  String getInitials(String name) {
    return name
        .split(' ') // split by spaces
        .where((word) => word.isNotEmpty) // ignore extra spaces
        .map((word) => word[0].toUpperCase())
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030213),
      body: Column(
        children: [
          // Top dark section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 40,
              bottom: 16,
            ),
            color: const Color(0xFF030213),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Manage your account and preferences",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Expanded white section
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Example content
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(227, 227, 227, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF030213),
                              ),
                              child: Center(
                                child: Text(
                                  getInitials(signupData.name),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  signupData.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color.fromRGBO(10, 10, 10, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  signupData.email,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Color.fromRGBO(113, 113, 130, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  FullWidthButton(
                    text: "Account Settings",
                    onPressed: () {},
                    icon: Icon(Icons.settings_outlined, size: 24),
                    navigateIcon: Icon(Icons.navigate_next_outlined, size: 24),
                  ),
                  const SizedBox(height: 16),
                  FullWidthButton(
                    text: "Privacy & Security",
                    onPressed: () {},
                    icon: Icon(Icons.privacy_tip_outlined, size: 24),
                    navigateIcon: Icon(Icons.navigate_next_outlined, size: 24),
                  ),
                  const SizedBox(height: 16),
                  FullWidthButton(
                    text: "Help & Support",
                    onPressed: () {},
                    icon: Icon(Icons.help_outline, size: 24),
                    navigateIcon: Icon(Icons.navigate_next_outlined, size: 24),
                  ),
                  const SizedBox(height: 16),
                  FullWidthButton(
                    text: "Logout",
                    onPressed: () {},
                    icon: Icon(Icons.logout_outlined, size: 24),
                    navigateIcon: Icon(Icons.navigate_next_outlined, size: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
