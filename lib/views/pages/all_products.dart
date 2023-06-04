
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';
import '../widgets/show_product.dart';

class AllProductsScreen extends StatefulWidget {
  final String? categoryTitle;
  const AllProductsScreen({super.key, this.categoryTitle});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (widget.categoryTitle != null) {
      Provider.of<ProductProvider>(context, listen: false)
          .getCategoryProductsHandler(categoryTitle: widget.categoryTitle!);
    } else {
      Provider.of<ProductProvider>(context, listen: false)
          .getAllProductsHandler();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.categoryTitle != null ? widget.categoryTitle! : 'All Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(255, 24, 59, 25),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/3.png'), fit: BoxFit.cover)),
              
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.categoryTitle != null
                        ? ShowProductsWidget(
                            onRefresh: () {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .getCategoryProductsHandler(
                                      categoryTitle: widget.categoryTitle!);
                            },
                            products: Provider.of<ProductProvider>(
                              context,
                            ).categoryProducts,
                          )
                        : ShowProductsWidget(
                            onRefresh: () {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .getAllProductsHandler();
                            },
                            products: Provider.of<ProductProvider>(
                              context,
                            ).allProducts,
                          ),
                  ),
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}
