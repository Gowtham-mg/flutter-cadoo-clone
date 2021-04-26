import 'package:cadoo/meta_asset/meta_asset.dart';
import 'package:cadoo/meta_asset/meta_styles.dart';
import 'package:cadoo/meta_asset/meta_text.dart';
import 'package:cadoo/models/transaction.dart';
import 'package:cadoo/routes.dart';
import 'package:cadoo/utils/date_time_helper.dart';
import 'package:cadoo/widgets/edit_profile_text_form_field.dart';
import 'package:flutter/material.dart';

class MyBalanceScreen extends StatefulWidget {
  @override
  _MyBalanceScreenState createState() => _MyBalanceScreenState();
}

class _MyBalanceScreenState extends State<MyBalanceScreen> {
  final double balance = 0;

  final List<int> smartOptions = [5, 15, 25, 50, 100];

  final int challengeVouchersCount = 0;

  final Transaction transaction = Transaction.named(
    amount: 0,
    currency: '\$',
    date: DateTime.now(),
    title: 'Total Balance',
  );

  final PageController moneyPageController = PageController();

  final TextEditingController amountController = TextEditingController();

  int selected;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 10 + MediaQuery.of(context).viewPadding.top, bottom: 10),
            child: Text(
              MetaText.myBalance,
              style: TextStyle(
                color: MetaAsset.white,
                fontSize: 19,
                fontWeight: FontWeight.w400,
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
                    style: MetaStyles.balanceStyle,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 50),
                    height: 60,
                    child: PageView(
                      controller: moneyPageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...smartOptions
                                // ignore: deprecated_member_use
                                .map((e) => FlatButton(
                                      color: selected == e
                                          ? MetaAsset.accentGreen
                                          : null,
                                      shape: CircleBorder(),
                                      minWidth: 20,
                                      child: Text(
                                        '\$$e',
                                        style: TextStyle(
                                          color: selected == e
                                              ? MetaAsset.black
                                              : MetaAsset.accentGreen,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selected = e;
                                        });
                                      },
                                    ))
                                .toList(),
                            InkWell(
                              child: Text(
                                'Other',
                                style: TextStyle(
                                  color: MetaAsset.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selected = null;
                                });
                                moneyPageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.bounceInOut,
                                );
                              },
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: EditProfileTextFormField(
                                hintText: MetaText.amount,
                                controller: amountController,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                moneyPageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.bounceInOut,
                                );
                              },
                              child: Text(
                                MetaText.back,
                                style: TextStyle(
                                  color: MetaAsset.white,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.withdraw);
                        },
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
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          if (selected == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                duration: Duration(milliseconds: 1500),
                                content: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        color: MetaAsset.white,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          MetaText.selectAmountToAddBalance,
                                          style: TextStyle(
                                            color: MetaAsset.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            // TODO: Open paytm
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        color: MetaAsset.white,
                        child: Text(
                          '+ ${MetaText.addFunds}',
                          style: TextStyle(
                            color: MetaAsset.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        MetaText.challengeVouchers +
                            '($challengeVouchersCount)',
                        style: TextStyle(
                          color: MetaAsset.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: _width * 0.9,
                    child: Text(
                      MetaText.noRegisteredTickets,
                      style: TextStyle(
                        color: MetaAsset.accentGreen,
                        fontSize: 14,
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
                              color: Colors.white60,
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Colors.white60),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.voucherDetails);
                      },
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.balanceHistory);
                    },
                    padding: EdgeInsets.symmetric(vertical: 6),
                    height: 0,
                    child: Row(
                      children: [
                        Text(MetaText.history, style: MetaStyles.categoryStyle),
                        Spacer(),
                        Text(MetaText.seeAll, style: MetaStyles.categoryStyle),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: MetaAsset.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
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
