import 'package:ecommerce_firebase/ecommerce/controller/e_controller.dart';
import 'package:ecommerce_firebase/ecommerce/view/homeScreen/addProducts_screen.dart';
import 'package:ecommerce_firebase/ecommerce/view/homeScreen/viewProducts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EcommerceController controller = Get.put(EcommerceController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  controller.readUserData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      initialIndex: controller.tabIndex.value,
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage("${controller.userData['image']}"),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1,color: Colors.black54,),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${controller.userData['name']}")),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${controller.userData['email']}")),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("${controller.userData['phone']}")),
              ],
            ),
          ),
        ),
        appBar: AppBar(
        centerTitle: true,
        title: const Text("E-commerce",style: TextStyle(letterSpacing: 1),),
          bottom: TabBar(
              indicatorColor: Colors.white,
              onTap: (value) {
              controller.tabIndex.value=value;
              },
              tabs: const [
                Tab(
                    child: Center(
                        child: Text(
                          "Add Products",
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 15),
                        ))),
                Tab(
                    child: Center(
                        child: Text(
                          "View Products",
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 15),
                        ))),
              ]),
      ),
      body: TabBarView(
        children: [
          AddProductsScreen(),
          ViewProductsScreen()
        ],
      ),
      ),
    ));
  }
}
