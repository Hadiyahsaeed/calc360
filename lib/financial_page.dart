// ignore_for_file: avoid_print

import 'package:calc360_app/mortgage_calculator.dart';
import 'package:flutter/material.dart';


class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Calculators'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, "Mortgage Calculator", () {
            // Handle Mortgage Calculator item click here.
           Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const MCPage(title: "BMI Calculator"),
                          )

                        );
          }),
          _buildListItem(context, "Loan Calculator", () {
            // Handle Loan Calculator item click here.
            print("Loan Calculator Clicked");
          }),
          _buildListItem(context, "Auto Loan Calculator", () {
            // Handle Auto Loan Calculator item click here.
            print("Auto Loan Calculator Clicked");
          }),
          _buildListItem(context, "Interest Calculator", () {
            // Handle Interest Calculator item click here.
            print("Interest Calculator Clicked");
          }),
          _buildListItem(context, "Payment Calculator", () {
            // Handle Payment Calculator item click here.
            print("Payment Calculator Clicked");
          }),
          _buildListItem(context, "Retirement Calculator", () {
            // Handle Retirement Calculator item click here.
            print("Retirement Calculator Clicked");
          }),
          _buildListItem(context, "Amortization Calculator", () {
            // Handle Amortization Calculator item click here.
            print("Amortization Calculator Clicked");
          }),
          _buildListItem(context, "Investment Calculator", () {
            // Handle Investment Calculator item click here.
            print("Investment Calculator Clicked");
          }),
          _buildListItem(context, "Inflation Calculator", () {
            // Handle Inflation Calculator item click here.
            print("Inflation Calculator Clicked");
          }),
          _buildListItem(context, "Finance Calculator", () {
            // Handle Finance Calculator item click here.
            print("Finance Calculator Clicked");
          }),
          _buildListItem(context, "Income Tax Calculator", () {
            // Handle Income Tax Calculator item click here.
            print("Income Tax Calculator Clicked");
          }),
          _buildListItem(context, "Compound Interest Calculator", () {
            // Handle Compound Interest Calculator item click here.
            print("Compound Interest Calculator Clicked");
          }),
          _buildListItem(context, "Salary Calculator", () {
            // Handle Salary Calculator item click here.
            print("Salary Calculator Clicked");
          }),
          _buildListItem(context, "Interest Rate Calculator", () {
            // Handle Interest Rate Calculator item click here.
            print("Interest Rate Calculator Clicked");
          }),
          _buildListItem(context, "Sales Tax Calculator", () {
            // Handle Sales Tax Calculator item click here.
            print("Sales Tax Calculator Clicked");
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text, VoidCallback onTap) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: onTap,
    );
  }
}