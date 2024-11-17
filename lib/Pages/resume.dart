import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:provider/provider.dart';

export 'resume.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final GlobalKey resumeKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
    return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child){
              return Container(
                key:  resumeKey,
                height: 500.h,
                color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
                child: Column(
                  children: [
                    Center(
                      child: Text( " Create Resume Page " ),
                    )
                  ],
                ),
              );
      } 
    );
  }
}