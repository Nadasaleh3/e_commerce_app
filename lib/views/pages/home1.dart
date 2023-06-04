import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:e_commerce_app/helpers/app_dialog.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/views/pages/all_products.dart';
import 'package:e_commerce_app/views/pages/check_out.dart';
import 'package:e_commerce_app/views/widgets/category_card.dart';
import 'package:e_commerce_app/views/widgets/show_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  
  const Home({super.key});

  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user =FirebaseAuth.instance.currentUser!;
  late VideoPlayerController controller;
  
  
  @override
  void initState() {
     loadVideoPlayer();
      controller.play();
    // Provider.of<ProductProvider>(context, listen: false)
    //     .getHomeProductsHandler();
    
    super.initState();
  }
 loadVideoPlayer(){
     controller = VideoPlayerController.asset('assets/v.mp4');
     controller.addListener(() {
        setState(() {});
     });
//  controller.play();
    controller.initialize().then((value){
      
       controller.play();
        setState(() {});
    });

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 24, 59, 25),
        title: Text(
          'Find your Match Style .',
          style: GoogleFonts.akayaKanadaka(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Provider.of<ProductProvider>(context).productSelected !=
                        null &&
                    (Provider.of<ProductProvider>(context)
                            .productSelected
                            ?.isNotEmpty ??
                        false))
                ? badges.Badge(
                    position: BadgePosition.topStart(),
                    badgeContent: Text(
                      Provider.of<ProductProvider>(context)
                          .productSelected!
                          .length
                          .toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const CheckOutPage()));
                        },
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        )),
                  )
                : IconButton(
                    onPressed: () {
                      AppDialog.showDialogEx(
                        context,
                        title: 'Add Product First',
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    )),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/3.png'), fit: BoxFit.cover)),
      child:SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //video
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Container( 
            child: Column(
              children:[
                
                  AspectRatio( 
                    aspectRatio: 5/ 6,
                    
                    // aspectRatio: controller.value.aspectRatio,
                    
                     child: VideoPlayer(controller),
                  ),

     

                  
              ],),
                ),
             
              ),
              Text(
                'Categories : ',
                style: GoogleFonts.akayaKanadaka(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: Provider.of<ProductProvider>(context)
                          .categoriesData1
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryCard(
                                    title: e['title']
                                    , image: e['image']),
                              ))
                          .toList(),
                    ),
                  ),
              
                
                  Row(
                    children: [
                      Text(
                      'Wanna see All product ? ',
                      style: GoogleFonts.akayaKanadaka(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllProductsScreen()));
                        },
                        child: Text(
                          'Click Here->',
                          style: GoogleFonts.akayaKanadaka(
                              color: const Color.fromARGB(255, 24, 59, 25),
                              fontWeight: FontWeight.w400,
                              fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
