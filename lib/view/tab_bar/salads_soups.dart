import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodzee/controller/api_service/api_service.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/model/resturent.dart';

class SaladsAndSoups extends StatefulWidget {
  const SaladsAndSoups({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SaladsAndSoupsState createState() => _SaladsAndSoupsState();
}

class _SaladsAndSoupsState extends State<SaladsAndSoups> {
  late Future<List<CategoryModel>?> restaurantFuture;

  @override
  void initState() {
    super.initState();
    log('called');
    restaurantFuture = ApiService.getCategoryDishes();
    restaurantFuture.then((data) => log(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>?>(
      future: restaurantFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No data available');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var menu = snapshot.data![index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock_clock),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(menu.dishName.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price: ${menu.dishPrice} SAR'),
                              Text('Calories: ${menu.dishCalories}'),
                            ],
                          ),
                          Text(menu.dishDescription.toString()),
                          Container(
                            width: 108,
                            decoration: BoxDecoration(
                              color: kgreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                const Text('0'),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 50,
                      color: kgreen,
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
