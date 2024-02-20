import 'package:core_exam/util/lists/cart.dart';
import 'package:flutter/material.dart';

import '../../util/color/theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

late double height;
late double width;
double totalAmt = 0;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;


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
                      Container(
                        margin: EdgeInsets.all(10),
                        height: height / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          border: Border.all(color: Colors.grey.withOpacity(0.2))
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(10),
                                  color: Colors.grey.withOpacity(0.2)
                                ),
                                child: ClipRRect(
                                  child: Image.asset(cartList[0]['img']),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 14.0, left: 14, right: 14),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cartList[0]['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                            const Icon(Icons.delete, size: 20, color: Colors.grey,)
                                          ],
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(top: 0.0, left: 14, right: 14),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cartList[0]['category'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(14),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),



                                              Text('${cartList[0]['quantity']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),


                                              IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),



          //BOTTOM BAR
          Container(
            height: 200,
            width: width,
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal: ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),),
                    Text('$totalAmt Rs.', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                  ],
                ),


                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery fee: ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),),
                    Text('0 Rs.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                  ],
                ),

                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total: ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),),
                    Text('$totalAmt Rs.', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                  ],
                ),

                ElevatedButton(
                  onPressed: (){

                    setState(() {

                    });

                  },
                  child: Text('Check out!', style: TextStyle(color: primaryGreen)),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }


}

double getTotal(){

  double totalAmt = 0;

  for(int i = 0; i < cartList.length; i++){

    totalAmt += (cartList[i]['price'] * cartList[i]['quantity']);

  }

  return totalAmt;

}
