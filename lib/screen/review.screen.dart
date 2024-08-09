import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Theme.of(context).primaryColor)
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                                 initialRating: 3,
                                 minRating: 1,
                                 direction: Axis.horizontal,
                                 allowHalfRating: true,
                                 itemCount: 5,
                                 itemSize: 40.sp,
                                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                 itemBuilder: (context, _) => Icon(
                   Icons.star,
                   color: Colors.amber,
                                 ),
                                 onRatingUpdate: (rating) {
                   print(rating);
                                 },
                              ),
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Review",
                    hintText: "Enter your review",
                    
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 1.w, right: 1.w, 
                    bottom: 5.sp, top: 5.sp)
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(children: [
                                 Spacer(),
                                 FilledButton.icon(onPressed: (){},
                                  icon: Icon(Icons.reviews), label: Text("Review"))
                               ],),
                 )
              ],
            ),
          ),
         
        ]),
      ),
    );
  }
}

