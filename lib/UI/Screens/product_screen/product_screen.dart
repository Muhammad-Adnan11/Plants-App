import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Screens/product_screen/product_screen_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final abc = Provider.of<Productlist>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomBarInspiredOutside(
          items: abc.items,
          backgroundColor: Colors.white,
          color: Colors.green,
          colorSelected: Colors.white,
          indexSelected: abc.stateindex,
          onTap: (int index) => setState(() {
            abc.stateindex = index;
          }),
          top: -28,
          animated: false,
          itemStyle: ItemStyle.circle,
          chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.smoothEdge),
        ),
      ),
      appBar: AppBar(
        title: Text('Search'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        centerTitle: true,
        shadowColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 26, left: 10, right: 60, bottom: 10),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.symmetric(
            //           //vertical: 20,
            //           ),
            //       hintText: 'Search',
            //       hintStyle: TextStyle(fontStyle: FontStyle.italic),
            //       prefixIcon: Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(60),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(60),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: GridView.builder(
                  itemCount: abc.plantlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 21,
                    mainAxisSpacing: 21,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: 900,
                      width: 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              abc.plantlist[index]['image'],
                            ),
                            //fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          //color: Colors.greenAccent,
                          border: Border.all(color: Colors.green)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: ListTile(
                              title: Text('bvv'),
                              subtitle: Text('nouman'),
                              trailing: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
