import 'package:flipkart_clone/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    List namestor = object.favoritename;
    List namestoreI = object.favoriteimage;
    List namestoreP = object.favoriteprice;

    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: namestor.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.white10, blurRadius: 10)
                ]),
                child: Card(
                  color: Colors.white24,
                  child: ListTile(
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(namestoreI[index]))),
                    ),
                    title: Text(
                      namestor[index],
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            namestoreP[index],
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    /*trailing: FloatingActionButton.extended(
                      onPressed: () {
                        object.favorites(namestoreI[index], namestor[index],
                            namestoreP[index]);
                      },
                      label: const Text('RemoveCart'),
                      backgroundColor: Colors.brown,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),*/
                  ),
                ),
              ),
            );
          }),

    );
  }
}
