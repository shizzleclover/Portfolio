import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:portfolio/components/navbar.dart';  // Import the Navbar component
import 'package:portfolio/Utils/scroll_manager.dart';  // Ensure ScrollManager is set up
import 'package:provider/provider.dart';
import 'package:portfolio/Providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  // GlobalKeys for each section
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey resumeKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          
          
          body: SingleChildScrollView(
            child: 
            
            
            
            Column(
              children: [
                  Navbar(
              homeKey: homeKey,
              aboutKey: aboutKey,
              projectsKey: projectsKey,
              servicesKey: servicesKey,
              resumeKey: resumeKey,
              contactKey: contactKey
                  ),
                // Home Section
                Container(
                  key: homeKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,  // Set height for scrolling test
                  color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'Home Section',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? AppColors.lightmode : AppColors.darkmode,
                      ),
                    ),
                  ),
                ),
                // About Section
                Container(
                  key: aboutKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,
                color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'About Section',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Projects Section
                Container(
                  key: projectsKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,
                  color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'Projects Section',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Services Section
                Container(
                  key: servicesKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,
                  color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'Services Section',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Resume Section
                Container(
                  key: resumeKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,
                 color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'Resume Section',
                      style: GoogleFonts.montserrat(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Contact Section
                Container(
                  key: contactKey,
                  padding: EdgeInsets.all(20.w),
                  height: 500.h,
                 color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                  child: Center(
                    child: Text(
                      'Contact Section',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
