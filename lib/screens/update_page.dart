import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/update_product_ser.dart';
import 'package:store_app/widget/CustomTextInput.dart';

// ignore: must_be_immutable
class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = 'u';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName, desc, image;
  dynamic price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              elevation: 1,
              title: const Text(
                'Update',
                style: TextStyle(fontSize: 22),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 150,
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.title.substring(0, 8),
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xE52C2C2B)),
                          ),
                          Text(
                            r'$' '${product.price}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xE52C2C2B),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Image.network(
                        product.image,
                        width: 160,
                      ),
                    ],
                  ),
                ),
                  const SizedBox(
                  height: 20,
                ),  
                CustomTextInput(
                  hint: "Product Name",
                  preIcon: Icons.edit,
                  onChange: (data) {
                    productName = data;
                  },
                ),
                CustomTextInput(
                    keyboardType: TextInputType.number,
                    hint: "Price",
                    preIcon: Icons.edit,
                    onChange: (data) {
                      price = data;
                    }),
                CustomTextInput(
                    hint: "description",
                    preIcon: Icons.edit,
                    onChange: (data) {
                      desc = data;
                    }),
                CustomTextInput(
                    hint: "image",
                    preIcon: Icons.edit,
                    onChange: (data) {
                      image = data;
                    }),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      await updateProduct(product);
                      isLoading = false;
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 20)),
                    ),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
  }

  Future updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? '${product.price}' : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
