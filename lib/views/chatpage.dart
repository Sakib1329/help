import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:help/views/personalchat.dart';

import '../controllers/chatcontroller.dart';
import '../theme/color.dart';
import '../widgets/imageassets.dart';
import '../widgets/textwidget.dart';

class Chatpage extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text(
              'Messages',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            centerTitle: true,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),


          ),

          // Search Bar stays always visible after AppBar
          SliverToBoxAdapter(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                SizedBox(
                  height:85,
                  child: ListView.builder(
                    itemCount: controller.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[300],
                              child: ClipOval(
                                child: Image.asset(
                                  controller.images[index],
                                  fit: BoxFit.cover,
                                  width: 80, // match diameter of the circle
                                  height: 80,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              controller.names[index],
                              style: TextStyle(
                                color: AppColor.textGreyColor,

                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );

                    },
                  ),
                ),
SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: InputTextWidget(
                    onTap: () {
                
                    },
                    onChanged: (e) {},
                    borderColor: AppColor.lightGrey,
                    hintText: 'Search',
                    backgroundColor: AppColor.veryLightGray,
                    readOnly: true,
                    hintTextColor: AppColor.textGreyColor2,
                    leadingIcon: ImageAssets.search,
                    textColor: AppColor.textGreyColor2,
                    leading: true,
                    height: 48,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Chat History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.textGreyColor),),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

          // Chat List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Groupchat(name: controller.names[index], image: controller.images[index],),transition: Transition.rightToLeft);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.veryLightGray,
                        borderRadius: BorderRadius.circular(16),
                       border: Border.all(
                         color: AppColor.lightGrey
                       )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 28,

                            child: ClipOval(
                              child: Image.asset(
                                controller.images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.names[index],
                                  style: TextStyle(
                                    color: AppColor.textBlackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Thanks everyone',
                                  style: TextStyle(
                                    color: AppColor.greyTone,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '8:25 PM',
                                style: TextStyle(
                                  color: AppColor.greyTone,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColor.softRed,
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                );
              },
              childCount: controller.names.length,
            ),
          ),
        ],
      ),
    );
  }
}
