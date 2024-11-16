import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:provider/provider.dart';

export 'projects.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final GlobalKey projectsKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Container(
              key: projectsKey,
              height: 500.h,
              color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
              child: Column(
                children: [
                  Center(
                    child: Text("Create container card to display project"),
                  )
                ],
              ),
          );
        },
    );
  }
}