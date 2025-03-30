# 💸 Expense Tracker App (v1)

A smart Flutter app that helps users manage their daily expenses, powered by real-time banking data, machine learning insights, and robust state management using Bloc.

---

## 📱 Features

- 📝 Add, edit, and delete expenses
- 📊 Visual expense summaries (daily, weekly, monthly)
- 🔗 Sync with **Investec API** to fetch real bank transactions
- 🤖 Smart suggestions using **Firebase ML**
- 💾 Offline support with local database (Hive or SQLite)
- 💡 Built using **Bloc** for scalable state management

---

## 🚀 Tech Stack

- **Flutter & Dart** – Cross-platform development
- **Investec API** – Real-time bank data
- **Firebase ML Kit** – AI insights for spending
- **Firebase Core** – Optional services (Auth, Analytics)
- **Hive / SQLite** – Local persistent storage
- **Bloc** – State management (flutter_bloc package)

---

## 🧠 Bloc Architecture Overview

- `ExpenseBloc`: Manages events like add/edit/delete expenses
- `ExpenseState`: Handles UI state (loading, success, error)
- `BlocBuilder` & `BlocListener`: Connects Bloc logic with UI widgets

---

## 🛠️ Getting Started

```bash
git clone https://github.com/SizweMatenjwa100/expensetarckerappv1.git
cd expensetarckerappv1
flutter pub get
flutter run
