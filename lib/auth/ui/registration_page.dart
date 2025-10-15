import 'package:flutter/material.dart';
import 'package:food_score/auth/model/signup_data.dart';
import 'package:food_score/auth/ui/onboarding_page.dart';
import 'package:food_score/common/ui/common_text_field.dart';
import 'package:food_score/common/widget/custom_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final SignupData signupData = SignupData();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
        return;
      }

      signupData.name = _nameController.text.trim();
      signupData.email = _emailController.text.trim();
      signupData.mobile = _mobileController.text.trim();
      signupData.password = password;

      // Navigate to OnboardingPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OnboardingPage(signupData: signupData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF030213), Color(0xCC030213)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.apple,
                      size: 40,
                      color: Color(0xFF030213),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Start your journey to better nutrition",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CommonTextField(
                              controller: _nameController,
                              label: "Full Name",
                              hint: "John Doe",
                              validator:
                                  (v) => v!.isEmpty ? "Enter your name" : null,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              controller: _emailController,
                              label: "Email",
                              hint: "your@email.com",
                              keyboardType: TextInputType.emailAddress,
                              validator:
                                  (v) => v!.isEmpty ? "Enter your email" : null,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              controller: _mobileController,
                              label: "Mobile Number",
                              hint: "1234567890",
                              keyboardType: TextInputType.phone,
                              validator:
                                  (v) =>
                                      v!.isEmpty
                                          ? "Enter your mobile number"
                                          : null,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              controller: _passwordController,
                              label: "Password",
                              hint: "Enter your password",
                              obscureText: true,
                              validator:
                                  (v) =>
                                      v!.isEmpty ? "Enter your password" : null,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              controller: _confirmPasswordController,
                              label: "Confirm Password",
                              hint: "Re-enter your password",
                              obscureText: true,
                              validator:
                                  (v) =>
                                      v!.isEmpty
                                          ? "Confirm your password"
                                          : null,
                            ),
                            const SizedBox(height: 24),
                            CustomButton(
                              text: "Sign Up",
                              onPressed: _handleSubmit,
                              backgroundColor: Color(0xFF030213),
                              textColor: Colors.white,
                              fontSize: 18,
                              borderRadius: 8,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
