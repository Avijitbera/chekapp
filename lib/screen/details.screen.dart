import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkapp/utils/failed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../model/AppDetails.dart';
import '../repository/apps.repository.dart';
import '../widgets/sheets/login_sheets.dart';
import 'review.screen.dart';

class DetailsScreen extends StatefulWidget {
  final String url;
  final String? title;
  const DetailsScreen({super.key, required this.url, this.title });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  bool _loading = false;
  Failed? failed;
  AppDetails? _appDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getDetails();
    });
  }

  void getDetails()async{
    setState(() {
      _loading = true;
    });
    var result = await context.read<AppsRepository>().getAppDetails(widget.url);
    if(result.isRight()){
      var data = result.match((l) => null, (r) => r);
      _appDetails = data;
      setState(() {
      _loading = false;
    });
    }else{
      var data = result.match((l) => l, (r) => null);
      failed = data;
      setState(() {
      _loading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Loading..."),
      ),
      body: Builder(
        builder: (context) {
          if(_loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if(failed != null){
            return Center(
              child: Text("Failed"),
            );
          }else if(_appDetails != null){
            return ListView(children: [
                Container(
                  height: 25.h + 6.4.h,
                  child: Stack(
                    children: [
                      CachedNetworkImage(imageUrl: _appDetails!.headerImage,
                      height: 25.h,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,),
                  
                      Positioned(
                        bottom: 0,
                        
                        child: SizedBox(
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                  imageUrl: _appDetails!.icon,
                                  height: 60.sp,
                                  width:60.sp,
                                                        ),
                                ),

                                                      SizedBox(width: 3.w),
                                    Expanded(child: Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(_appDetails!.title,
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 12.sp
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                        Text(_appDetails!.developer,
                                        style: Theme.of(context).textTheme.bodySmall,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,)
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ))
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 4.w, right: 4.w, top: 5.sp),
                  child: Row(children: [
                    Expanded(child: Row(children: [
                      Icon(Icons.star,
                      size: 15.sp),
                      SizedBox(width: 2.sp),
                      Text("${_appDetails!.scoreText}(${NumberFormat.compact().format(_appDetails!.ratings)})")
                    ],)),
                    Expanded(child: Row(children: [
                      Icon(Icons.download,
                      size: 15.sp),
                      SizedBox(width: 2.sp),
                      Text(NumberFormat.compact().format(_appDetails!.maxInstalls))
                    ],)),
                    Expanded(child: Row(children: [
                      Icon(Icons.credit_card, size: 15.sp),
                      SizedBox(width: 2.sp),
                      Text("${_appDetails!.free ? 'Free' : '${_appDetails!.priceText}'}")
                    ],))
                  ],),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                  margin: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: FilledButton.icon(onPressed: (){}, icon: Icon(Icons.open_in_new), label: Text("Open in Play Store"))),
                SizedBox(height: 1.5.h,),
                Row(children: [
                  SizedBox(width: 2.w),
                  Text("Tags & Reviews",
                  style: Theme.of(context).textTheme.titleMedium),
                  Expanded(child: Divider(
                    endIndent: 1.w,
                    indent: 1.w,
                    thickness: 1.sp,
                  ))
                ],),

                Container(
                  margin: EdgeInsets.only(left: 3.w, right: 3.w,top: 3.sp),
                  height: 30.sp,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                      child: InkWell(
                         borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 4.sp, top: 4.sp),
                          child: Row(children: [
                            Icon(Icons.add, size: 17.sp,
                            color: Colors.white),
                            SizedBox(width: 3.sp),
                            Text("ADD", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)
                          ]),
                        ),
                      ),
                    );
                  },),
                ),

                SizedBox(height: 1.5.h),
                Container(
                  height: 24.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(children: [
                          Icon(Icons.star,
                          size: 40.sp),
                          SizedBox(width: 1.w),
                          Text("4.3",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 28.sp
                          )),
                          Spacer(),
                          Icon(Icons.person,
                          size: 30.sp),
                          SizedBox(width: 1.w),
                          Text("25.2K",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20.sp
                          ))
                        ],),
                      ),
                      Spacer(),
                      Padding(padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        Spacer(),
                      Material(borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          // showLoginModelSheet(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewScreen(),));
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSheet(),
                          // fullscreenDialog: true));
                        },
                        child: Padding(
                          padding:  EdgeInsets.all(12.sp),
                          child: Icon(Icons.add,
                          size: 20.sp),
                        ),
                      ),)
                      ]),)
                    ],
                  ),
                ),
 SizedBox(height: 1.5.h),
                 Row(children: [
                  SizedBox(width: 2.w),
                  Text("Screenshots",
                  style: Theme.of(context).textTheme.titleMedium),
                  Expanded(child: Divider(
                    endIndent: 1.w,
                    indent: 1.w,
                    thickness: 1.sp,
                  ))
                ],),
 SizedBox(height: 1.h),
                Container(
                  height: 34.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(imageUrl: _appDetails!.screenshots[index]));
                  }, separatorBuilder: (context, index) {
                    return SizedBox(width: 1.8.w,);
                  }, itemCount: _appDetails!.screenshots.length),
                ),
                 SizedBox(height: 1.5.h),

          ]);
          
          }else{
            return SizedBox();
          }
          
        }
      ),
    );
  }
}

