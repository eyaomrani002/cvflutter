import 'package:ayaomrani/profile/portfilio.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';



class Port extends StatelessWidget {
  const Port({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SnappingList()),
    );
  }
}

class SnappingList extends StatefulWidget {
  const SnappingList({Key? key}) : super(key: key);

  @override
  _SnappingListState createState() => _SnappingListState();
}

class _SnappingListState extends State<SnappingList> {
  List<portfilio> productList = [
    portfilio('assets/img.png', 'Black Chair'),
    portfilio('assets/img.png', 'Awesome Sofa'),
    portfilio('assets/img.png', 'Copper Lamp'),
    portfilio('assets/img.png', 'Orange Lamp'),
    portfilio('assets/img.png', 'Comfortable Chair'),
    portfilio('assets/images/white_chair.jpg', 'Simple Chair'),
    portfilio('assets/images/white_lamp.jpg', 'Nice Lamp'),
    portfilio('assets/images/yellow_planter.jpg', 'Awesome Planter'),
    portfilio('assets/images/white_sofa.jpg', 'Blue & white Sofa'),
    portfilio('assets/images/white_planter.jpg', 'White Planter'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Listview with Snapping Effect"),
      ),
      body: SizedBox(
        height: 700,
        child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: productList.length,
          itemSize: 300,
          onItemFocus: (index) {},
          dynamicItemSize: true,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    portfilio port = productList[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                port.imagePath,
                fit: BoxFit.cover,
                width: 150,
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                port.title,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
