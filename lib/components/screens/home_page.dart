import 'package:flutter/material.dart';
import 'package:food_score/auth/model/signup_data.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final SignupData signupData;
  const HomePage({super.key, required this.signupData});

  @override
  State<HomePage> createState() => _HomePageState();
}

const foodData = [
  {
    "id": "1",
    "name": "Wild Salmon",
    "image": "https://images.unsplash.com/photo-1651326852735-7ba1e0f8364e",
    "score": 9.2,
    "impact": "Positive",
    "category": "Protein",
    "benefits": [
      "Rich in Omega-3 fatty acids",
      "Supports heart and brain health",
    ],
  },
  {
    "id": "2",
    "name": "Avocado",
    "image": "https://images.unsplash.com/photo-1757332914587-6d3e174e0e19",
    "score": 8.8,
    "impact": "Positive",
    "category": "Healthy Fats",
    "benefits": [
      "High in monounsaturated fats",
      "Promotes skin and eye health",
    ],
  },
  {
    "id": "3",
    "name": "Blueberries",
    "image": "https://images.unsplash.com/photo-1578294178306-3997168f796d",
    "score": 9.5,
    "impact": "Positive",
    "category": "Antioxidants",
    "benefits": [
      "Powerful antioxidant properties",
      "Supports memory and cognitive function",
    ],
  },
  {
    "id": "4",
    "name": "Spinach",
    "image": "https://images.unsplash.com/photo-1702488013418-10bae71d9991",
    "score": 8.9,
    "impact": "Positive",
    "category": "Vegetables",
    "benefits": [
      "High in iron and vitamins",
      "Supports bone health and immunity",
    ],
  },
  {
    "id": "5",
    "name": "Sweet Potato",
    "image": "https://images.unsplash.com/photo-1570723735746-c9bd51bd7c40",
    "score": 8.4,
    "impact": "Positive",
    "category": "Carbs",
    "benefits": [
      "Complex carbohydrates for energy",
      "High in vitamin A and fiber",
    ],
  },
];

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filtered food list based on search query
    final filteredFoods =
        foodData.where((food) {
          final name = food["name"]?.toString().toLowerCase() ?? '';
          final category = food["category"]?.toString().toLowerCase() ?? '';
          return name.contains(searchQuery.toLowerCase()) ||
              category.contains(searchQuery.toLowerCase());
        }).toList();

    return Scaffold(
      backgroundColor: Color(0xFF030213),
      body: ListView(
        children: [
          // Top Section: Title + Search
          Container(
            decoration: const BoxDecoration(color: Color(0xFF030213)),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food Health Score',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Discover how foods impact your body',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search for food...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ],
            ),
          ),

          // Health Profile Card
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF030213), Colors.white],
                stops: [0.1, 0.8],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Health Profile",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Personalized",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Metrics (BMI, Goal, Activity, Score)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (widget.signupData.weight > 0 &&
                              widget.signupData.height > 0)
                            _metricCard(
                              icon: Icons.fitness_center,
                              title: "BMI",
                              value: _calculateBMI(
                                widget.signupData.weight,
                                widget.signupData.height,
                              ),
                              valueColor: _bmiColor(
                                widget.signupData.weight,
                                widget.signupData.height,
                              ),
                              subText: _getBMICategory(
                                widget.signupData.weight,
                                widget.signupData.height,
                              ),
                            ),
                          if (widget.signupData.healthGoal.isNotEmpty)
                            _metricCard(
                              icon: Icons.track_changes,
                              title: "Goal",
                              value: widget.signupData.healthGoal,
                            ),
                          if (widget.signupData.activityLevel.isNotEmpty)
                            _metricCard(
                              icon: Icons.trending_up,
                              title: "Activity",
                              value: widget.signupData.activityLevel,
                            ),
                          _metricCard(
                            icon: Icons.favorite,
                            title: "Score",
                            value: "8.5",
                            valueColor: Colors.green,
                            subText: "Excellent",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dietary Preferences:",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(227, 227, 227, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.signupData.dietaryPreferences.isNotEmpty
                              ? widget.signupData.dietaryPreferences[0]
                              : "-",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Food List Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended Foods",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                // If no results
                if (filteredFoods.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Text(
                        "No foods found for \"$searchQuery\"",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),

                // Food cards
                ...filteredFoods.map((food) {
                  final benefits =
                      (food["benefits"] ?? []) as List<dynamic>; // null-safe
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.network(
                            food["image"]?.toString() ?? '',
                            width: 130,
                            height: 115,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food["name"]?.toString() ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  food["category"]?.toString() ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      food["score"]?.toString() ?? '-',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      food["impact"]?.toString() ?? '-',
                                      style: GoogleFonts.poppins(
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                // Benefits list
                                for (final benefit in benefits)
                                  Text(
                                    "• $benefit",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for a single metric
  Widget _metricCard({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
    String? subText,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: (MediaQuery.of(context).size.width - 64) / 2,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Colors.black,
                ),
              ),
              if (subText != null)
                Text(
                  '($subText)',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // BMI calculation
  String _calculateBMI(int weight, int height) {
    if (weight <= 0 || height <= 0) return "-";
    final h = height / 100.0;
    final bmi = weight / (h * h);
    return bmi.toStringAsFixed(1);
  }

  // BMI color based on category
  Color _bmiColor(int weight, int height) {
    if (weight <= 0 || height <= 0) return Colors.black;
    final h = height / 100.0;
    final bmi = weight / (h * h);
    if (bmi < 18.5) return Colors.yellow[700]!;
    if (bmi < 25) return Colors.green[700]!;
    if (bmi < 30) return Colors.orange[700]!;
    return Colors.red[700]!;
  }

  String _getBMICategory(int weight, int height) {
    if (weight <= 0 || height <= 0) return "-";
    final h = height / 100.0;
    final bmi = weight / (h * h);

    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }
}
