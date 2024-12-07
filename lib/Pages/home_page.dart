// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Components/footer.dart';
import 'package:portfolio/Pages/projects.dart';
import 'package:portfolio/Pages/resume.dart';
import 'package:portfolio/Pages/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:portfolio/components/navbar.dart';  // Import the Navbar component
import 'package:portfolio/Utils/scroll_manager.dart';  // Ensure ScrollManager is set up
import 'package:provider/provider.dart';
import 'package:portfolio/Providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          
          
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 60.h),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    // Home Section
                    Container(
                      key: homeKey,
                      padding: EdgeInsets.all(20.w),
                      height: 500.h,  // Set height for scrolling test
                      color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                    child: const Center(
                       child: Text(
                        'Home Page'
                       ),
                    ),

                    // child: Stack(
                    //   children:[
                    //     Container(
                    //       height: 500.h,
                    //       width:1025.w,
               //     //       decoration:BoxDecoration(
                    //         color: AppColors.darkmode,
                    //       )
                    //     )
                    //   ]
                    // ),

                      // child: Center(
                      //   child: Text(
                      //     'Home Section',
                      //     style: TextStyle(
                      //       fontSize: 24.sp,
                      //       fontWeight: FontWeight.bold,
                      //       color: themeProvider.isDarkMode ? AppColors.lightmode : AppColors.darkmode,
                      //     ),
                      //   ),
                      // ),

                    ),
                     SizedBox(height: 100.h,),
                    //Home
                    // About Section
                    Container(
                      key: aboutKey,
                      child: const AboutPage(),
                    ),
                    SizedBox(height: 100.h,),
                    // Projects Section
                    Container(
                       key: projectsKey,
                       child: const ProjectPage(),
                    ),
                    SizedBox(height: 100.h,),
                    //Todo: 0Services
                    // Services Section
                    Container(
                      key: servicesKey,
                       child: const ServicesPage(),
                    ),
                    SizedBox(height: 100.h,),

                    // Resume Section
                    Container(
                      key: resumeKey,
                        child: const ResumePage(),
                    ),
                    SizedBox(height: 100.h,),

                    Container(
                          child: const Footer(),
                    ),
                    //Footer
      
                    // Contact Section
                    // Container(
                    //   key: contactKey,
                    //   padding: EdgeInsets.all(20.w),
                    //   height: 500.h,
                    //  color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                    //   child: Center(
                    //     child: Text(
                    //       'Contact Section',
                    //       style: GoogleFonts.montserrat(
                    //         fontSize: 24.sp,
                    //         fontWeight: FontWeight.bold,
                    //         // color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Navbar(
                  homeKey: homeKey,
                  aboutKey: aboutKey,
                  projectsKey: projectsKey,
                  servicesKey: servicesKey,
                  resumeKey: resumeKey,
                  contactKey: contactKey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
