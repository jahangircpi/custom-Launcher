

import 'package:custom_launcher/controller.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(appscontroller());

    changingicon(index) {
      if (controller.applists.value[index].packageName ==
          "com.google.android.dialer") {
        return Image.asset("images/phone1.png");
      } else if (controller.applists.value[index].packageName ==
          "com.android.vending") {
        return Image.asset("images/playstore3.png");
      } else {
        return Image.memory(controller.applists.value[index].icon);
      }
    }
    var threshold=100;

    return Scaffold(  body: SafeArea(
      child: Stack(
        children: [
          Container(height: size.height,width: size.width,child: Image.asset("images/backgroundimage1.jpg",fit: BoxFit.cover,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Obx(() {
              try {
                return GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 1,
                  children:
                      List.generate(controller.applists.value.length, (index) {
                    print(controller.applists[43].packageName);
                    print(controller.applists[25].packageName);

                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          DeviceApps.openApp(
                              controller.applists[index].packageName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(child: changingicon(index)),
                                Wrap(
                                  children: [
                                    Text(
                                        controller.applists.value[index].appName,style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              } catch (e) {
                return Center(
                  child: Text("It's Loading"),
                );
              }
            })),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child:

               GlassContainer.frostedGlass(
                    height: size.height,
                 width: size.width * 0.15,
                    child:  Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            DeviceApps.openApp(
                                controller.applists[43].packageName);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "images/phone1.png",
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "images/playstore3.png",
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),),
                  
               
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
    controller.showbottombar.value==false?  Positioned(
        bottom: 0,
        left: 0,

        child: Container(
          width: size.width,
          color: Colors.blue,child: Text("hllo"),),):Container()
        
        
        ],
      ),
    ));
  }


bottombar(size){
return BottomAppBar(
child: Container(height: size.height*0.4,color: Colors.red,),

);


}




}



