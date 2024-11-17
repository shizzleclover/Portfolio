import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Providers/footerthemeprovider.dart';
import 'package:portfolio/Utils/constants.dart';
import 'package:provider/provider.dart';
export 'footer.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
    return Consumer<Footerthemeprovider>(
      builder: (context, footerthemeprovider, child){
        return Container(
          height: 250.h,
          color: footerthemeprovider.isLightMode ? AppColors.lightPar : Colors.black,

          child: Column(
            children: [
              Center(
                child: Text(
                  "data",
                  style: TextStyle(
                    color: footerthemeprovider.isLightMode ? AppColors.darkmode : AppColors.lightmode,
                  ),
                ),
              )
            ],
          ),

          
        );

      }
    );
  }
}