import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khuthon/home/sub/item_tile.dart';
import 'package:khuthon/home/sub/search_field.dart';
import 'package:khuthon/loading/loading_page.dart';
import 'package:khuthon/result/result_page.dart';
import 'package:khuthon/services/api_service.dart';
import 'package:khuthon/widgets/custom_scaffold.dart';
import 'package:khuthon/widgets/minor_ui_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController companyTEC = TextEditingController();
  final TextEditingController productTEC = TextEditingController();

  dynamic fetchedData;

  @override
  void initState() {
    super.initState();
    fetchDataFromService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      companyTEC.clear();
      productTEC.clear();
    });
  }

  @override
  void dispose() {
    super.dispose();
    companyTEC.dispose();
    productTEC.dispose();
  }

  void fetchDataFromService() async {
    ApiService apiService = ApiService();
    apiService.fetchData();
    try {
      var data = await apiService.fetchData();
      setState(() {
        fetchedData = data;
      });
    } catch (e) {
      log('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final String companyName = fetchedData['company'];
    // final String productName = fetchedData['product'];
    // final bool isCertified = fetchedData['product'];


    return CustomScaffold(
      // appBar: mainAppbar(showTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 72),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'How Green?',
                    style: TextStyle(
                        fontSize: 46, fontFamily: 'Modak', color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  searchButton(context),
                ],
              )),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanySearchField(controller: companyTEC),
                const SizedBox(width: 10),
                ProductSearchField(controller: productTEC),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 48),
          // bottomSheetHandle(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 22, 8, 18),
              decoration: const BoxDecoration(
                color: Color(0xFFfdfdfd),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  tripleLeafDeco(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      // controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: fetchedData.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return InkWell(
                          onTap: () async {
                            ApiService apiService = ApiService();
                            final result = await apiService.getPostById(fetchedData[idx]['id']);
                            if (result != null) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(data: result)));
                            } else {
                              // Handle the case when result is null, e.g., show an error message.
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Failed to fetch data.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },

                          child: ItemTile(
                            // productImg: 'https://picsum.photos/20$idx',
                            productImg: fetchedData[idx]['images'][0]['url'] ?? 'https://daluscapital.com/wp-content/uploads/2016/04/dummy-post-square-1-1.jpg',
                            productName: fetchedData[idx]['product'],
                            companyName: fetchedData[idx]['company'],
                            isGood: fetchedData[idx]['certified'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchButton(context) {
    return Container(
      width: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white54, width: 2),
      ),
      child: IconButton(
        onPressed: () {
          // Navigate immediately
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoadingPage(company: companyTEC.text, product: productTEC.text)
          ));
        },
        icon: const Icon(Icons.search),
        color: Colors.white,
      ),
    );
  }
}

// void _showInitialBottomSheet() {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     isDismissible: false,
//     enableDrag: true,
//     barrierColor: Colors.white.withOpacity(0),
//     builder: (BuildContext context) {
//       double maxChildSize = (MediaQuery.of(context).size.height - 72) /
//           MediaQuery.of(context).size.height; // 72는 앱바높이
//       return DraggableScrollableSheet(
//         snap: true,
//         shouldCloseOnMinExtent: false,
//         expand: false,
//         initialChildSize: 0.65,
//         minChildSize: 0.65,
//         maxChildSize: maxChildSize,
//         builder: (BuildContext context, ScrollController scrollController) {
//           return Container(
//             child: Column(
//               children: [
//                 const SizedBox(height: 12),
//                 Container(
//                   height: 6,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Expanded(
//                   child: ListView.builder(
//                     controller: scrollController,
//                     itemCount: 10,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         title: Text('상품 $index'),
//                         subtitle: Text('상품설명'),
//                         trailing: Icon(Icons.thumb_up),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
