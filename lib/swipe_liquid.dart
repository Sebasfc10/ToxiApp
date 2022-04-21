
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:toxi_app/inicio.dart';
import 'local_noti.dart';

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
                  color: Colors.white,
                ),
                pages: [
             
                  //TUTORIAL
                  Center(
                    child: Container(
                      color: Colors.green,
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
                                
                                backgroundColor: Colors.blue,
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
             
             
                  Container(
                    color: Colors.white,
                    child:
                    Center(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
                   }, 
                   child: const Text('inicio', style: TextStyle(color: Colors.black),),
                   ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Pagina dos", textAlign: TextAlign.center,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
              ),
                  
             
             
                  Container(
                    color: Colors.blue,
                    child: const Center(child: Text('pagina tres', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
                  ),
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
                   child: const Text('Omitir'),
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
                   child: const Text('Sig.')
                   ),
               ],
             ))
          ],
    );
  }
}