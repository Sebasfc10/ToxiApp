import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_vertical.dart';
import 'my_horizontal.dart';

class PageHome extends StatefulWidget{

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String pathImage = "lib/assets/camisa.png";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          physics: const BouncingScrollPhysics(),
          children: [
            //SCROLL HORIZONTAL
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FRANCÉS TÓXICO', style: GoogleFonts.roboto(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
                Text('Idiomas Disponibles',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),)
              ],
            ),
            const SizedBox(height: 22),
            //CREAR UN SCROLL HORIZONTAL <CARD>
            SizedBox(height: 349,
            child: ListView.builder(
              itemCount: 1,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
              const MyHorizontalList(
                startColor: 0xFFFFFFFF, 
                endColor: 0xFFFFFFFF, 
                courseTag: 'Recomendado', 
                courseTitle: 'Francés Básico', 
                courseImg: 'lib/assets/camisa.png'),
                
                // ignore: prefer_const_constructors
                MyHorizontalList(
                startColor: 0xFFFFFFFF, 
                endColor: 0xFFFFFFFF, 
                courseTag: 'Proximamente', 
                courseTitle: 'Inglés Básico', 
                courseImg: 'lib/assets/inglest.png'),
                ],

              );
            }
            ),
            ),
            //SCROLL VERTICAL
            const SizedBox(height: 34),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Novedades', style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
                Text('Recomendados para ti de parte de Francés Tóxico',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 14,
                ),)
              ],
            ),
           ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const MyVerticalList(
                    productImg: 'lib/assets/camisa.png', 
                    productTitle: 'Francés Tóxica', 
                    productDuration: '3 meses', 
                    productoRating: 5.0),

                    const MyVerticalList(
                    productImg: 'lib/assets/inglest.png', 
                    productTitle: 'Inglés Tóxico', 
                    productDuration: '3 meses', 
                    productoRating: 5.0),
                    ]
                  );
                })
          ],
        ),
      ),
    );
  }
}