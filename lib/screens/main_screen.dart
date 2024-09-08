import 'package:expenz/constants/colors.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/screens/add_new_screen.dart';
import 'package:expenz/screens/budget_screen.dart';
import 'package:expenz/screens/home_screen.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transaction_screen.dart';
import 'package:expenz/services/expense_service.dart';
import 'package:expenz/services/income_services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _currentPageIndex = 0;

  List<ExpenceModel> expenseList = [];
  List<IncomeModel> incomeList = [];

  //Function to fetch expenses
  void fetchAllExpenses() async {
    List<ExpenceModel> loadedExpenses = await ExpenseSercive().loadExpenses();
    setState(() {
      expenseList = loadedExpenses;
    });
  }

  //Function to fetch all Incomes
  void fetchAllIncomes() async {
    List<IncomeModel> loadedIncomes = await IncomeService().loadIncomes();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  // Function to add a new expense
  void addNewExpense(ExpenceModel newExpense) async {
    await ExpenseSercive().saveExpenses(newExpense, context);

    // Update the list of expenses
    setState(() {
      expenseList.add(newExpense);
    });
  }

  // function to add new income
  void addNewIncome(IncomeModel newIncome) async {
    await IncomeService().saveIncome(newIncome, context);

    //upadted the income list
    setState(() {
      incomeList.add(newIncome);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllExpenses();
    fetchAllIncomes();
  }

  @override
  Widget build(BuildContext context) {
    //screens list
    final List<Widget> pages = [
      const HomeScreen(),
      const TransactionScreen(),
      AddNewScreen(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      const BudgetScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
