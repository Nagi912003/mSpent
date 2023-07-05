import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddTrans extends StatefulWidget {
  const AddTrans({Key? key, required this.addTx})
      : super(key: key);
  final Function addTx;
  @override
  State<AddTrans> createState() => _AddTransState();
}

class _AddTransState extends State<AddTrans> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final amountController = TextEditingController();

  File? GalleryImage;
  Future PickImage(ImageSource source) async {
    final GalleryImage = await ImagePicker().pickImage(source: source);
    if (GalleryImage == null) return;

    final imageTemporary = File(GalleryImage.path);
    this.GalleryImage = imageTemporary;
    setState(() => this.GalleryImage = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 180,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  child: MaterialButton(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 5,
                        //child: MaterialButton(
                        child: Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            child: GalleryImage != null
                                ? Image.file(
                                    GalleryImage!,
                                    width: 200,
                                    height: 200,
                                  )
                                : Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => PickImage(ImageSource.camera),
                  ),
                ),
              ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 230,
                        height: 55,
                        child: Card(
                          child: TextField(
                            //maxLength: 6,
                            maxLines: 1,
                            autofocus: false,
                            style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              labelText: 'name',
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            controller: nameController,
                            onSubmitted: (_) => submitData(),
                            //onChanged: (String name) {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: 230,
                        height: 55,
                        child: Card(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),
                            decoration: InputDecoration(
                              labelText: 'price',
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            controller: priceController,
                            onSubmitted: (_) => submitData(),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 55,
                          child: Card(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15),
                              decoration: InputDecoration(
                                labelText: 'amount',
                                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              controller: amountController,
                              onSubmitted: (_) => submitData(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: TextButton(
                              onPressed: () {
                                submitData();
                              },
                              child: Text(
                                'add',
                                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  void submitData() {
    final name = nameController.text;
    final price = double.parse(priceController.text);
    final amount = int.parse(amountController.text);

    if (name.isEmpty || price < 0 || amount <= 0) {
      return;
    }

    if(GalleryImage == null){
      widget.addTx(name, price, amount, null);
      Navigator.of(context).pop();
      return;
    }

    widget.addTx(name, price, amount, GalleryImage);
    Navigator.of(context).pop();
  }
}
