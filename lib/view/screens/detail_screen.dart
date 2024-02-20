import 'package:core_exam/util/color/theme.dart';
import 'package:core_exam/util/lists/cart.dart';
import 'package:core_exam/util/lists/products.dart';
import 'package:core_exam/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

int productIndex = 0;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xfff1f3f2),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
        ],
      ),


      body: Column(
        children: [
          Expanded(
              child: Container(
                color: const Color(0xfff1f3f2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //IMAGE OF PRODUCT
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: const Color(0xfff1f3f2)
                        ),
                        child: ClipRRect(
                          child: Image.asset(products[productIndex]['img']),
                        ),
                      ),


                      //PRODUCT DISCRIPTION
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: const Color(0xfff1f3f2)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                      child: Text(products[productIndex]['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                                  ),

                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(20),
                                        color: const Color(0xffed4141),
                                      ),
                                      child: const Text('% On sale', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.circular(20),
                                      border: Border.all(color: Colors.grey.withOpacity(0.5))
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.thumb_up, color: Colors.blueAccent,),
                                        Text('  99%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.all(8),

                                    alignment: Alignment.center,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(20),
                                        border: Border.all(color: Colors.grey.withOpacity(0.5))
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star_half, color: Colors.amber,),
                                        Text('  4.8', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding: const EdgeInsets.all(8),

                                    alignment: Alignment.center,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(20),
                                        border: Border.all(color: Colors.grey.withOpacity(0.5))
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.remove_red_eye,),
                                        Text(' 480053 reviews', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                              child: Text(products[productIndex]['description']),
                            )

                          ],
                        )
                      ),
                    ],
                  ),
                ),
              )
          ),



          //BOTTOM BAR
          Container(
            height: 80,
            width: width,
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: ElevatedButton(
              onPressed: (){

                setState(() {
                  if(products[productIndex]['quantity'] == 0){
                    products[productIndex]['quantity'] = 1;
                    products[productIndex]['inCart'] = true;
                    cartList.add(products[productIndex]);
                  }
                });

              },
              child: (!products[productIndex]['inCart']) ?  Text('Add to cart', style: TextStyle(color: primaryGreen),) : Text('Added!', style: TextStyle(color: primaryGreen)),
            ),
          ),
        ],
      ),

    );
  }
}
