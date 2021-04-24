import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/transaction.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class FundsScreen extends StatelessWidget {
  final double balance = 0;
  final List<int> smartOptions = [5, 15, 25, 50, 100];
  final int challengeVouchersCount = 0;
  final Transaction transaction = Transaction.named(
    amount: 0,
    currency: '\$',
    date: DateTime.now(),
    title: 'Total Balance',
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      width: _width,
      child: Column(
        children: [
          // margin: EdgeInsets.symmetric(horizontal: _width * 0.05),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              MetaText.myBalance,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: _width * 0.05,
                right: _width * 0.05,
                top: 30,
                bottom: 40,
              ),
              child: Column(
                children: [
                  Text(
                    '\$${balance.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: MetaAsset.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...smartOptions
                            .map((e) => InkWell(
                                  child: Text('\$$e'),
                                  onTap: () {
                                    // TODO: Add cash
                                  },
                                ))
                            .toList(),
                        InkWell(
                          child: Text('Other'),
                          onTap: () {
                            // TODO: Add cash
                          },
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(
                            color: MetaAsset.white,
                            width: 1,
                          ),
                        ),
                        color: MetaAsset.black,
                        child: Text(
                          '- ${MetaText.withdraw}',
                          style: TextStyle(
                            color: MetaAsset.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        color: MetaAsset.white,
                        child: Text(
                          '+ ${MetaText.addFunds}',
                          style: TextStyle(
                            color: MetaAsset.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    MetaText.challengeVouchers + '($challengeVouchersCount)',
                    style: TextStyle(
                      color: MetaAsset.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: _width * 0.9,
                    child: Text(
                      MetaText.noRegisteredTickets,
                      style: TextStyle(
                        color: MetaAsset.accentGreen,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade600,
                          width: 1.5,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      child: Row(
                        children: [
                          Text(
                            MetaText.viewVoucherDetails,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.voucherDetails);
                      },
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Text(MetaText.history),
                        Spacer(),
                        Text(MetaText.viewAll),
                        Icon(
                          Icons.arrow_forward,
                          color: MetaAsset.accentGreen,
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text(
                          transaction.currency,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        ),
                        title: Text(
                          transaction.title,
                          style: TextStyle(color: MetaAsset.white),
                        ),
                        subtitle: Text(
                          DateTimeHelper.getHistoryDate(transaction.date),
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        trailing: Text(
                          '${transaction.currency}${transaction.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: MetaAsset.accentGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
