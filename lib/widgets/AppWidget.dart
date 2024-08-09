import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkapp/model/StoreApplication.dart';
import 'package:checkapp/screen/details.screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AppsWidget extends StatelessWidget {
  final StoreApplication app;
  const AppsWidget({super.key, required this.app });

  @override
  Widget build(BuildContext context) {
    return Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
                      url: app.url, title: app.title,
                    ),));
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: 3.w, right: 3.w, bottom: 6.sp,
                    top: 5.sp),
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: app.icon,
                          height: 38.sp,
                          width: 38.sp,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Icon(Icons.android, 
                            );
                          },
                          placeholder: (context, url) {
                            return Icon(Icons.android, 
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(app.title),
                        SizedBox(height: 2.sp),
                        Row(children: [
                          Icon(Icons.star,
                          size: 14.sp),
                          SizedBox(width: 0.5.w),
                          Text("${app.scoreText}"),
                          SizedBox(width: 3.5.w),
                          Icon(Icons.download,
                          size: 14.sp),
                          SizedBox(width: 0.5.w),
                          Text(NumberFormat.compact().format(app.maxInstalls)),
                        ],)
                      ],))
                      
                    ]),
                  ),
                ),
              );
  }
}
