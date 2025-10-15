class SignupData {
  // Registration info
  String name = '';
  String email = '';
  String mobile = '';
  String password = '';

  // Onboarding info
  int age = 0;
  int weight = 0;
  int height = 0;
  String gender = '';
  String activityLevel = '';
  String healthGoal = '';
  List<String> dietaryPreferences = [];
  List<String> healthConditions = [];

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "age": age,
      "weight": weight,
      "height": height,
      "gender": gender,
      "activityLevel": activityLevel,
      "healthGoal": healthGoal,
      "dietaryPreferences": dietaryPreferences,
      "healthConditions": healthConditions,
    };
  }
}
