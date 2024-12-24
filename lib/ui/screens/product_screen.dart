import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_rent_ui/common/asset_property/asset_path.dart';

import '../../common/color_property/app_colors.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(AssetPath.dreamsvillduplicate),
              const SizedBox(height: 24,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.ColorBlack,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text:
                  'The 3 level house that has a modern design, has a large patio, and a garage that fits up to four cars... ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // Default text color
                  ),
                  children: [
                    TextSpan(
                      text: 'Show More',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue, // Color for "Show More"
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Action when "Show More" is tapped
                          print('Show More tapped');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
