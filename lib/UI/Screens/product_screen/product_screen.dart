import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:plants_mart/Core/Colors.dart';
import 'package:plants_mart/UI/Screens/detail_screen/detail_screen.dart';
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
    var heigthX = MediaQuery.of(context).size.height;
    var widthy = MediaQuery.of(context).size.width;
    final abc = Provider.of<Productlist>(context);
    int selectdCat = 1;
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
          chipStyle: const ChipStyle(
              notchSmoothness: NotchSmoothness.smoothEdge,
              background: Colors.green),
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
            Container(
              height: heigthX * 0.15,
              width: widthy * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Appcolor.secondarycolor,
              ),
              child: Center(
                child: ListTile(
                  leading: Column(
                    children: [
                      Text(
                        'Get',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthy * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '50% OFF',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthy * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1-20 October',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthy * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Image.asset('assets/images/plants90.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 210),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: widthy * 0.06),
              ),
            ),
            SizedBox(
              height: heigthX * 0.06,
              width: widthy * 0.9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: abc.plantsList.length,
                itemBuilder: (context, index) {
                  return Consumer<Productlist>(
                    builder: (context, vm, child) {
                      return InkWell(
                        onTap: () {
                          vm.setCat(index);
                        },
                        child: Card(
                          color: index == vm.index ? Color(0XFFB1C588) : null,
                          // margin: EdgeInsets.only(left: 10, top: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: Text(abc.plantsList[index]['title'],
                                  style: index == vm.index
                                      ? TextStyle(color: Colors.white)
                                      : null),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                child: GridView.builder(
                  itemCount: abc.plantsList[abc.index]['list'].length,
                  // itemCount: abc.plantsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 21,
                    mainAxisSpacing: 21,
                    crossAxisCount: 2,
                    // mainAxisExtent: 210,
                    childAspectRatio: 2 / 2.5,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                imageUrl: abc.plantsList[abc.index]['list']
                                    [index]['image'],
                                name: abc.plantsList[abc.index]['list'][index]
                                    ['title'],
                                descrption: abc.plantsList[abc.index]['list']
                                    [index]['description'],
                                price: abc.plantsList[abc.index]['list'][index]
                                    ['subtitle']),
                          ),
                        );
                      },
                      child: Container(
                        height: heigthX * 0.1,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //  mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100, top: 8),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: heigthX * 0.01,
                            ),
                            Image.asset(
                              abc.plantsList[abc.index]['list'][index]['image'],
                              height: heigthX * 0.1,
                              width: widthy * 0.3,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              height: heigthX * 0.09,
                              // width: widthy * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0XFFE6F7E4),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              child: ListTile(
                                title: Text(
                                  abc.plantsList[abc.index]['list'][index]
                                      ['title'],
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(abc.plantsList[abc.index]['list']
                                    [index]['subtitle']),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 17),
                                  child: Container(
                                    height: heigthX * 0.035,
                                    width: widthy * 0.07,
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
