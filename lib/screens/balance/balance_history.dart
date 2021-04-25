import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/transaction.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class BalanceHistory extends StatelessWidget {
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
      appbar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: MetaAsset.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: MetaAsset.black,
        centerTitle: true,
        title: Text(
          MetaText.balanceHistory,
          style: TextStyle(
            color: MetaAsset.white,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              transaction.currency,
              style: TextStyle(
                color: MetaAsset.accentGreen,
                fontSize: 25,
              ),
            ),
            title: Text(
              transaction.title,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              DateTimeHelper.getHistoryDate(transaction.date),
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
              ),
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
      ),
    );
  }
}
