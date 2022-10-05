
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:toxi_app/Ui/Screen/User/swipe_liquid2.dart';
import 'package:toxi_app/Ui/Screen/User/swipe_liquid3.dart';
import 'package:toxi_app/Ui/Screen/User/swipe_liquid_1.dart';
import 'package:toxi_app/Ui/Screen/inicio.dart';
import '../../Data/Controller/local_noti.dart';

class SwipeLiquid extends StatelessWidget{

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
   
    return Stack(
          children: [SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
             child: Scaffold(
               body: LiquidSwipe(
                liquidController: controller,
                enableSideReveal: true,
                slideIconWidget: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                pages: [
                  swipeL1(),
                  //TUTORIAL
                  /*
                  Center(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Center(
                                child: Text('pagina uno', style: TextStyle(color: Colors.black),
                                        ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            RaisedButton(
                              //backgroundColor: Colors.blue,
                              child: Column(
                                children: [
                                  Icon(Icons.alarm, color: Colors.black,),
                                  Text("Week", style: TextStyle(color: Colors.white),),
                                ],
                              ), 
                              onPressed: (){
                              final LocalNoti noti = new LocalNoti();
                              noti.init();
                              //noti.showNotification();
                              noti.scheduleWeeklyNotification();
                            })
                          ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                
                                backgroundColor: Colors.white,
                                child: Icon(Icons.alarm_off_outlined, color: Colors.black,),
                                onPressed: (){
                                  final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.diario();
                                  print("presionado");
                                  //TODO: notificacion 5 seconds
                                })
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                color: Colors.red,
                                child: 
                                Text("cancelar"),
                                onPressed: (){
                                final LocalNoti noti = new LocalNoti();
                                  noti.init();
                                  //noti.scheduleDailyNotification();
                                  noti.cancelAllNotification();
                                  print("presionado en cancel");
                              })
                            ],
                          )
                        ],
                      ),
                      ),
                  ),
                  */
                  swipeL2(),

                  //PAGINA 3
                  swipeL3(),
                  ]
                ),
             ), 
           ),Positioned(
             bottom: 0,
             left: 16,
             right: 32,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 TextButton(
                   onPressed: () {
                     controller.jumpToPage(page: 2);
                   }, 
                   child: const Text('Ir a la pagina 3', style: TextStyle(color: Colors.black)),
                   ),

                  //ANIMATED SMOOTING *ELINADO*
                  /*
                    AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage, 
                  count: 3,
                  effect: const WormEffect(
                    spacing: 16,
                    dotColor: Colors.white,
                    activeDotColor: Colors.white, 
                  ),
                  onDotClicked: (index){
                    controller.animateToPage(page: index);
                  },
                  ),
                  */

                   TextButton(
                   onPressed: () {
                      final page = controller.currentPage + 1;

                      controller.animateToPage(
                        page: page > 4 ? 0 : page,
                        duration: 400,
                        );
                   }, 
                   child: const Text('Sig.', style: TextStyle(color: Colors.black))
                   ),
               ],
             ))
          ],
    );
  }
}