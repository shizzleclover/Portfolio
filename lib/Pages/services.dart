import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:provider/provider.dart';


export 'package:flutter/services.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final GlobalKey servicesKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          key: servicesKey,
          height: 500.h,
        color: themeProvider.isDarkMode ? AppColors.darkmode : AppColors.lightmode,
        child:const Column(
          children: [   
              Center(
                child: Text("Create Services Card"),
              )
          ],
        ),
        );
      }
    );
      }
  }