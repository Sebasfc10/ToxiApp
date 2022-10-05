import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MyVerticalList extends StatelessWidget {
  const MyVerticalList({ Key? key, 

  required this.productImg, 
  required this.productTitle, 
  required this.productDuration, 
  required this.productoRating}) 
  : super(key: key);

  final String productImg, productTitle, productDuration;
  final double productoRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
      ),
      child: SizedBox(
        height: 134,
        child: Stack
        (alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 92,
            width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 0,
                  blurRadius: 13,
                  offset: const Offset(0, 4),
                )
              ]
            ),
            ),

          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 9,
              top: 50,
              right: 0,
            ),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color : Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage(productImg),
                    )
                  )
                ),
                Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(productTitle,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),),
                    SizedBox(height: 1,),
                    Text(productDuration,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 12,
                    ),),
                    Padding(padding: EdgeInsets.only(bottom: 0)),
                    RatingBar.builder(
                      initialRating: productoRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _)=> const Icon(Icons.star, color: Color(0xFFF4C465),),
                      onRatingUpdate: (rating) {
                        print(rating);
                      }
                      ),
                  ],
                ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 26,
            right: 15,

            child: Container(
              height: MediaQuery.of(context).size.width * 0.10,
              width: MediaQuery.of(context).size.width * 0.10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent[400],
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ))
        ],
        ),
      ),
    );
  }
}