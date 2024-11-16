import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:portfolio/Utils/scroll_manager.dart';  // Ensure ScrollManager is set up
export 'about.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final GlobalKey aboutKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          key: aboutKey,
          height:  500.h,
          color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      height: 400,
                    ),

                    SizedBox(width: 162.w,),
                    Text(
                      "Wagwan Peeps",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
        );
      },
    );
  }
}