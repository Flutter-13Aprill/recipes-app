import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.discrib,
    required this.imagePath,
    required this.productImage,
    required this.productName,
    required this.productDiscrip,
    required this.showService,
  });

  final String title;
  final String discrib;
  final String imagePath;
  final String productImage;
  final String productName;
  final String productDiscrip;
  final bool showService;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isCheck1 = false;
  bool isCheck2 = false;
  int selectedValue = 0; //for counter package
  int counterValue = 0; //for counter package

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(47, 255, 255, 255),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.discrib,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "0 SR",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.imagePath),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 70,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 106,
                      top: 72,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                initialChildSize: 0.75,
                                maxChildSize: 0.9,
                                minChildSize: 0.5,
                                expand: false,
                                builder: (context, scrollController) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return ListView(
                                        controller: scrollController,
                                        padding: EdgeInsets.only(
                                          top: 16,
                                          left: 16,
                                          right: 16,
                                          bottom:
                                              MediaQuery.of(
                                                context,
                                              ).viewInsets.bottom +
                                              16,
                                        ),
                                        children: [
                                          Image.asset(
                                            widget.productImage,
                                            width: 400,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            widget.productName,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(widget.productDiscrip),
                                          const SizedBox(height: 20),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                78,
                                                245,
                                                237,
                                                237,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    "How many items?",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),

                                          // Services checkboxes
                                          if (widget.showService == true) ...[
                                            //we have to put ... because it has widgets
                                            Container(
                                              height: 70,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                  78,
                                                  245,
                                                  237,
                                                  237,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Expanded(
                                                    child: Text(
                                                      "Choose the service",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  value: isCheck2,
                                                  onChanged: (value) {
                                                    setModalState(
                                                      () => isCheck2 = value!,
                                                    );
                                                  },
                                                ),
                                                const Text("Wash"),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  value: isCheck1,
                                                  onChanged: (value) {
                                                    setModalState(
                                                      () => isCheck1 = value!,
                                                    );
                                                  },
                                                ),
                                                const Text("Iron"),
                                              ],
                                            ),
                                          ],
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Add to cart'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 4.0, left: 2),
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
