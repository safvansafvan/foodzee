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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var menu = snapshot.data![index];

              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Icon(Icons.lock_clock),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.dishName.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${menu.dishCurrency}: ${menu.dishPrice}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  'Calories: ${menu.dishCalories}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          commonHeight,
                          Text(
                            menu.dishDescription.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: kgrey),
                          ),
                          commonHeight,
                          Container(
                            alignment: Alignment.topLeft,
                            constraints: const BoxConstraints(
                                maxWidth: 130, minWidth: 108, maxHeight: 43),
                            decoration: BoxDecoration(
                              color: kgreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: kwhite,
                                  ),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color: kwhite,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add, color: kwhite),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(menu.dishImage))),
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
