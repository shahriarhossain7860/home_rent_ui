import 'package:flutter/material.dart';
import 'package:home_rent_ui/common/asset_property/asset_path.dart';
import 'package:home_rent_ui/common/color_property/app_colors.dart';
import 'package:home_rent_ui/common/iconPath/icon_path.dart';
import 'package:home_rent_ui/app/data/house_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSegment = 'House';
  List<String> segments = ['House', 'Apartment', 'Hotel', 'Villa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                      color: AppColors.colorAsh,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    Text(
                      'Jakarta',
                      style: TextStyle(
                          color: AppColors.ColorBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search address, or near you',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: AppColors.searchBarColor,
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(10),
                        // Rounded corners
                        border: Border.all(
                          color: Colors.blue, // Blue border
                          width: 1, // Border width
                        ),
                      ),
                      child: Center(
                        child: Image.asset(IconPath.icFilter),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 34,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: segments.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSegment = segments[index];
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: selectedSegment == segments[index]
                                ? AppColors.containerColor
                                : AppColors.searchBarColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.searchBarColor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              segments[index],
                              style: TextStyle(
                                color: selectedSegment == segments[index]
                                    ? Colors.white
                                    : AppColors.selectedColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Near from you',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.ColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'See more',
                      style: TextStyle(fontSize: 12, color: AppColors.colorAsh),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset(AssetPath.deamsvilljpg),
                      Image.asset(AssetPath.ascotHouse)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Best for you',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.ColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'See more',
                      style: TextStyle(fontSize: 12, color: AppColors.colorAsh),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: houseList.length,
                  itemBuilder: (context, index) {
                    // itemBuilder function starts here
                    final house = houseList[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(house['image'],
                                width: 80, height: 80, fit: BoxFit.cover),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(house['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(house['price']),
                                  Row(
                                    children: [
                                      Icon(Icons.bed),
                                      Text(house['bedrooms']),
                                      SizedBox(width: 8),
                                      Icon(Icons.bathroom),
                                      Text(house['bathrooms']),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
