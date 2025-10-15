// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:food_score/auth/model/signup_data.dart';
import 'package:food_score/common/ui/common_text_field.dart';
import 'package:food_score/common/widget/custom_button.dart';
import 'package:food_score/components/widget/bottom_nav_page.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  final SignupData signupData;
  const OnboardingPage({super.key, required this.signupData});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int step = 1;
  final int totalSteps = 4;

  // Step 1 controllers
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ageController.text = widget.signupData.age.toString();
    _weightController.text = widget.signupData.weight.toString();
    _heightController.text = widget.signupData.height.toString();
  }

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void handleNext() {
    if (step == 1) {
      widget.signupData.age = int.parse(_ageController.text);
      widget.signupData.weight = int.parse(_weightController.text);
      widget.signupData.height = int.parse(_heightController.text);
    }

    if (step < totalSteps) {
      setState(() => step++);
    } else {
      _submitSignup();
    }
  }

  void handleBack() {
    if (step > 1) setState(() => step--);
  }

  void toggleListItem(List<String> list, String value) {
    setState(() {
      if (list.contains(value)) {
        list.remove(value);
      } else {
        list.add(value);
      }
    });
  }

  Future<void> _submitSignup() async {
    // Print all signup data
    print("=== Signup Details ===");
    widget.signupData.toJson().forEach((key, value) {
      print("$key: $value");
    });
    print("======================");

    // Simulate network delay (optional)
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to BottomNavigationBar page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BottomNavPage(signupData: widget.signupData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Step $step of 4',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(117, 117, 133, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${(step / 4 * 100).toInt()}%',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(117, 117, 133, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: step / totalSteps,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFF030213),
                    backgroundColor: Color.fromRGBO(237, 239, 242, 1),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(227, 227, 227, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        renderStep(),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            if (step > 1)
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: handleBack,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Color.fromRGBO(227, 227, 227, 1),
                                      width: 1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.arrow_back, size: 18),
                                      SizedBox(width: 6),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                          color: Color.fromRGBO(10, 10, 10, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            if (step > 1) const SizedBox(width: 8),
                            Expanded(
                              child: CustomButton(
                                text: step == totalSteps ? "Complete" : "Next",
                                onPressed: handleNext,
                                backgroundColor: Color(0xFF030213),
                                textColor: Colors.white,
                                fontSize: 18,
                                borderRadius: 8,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  Widget renderStep() {
    switch (step) {
      case 1: // Basic Information
        return Column(
          children: [
            const Text(
              "Basic Information",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(10, 10, 10, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Help us personalize your food recommendations",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(117, 117, 133, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),

            CommonTextField(
              controller: _ageController,
              hint: "25",
              label: "Age",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    controller: _weightController,
                    hint: "70",
                    label: "Weight (kg)",
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CommonTextField(
                    controller: _heightController,
                    hint: "170",
                    label: "Height (cm)",
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Gender",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // aligns items to left
              children:
                  ["Male", "Female", "Other"].map((gender) {
                    return Row(
                      mainAxisSize:
                          MainAxisSize.min, // only takes necessary space
                      children: [
                        Radio<String>(
                          value: gender.toLowerCase(),
                          groupValue: widget.signupData.gender,
                          onChanged:
                              (v) =>
                                  setState(() => widget.signupData.gender = v!),
                        ),
                        Text(
                          gender,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8), // space between options
                      ],
                    );
                  }).toList(),
            ),
          ],
        );

      case 2: // Activity & Health Goal
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Activity & Goals",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(10, 10, 10, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tell us about your lifestyle and goals",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(117, 117, 133, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Activity Level",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(10, 10, 10, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children:
                  [
                    {
                      "value": "sedentary",
                      "label": "Sedentary",
                      "desc": "Little to no exercise",
                    },
                    {
                      "value": "light",
                      "label": "Lightly Active",
                      "desc": "Exercise 1-3 days/week",
                    },
                    {
                      "value": "moderate",
                      "label": "Moderately Active",
                      "desc": "Exercise 3-5 days/week",
                    },
                    {
                      "value": "very",
                      "label": "Very Active",
                      "desc": "Exercise 6-7 days/week",
                    },
                  ].map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              widget.signupData.activityLevel == option["value"]
                                  ? Color.fromRGBO(242, 242, 245, 1)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:
                                widget.signupData.activityLevel ==
                                        option["value"]
                                    ? Color.fromRGBO(3, 2, 18, 1)
                                    : Color.fromRGBO(227, 227, 227, 1),
                            width: 0.5,
                          ),
                        ),
                        child: RadioListTile<String>(
                          title: Text(
                            option["label"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(10, 10, 10, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            option["desc"]!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(117, 117, 133, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: option["value"]!,
                          groupValue: widget.signupData.activityLevel,
                          onChanged:
                              (v) => setState(
                                () => widget.signupData.activityLevel = v!,
                              ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Health Goal",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(10, 10, 10, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  [
                    "Weight Loss",
                    "Muscle Gain",
                    "Maintenance",
                    "Heart Health",
                  ].map((goal) {
                    final selected = widget.signupData.healthGoal == goal;

                    return SizedBox(
                      width:
                          (MediaQuery.of(context).size.width - 74) /
                          2, // 2 buttons per row
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.signupData.healthGoal = goal;
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                selected
                                    ? Color.fromRGBO(242, 242, 245, 1)
                                    : Colors.white,
                            border: Border.all(
                              width: 0.5,
                              color:
                                  selected
                                      ? Color.fromRGBO(3, 2, 18, 1)
                                      : Color.fromRGBO(227, 227, 227, 1),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            goal,
                            style: TextStyle(
                              color: Color.fromRGBO(10, 10, 10, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        );

      case 3: // Dietary Preferences
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dietary Preferences",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children:
                  [
                    "Vegetarian",
                    "Vegan",
                    "Pescatarian",
                    "Gluten-Free",
                    "Dairy-Free",
                    "Low-Carb",
                    "Keto",
                    "Paleo",
                  ].map((pref) {
                    return FilterChip(
                      label: Text(pref),
                      selected: widget.signupData.dietaryPreferences.contains(
                        pref,
                      ),
                      onSelected:
                          (_) => toggleListItem(
                            widget.signupData.dietaryPreferences,
                            pref,
                          ),
                    );
                  }).toList(),
            ),
          ],
        );

      case 4: // Health Conditions
        return Column(
          children: [
            const Text(
              "Health Conditions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children:
                  [
                    "Diabetes",
                    "Hypertension",
                    "High Cholesterol",
                    "Heart Disease",
                    "Anemia",
                    "Thyroid Issues",
                    "Food Allergies",
                    "None",
                  ].map((condition) {
                    return FilterChip(
                      label: Text(condition),
                      selected: widget.signupData.healthConditions.contains(
                        condition,
                      ),
                      onSelected:
                          (_) => toggleListItem(
                            widget.signupData.healthConditions,
                            condition,
                          ),
                    );
                  }).toList(),
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
