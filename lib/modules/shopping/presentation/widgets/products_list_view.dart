import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motors/modules/shopping/presentation/logic/shopping_products_cubit/shopping_products_cubit.dart';
import 'package:motors/modules/shopping/presentation/widgets/shopping_product_widget.dart';

// ignore: must_be_immutable
class ProductsListView extends StatefulWidget {
  ProductsListView({
    required this.category,
    super.key,
  });
  String category;
  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShoppingProductsCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingProductsCubit, ShoppingProductsState>(
      builder: (context, state) {
        if (state is ShoppingProductsSuccess) {
          return SizedBox(
            height: 410,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 items per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75, // Adjust to change item height/width
              ),
              itemCount: BlocProvider.of<ShoppingProductsCubit>(context)
                  .getProducts(widget.category)
                  .length,
              itemBuilder: (context, index) {
                return ShoppingProductWidget(
                  productModel: BlocProvider.of<ShoppingProductsCubit>(context)
                      .getProducts(widget.category)[index],
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
