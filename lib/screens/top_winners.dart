import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/rank.dart';
import 'package:flutter/material.dart';

class TopWinners extends StatelessWidget {
  final Rank rank = Rank.named(
    id: 'xyz',
    amount: 500.00,
    currency: '\$',
    image:
        "https://images.unsplash.com/photo-1609505110780-f51aca88115d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    name: 'Gowtham',
    rank: 1,
  );
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + 10,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              MetaText.topWinners,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
            itemCount: 100,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 15);
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: (index + 1) % 2 == 0
                          ? MetaAsset.black
                          : MetaAsset.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                        color: (index + 1) % 2 == 0
                            ? MetaAsset.white
                            : MetaAsset.white,
                        width: 1.5,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: 28,
                    height: 28,
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
                    borderRadius: BorderRadius.circular(12.5),
                    child: Image.network(
                      rank.image,
                      height: 25,
                      width: 25,
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
        ),
      ],
    );
  }
}
