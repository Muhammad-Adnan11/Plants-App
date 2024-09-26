import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                  child: StreamBuilder(
                      stream: abc.count(abc.index),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          // itemCount: abc.plantsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 21,
                            mainAxisSpacing: 21,
                            crossAxisCount: 2,
                            // mainAxisExtent: 210,
                            childAspectRatio: 2 / 2.5,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            var data = snapshot.data!.docs[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      imageUrl: data['image_url'],
                                      name: data['plant Name'],
                                      descrption: data['Plant Description'],
                                      price: data['Plant Price'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: heigthX * 0.1,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                        image: NetworkImage(data['image_url'])),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.green)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 100, top: 8),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.green,
                                      ),
                                    ),
                                   Padding(
                                     padding: const EdgeInsets.only(right: 110,bottom: 40),
                                     child: Column(
                                       children: [
                                         Icon(Icons.edit,
                                         color: Colors.green,
                                         ),
                                         Icon(Icons.delete,
                                           color: Colors.green,
                                         )
                                       ],
                                     ),
                                   ),
                                    SizedBox(
                                      height: heigthX * 0.01,
                                    ),

                                    Container(
                                      height: heigthX * 0.09,
                                      // width: widthy * 0.4,
                                      decoration: BoxDecoration(
                                        color: Color(0XFFE6F7E4),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          data['plant Name'],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: Text(
                                            data['Plant Price'].toString()),
                                        trailing: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 17),
                                          child: Container(
                                            height: heigthX * 0.035,
                                            width: widthy * 0.07,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
