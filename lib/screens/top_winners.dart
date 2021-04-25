import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/rank.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class TopWinners extends StatelessWidget {
  final Rank rank = Rank.named(
    id: 'xyz',
    amount: 500.00,
    currency: '\$',
    image:
        "https://images.unsplash.com/photo-1619263883792-f085666a64b4?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    name: 'Gowtham',
    rank: 1,
  );
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      appbar: AppBar(
        centerTitle: true,
        title: Text(
          MetaText.topWinners,
          style: TextStyle(
            color: MetaAsset.white,
            fontSize: 22,
          ),
        ),
        leading: Offstage(),
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:
                      (index + 1) % 2 == 0 ? MetaAsset.black : MetaAsset.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: (index + 1) % 2 == 0
                        ? MetaAsset.white
                        : MetaAsset.black,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  rank.image,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    rank.name,
                    style: TextStyle(color: Colors.white70),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                '${rank.currency}${rank.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: MetaAsset.accentGreen,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
