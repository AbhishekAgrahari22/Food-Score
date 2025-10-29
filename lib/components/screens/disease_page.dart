import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseasePage extends StatefulWidget {
  const DiseasePage({super.key});

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

const List<Map<String, dynamic>> diseaseData = [
  {
    "id": "1",
    "name": "Heart Health",
    "icon": "heart",
    "foodCount": 24,
    "topFoods": [
      {
        "name": "Salmon",
        "image":
            "https://images.unsplash.com/photo-1651326852735-7ba1e0f8364e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Avocado",
        "image":
            "https://images.unsplash.com/photo-1757332914587-6d3e174e0e19?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Almonds",
        "image":
            "https://images.unsplash.com/photo-1669219510558-56d14e7927b9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
  {
    "id": "2",
    "name": "Brain Function",
    "icon": "brain",
    "foodCount": 18,
    "topFoods": [
      {
        "name": "Blueberries",
        "image":
            "https://images.unsplash.com/photo-1578294178306-3997168f796d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Salmon",
        "image":
            "https://images.unsplash.com/photo-1651326852735-7ba1e0f8364e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Broccoli",
        "image":
            "https://images.unsplash.com/photo-1748792818634-a098347e540a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
  {
    "id": "3",
    "name": "Energy & Vitality",
    "icon": "energy",
    "foodCount": 22,
    "topFoods": [
      {
        "name": "Sweet Potato",
        "image":
            "https://images.unsplash.com/photo-1570723735746-c9bd51bd7c40?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Quinoa",
        "image":
            "https://images.unsplash.com/photo-1722882270502-4758cbd78661?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Spinach",
        "image":
            "https://images.unsplash.com/photo-1702488013418-10bae71d9991?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
  {
    "id": "4",
    "name": "Immune System",
    "icon": "immunity",
    "foodCount": 20,
    "topFoods": [
      {
        "name": "Yogurt",
        "image":
            "https://images.unsplash.com/photo-1571212515416-fef01fc43637?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Spinach",
        "image":
            "https://images.unsplash.com/photo-1702488013418-10bae71d9991?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Almonds",
        "image":
            "https://images.unsplash.com/photo-1669219510558-56d14e7927b9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
  {
    "id": "5",
    "name": "Fitness & Muscle",
    "icon": "fitness",
    "foodCount": 16,
    "topFoods": [
      {
        "name": "Protein",
        "image":
            "https://images.unsplash.com/photo-1535473895227-bdecb20fb157?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Salmon",
        "image":
            "https://images.unsplash.com/photo-1651326852735-7ba1e0f8364e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Quinoa",
        "image":
            "https://images.unsplash.com/photo-1722882270502-4758cbd78661?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
  {
    "id": "6",
    "name": "Vision Health",
    "icon": "vision",
    "foodCount": 14,
    "topFoods": [
      {
        "name": "Sweet Potato",
        "image":
            "https://images.unsplash.com/photo-1570723735746-c9bd51bd7c40?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Spinach",
        "image":
            "https://images.unsplash.com/photo-1702488013418-10bae71d9991?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
      {
        "name": "Salmon",
        "image":
            "https://images.unsplash.com/photo-1651326852735-7ba1e0f8364e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080",
      },
    ],
  },
];

class _DiseasePageState extends State<DiseasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 50,
              bottom: 16,
            ),
            color: const Color(0xFF030213),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Disease Management",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Best foods for specific health conditions",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: diseaseData.length,
              itemBuilder: (context, index) {
                final disease = diseaseData[index];
                final topFoods = disease['topFoods'] as List;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromRGBO(227, 227, 227, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(230, 230, 230, 1),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Icon(
                                _getDiseaseIcon(disease['icon'] ?? ''),
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      disease["name"] ?? "",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(237, 239, 242, 1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        "${disease["foodCount"]} foods",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Recommended foods for optimal health",
                                  style: GoogleFonts.poppins(
                                    color: Color.fromRGBO(113, 113, 130, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Horizontal list of top foods
                                SizedBox(
                                  height: 90,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: topFoods.length,
                                    itemBuilder: (context, foodIndex) {
                                      final food = topFoods[foodIndex];
                                      return Container(
                                        width: 80,
                                        margin: const EdgeInsets.only(right: 8),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                food["image"] ?? "",
                                                height: 70,
                                                width: 80,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              food["name"] ?? "",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

IconData _getDiseaseIcon(String iconName) {
  switch (iconName) {
    case 'heart':
      return Icons.favorite_outline;
    case 'brain':
      return Icons.psychology_outlined;
    case 'energy':
      return Icons.bolt_outlined;
    case 'immunity':
      return Icons.health_and_safety_outlined;
    case 'fitness':
      return Icons.fitness_center_outlined;
    case 'vision':
      return Icons.visibility_outlined;
    default:
      return Icons.local_hospital;
  }
}
