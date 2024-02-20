
import 'package:core_exam/util/lists/brands.dart';
import 'package:core_exam/util/lists/products.dart';
import 'package:core_exam/view/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../util/color/theme.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


late double height;
late double width;
String selectedBrand = 'All';


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(


      //APP BAR OF THE APP
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            height: 50,
            width: 48,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 8, bottom: 10),
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  child: Container(
                    height: 18,
                    width: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadiusDirectional.circular(100)),
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100),
                        border: Border.all(color: Colors.grey)),
                    child: IconButton(
                      onPressed: ()async {
                        totalAmt = getTotal();
                        String? refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));

                        if(refresh == "refresh"){
                          setState(() {

                          });
                        }
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),


      //BODY OF THE APP
      body: SingleChildScrollView(
        child: Column(
        
          children: [
        
        
            //SEARCH BOX
            searchBar(),
        
            //DISCOUNT BANNER
            discountBanner(),

            //PRODUCT TITLE
            productTitles(),

            //BRANDS BUTTON
            brandsButtons(),

            //PRODUCT GRID
            addProductGrid(),
        
          ],
        ),
      ),

    );
  }


  //SEARCH BOX
  Widget searchBar(){

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      height: height / 14,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xfff1f3f2),
          borderRadius: BorderRadiusDirectional.circular(20)
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
          Icon(Icons.search, color: Colors.grey, size: 24,)
        ],
      ),
    );

  }


  //DISCOUNT BANNER
  Widget discountBanner() {
    return Container(
      height: height / 5,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadiusDirectional.circular(20)
      ),

      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //CLEARANCE SALES
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Clearance', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),),
                      Text("Sales", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),

                  //DISCOUNT BUTTON
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    child: Text('% Up to 50%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryGreen),),
                  )
                ],
              ),
            ),
          ),


          //OFFER IPHONE IMAGE
          Expanded(
            child: ClipRRect(
              child: Image.asset('asset/images/home/iphone.png', fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }


  //PRODUCT TITLE
  Widget productTitles() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            'See all',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: primaryGreen),
          ),
        ],
      ),
    );
  }


  //BRAND LIST BUTTONS
  Widget brandsButtons(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(brands.length, (index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ElevatedButton(
              onPressed: (){
                selectedBrand = brands[index];
                setState(() {

                });
              },
              child: Text(
              brands[index],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: primaryGreen),
            ),),
          )),
        ],
      ),
    );
  }

  //PRODUCT LIST
  Widget addProductGrid(){
    return GridView.extent(
      maxCrossAxisExtent: 230,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      shrinkWrap: true,
      children: List.generate(products.length, (index) => (selectedBrand == 'All') ? productBox(index) : (selectedBrand == products[index]['category'] ? productBox(index) : Container())),
    );
  }

  Widget productBox(int index){
    return GestureDetector(
      onTap: ()async {
        productIndex = index;
        String? refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen()));

        if(refresh == "refresh"){
          setState(() {

          });
        }
      },
      child: Container(
        height: height / 5,
        decoration: BoxDecoration(
            color: const Color(0xfff1f3f2),
            borderRadius: BorderRadiusDirectional.circular(20)
        ),
        child: Column(
          children: [

            //PRODUCT IMAGE
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: const Color(0xfff1f3f2)
                ),
                child: ClipRRect(
                  child: Image.asset(products[index]['img']),
                ),
              ),
            ),

            //PRODUCT DATA
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadiusDirectional.circular(8)
              ),
              child: Column(
                children: [

                  //NAME AND RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index]['name'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey.shade600),),
                      const Row(
                        children: [
                          Icon(Icons.star_half, color: Colors.amber, size: 20,),
                          Text('4.5', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
                        ],
                      ),

                    ],
                  ),

                  //PRICE
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text('${products[index]['price']} Rs.', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
