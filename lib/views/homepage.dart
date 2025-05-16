import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/cameracontroller.dart';
import '../theme/color.dart';
import '../widgets/imageassets.dart';

class Homepage extends StatelessWidget {
  final BottomSheetController bs=Get.put(BottomSheetController());
   Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
          
                    decoration: BoxDecoration(
                        color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 8
                      )
                    ),
                    child: Stack(
                      children: [
                        Obx(() {
                          final file = bs.pickedImage.value;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: file != null
                                ? Image.file(
                              file,
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                            )
                                : Container(
                              width: 110,
                              height: 110,
                              color: AppColor.palePink,
                              child: Image.asset(
                                'assets/images/img.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                        Positioned(
                          bottom: 0,
                          top: 75,
                          right: 35,
                          child: Container(
                           width: 35,
                            height: 35,
                            decoration: BoxDecoration(
          color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                              'assets/icons/edit.svg'
                                ,
                              width: 20,
                                height: 20,


                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Sajib(28)',
                          style: TextStyle(
                            color: AppColor.textBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Ui/Ux Designer',
                          style: TextStyle(
                            color: AppColor.greyTone,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
          
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.softRed,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top:8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  height: 25,
                                  width: 25,
                                  color: AppColor.whiteTextColor,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                'Pending',
                                style: TextStyle(
                                  color: AppColor.whiteTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
           Row(
             children: [
               Text(
                 'About Me',
                 style: TextStyle(
                   color: AppColor.greyTone,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ),
               ),
               SizedBox(width: 10,),
               Image.asset('assets/images/img_1.png',height: 20,),
             ],
           ),
                  Row(
                    children: [
                      Text(
                        'BD, Chittagong',
                        style: TextStyle(
                          color: AppColor.greyTone,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/icons/location.svg',height: 20,),
                    ],
                  ),
          
                ],
              ),
              SizedBox(height: 5,),
              Text(
                'Amazon Alexa Shopping is seeking a talented, experienced, and self-directed UX Designer to define and drive the future of shopping at Amazon. The ideal candidate is an end-to-end UX Designer with strong visual design skills. They are passionate and have experience designing for new and ambiguous technologies. They have proven ability to motivate through vision and a desire to inspire ',
                style: TextStyle(
                  color: AppColor.greyTone,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Gallery',
                style: TextStyle(
                  color: AppColor.greyTone,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
          
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: 10.0,top: 8.2,bottom: 8,),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
          
                          color: Colors.black, // Background color if image fails to load
                          child: Image.asset(
                            'assets/images/chat/img_4.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    'My Interest',
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/img_1.png',height: 20,),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Basket ball',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gym',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Basket ball',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Swimming',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    'Languages',
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/img_1.png',height: 20,),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'English',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bangla',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hindi ',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
          
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColor.softBlueGrey,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Arabic',
                        style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
