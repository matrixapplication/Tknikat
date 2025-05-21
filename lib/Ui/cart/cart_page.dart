// import 'package:bot_toast/bot_toast.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:taknikat/Ui/cart/provider.dart';
//
// import '../../core/constent.dart';
// import '../../model/product_model/product_model.dart';
//
// class MyCart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               child: _CartList(),
//             ),
//             const Divider(height: 4, color: Colors.black),
//             _CartTotal()
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _CartList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var cartProvider = context.watch<CartProvider>();
//     if (cartProvider.flutterCart.cartItem.isEmpty) {
//       return Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.shopping_cart_outlined),
//           Text('No items in cart'),
//         ],
//       ));
//     }
//     return ListView.builder(
//       itemCount: cartProvider.flutterCart.cartItem.length,
//       itemBuilder: (context, index) {
//         var item = cartProvider.flutterCart.cartItem[index];
//         var image = (item.productDetails as ProductModel).featuredImage;
//         return ListTile(
//           leading: CircleAvatar(
//               radius: 44,
//               backgroundImage: (image?.isEmpty ?? true
//                       ? AssetImage("assets/images/profile.png")
//                       : CachedNetworkImageProvider(getImagePath(image!)))
//                   as ImageProvider),
//           trailing: IconButton(
//             icon: const Icon(Icons.remove_circle_outline),
//             onPressed: () {
//               cartProvider.decrementItemFromCartProvider(index);
//             },
//           ),
//           title: Column(
//             children: [
//               Text(
//                 item.productName.toString(),
//               ),
//               Text(
//                 '(${item.quantity})',
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _CartTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var cartProvider = context.watch<CartProvider>();
//
//     return SizedBox(
//       height: 50,
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<CartProvider>(
//                 builder: (context, cart, child) => Text(
//                       '\$${cart.getTotalAmount().toString()}',
//                     )),
//             const SizedBox(width: 24),
//             TextButton(
//               onPressed: cartProvider.flutterCart.cartItem.isNotEmpty
//                   ? () async {
//                       BotToast.showLoading();
//                       await Future.delayed(Duration(seconds: 2));
//                       cartProvider.deleteAllCartProvider();
//                       BotToast.showText(text: 'Done!');
//                       BotToast.closeAllLoading();
//                     }
//                   : null,
//               child: const Text('BUY'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
