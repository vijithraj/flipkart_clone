

import 'package:flipkart_clone/home_page.dart';
import 'package:flipkart_clone/model_class.dart';
import 'package:flutter/material.dart';

class Buy extends StatelessWidget {
  final ListData imageData;
  const Buy( {Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Home()));
        },icon: Icon(Icons.arrow_back ),

        ),
      ),

      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image:
                AssetImage(imageData.imagepath))
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      child: Text("Buy"),
                      onPressed: () {
                        style:
                          ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ));
                        }
                      ),
                ),
              ),
              const SizedBox(width: 30,),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                    child: Text("Add to cart"),
                    onPressed: () {
                      style:
                      ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ));
                    }
                ),
              ),
            ],


          )

        ],
      ),
    );
  }
}
