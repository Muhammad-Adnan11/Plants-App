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
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 10, right: 60, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      //vertical: 20,
                      ),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: GridView.builder(
                  itemCount: abc.plantlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 21,
                    mainAxisSpacing: 21,
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    childAspectRatio: 2 / 8,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //     abc.plantlist[index]['image'],
                          //   ),
                          //   //fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                          //color: Colors.greenAccent,
                          border: Border.all(color: Colors.green)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100, top: 8),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Image.asset(
                            abc.plantlist[index]['image'],
                            height: 100,
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Container(
                            height: 57,
                            width: 138,
                            decoration: BoxDecoration(
                              color: Color(0XFFE6F7E4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              title: Text(
                                abc.plantlist[index]['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(abc.plantlist[index]['subtitle']),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 17),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
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