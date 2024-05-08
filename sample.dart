class BankAccount {
  int? Acno;
  String? Acname;
  double balance;
  BankAccount(this.Acname, this.Acno, this.balance);
  void deposit(double amount) {
    balance += amount;
    print("deposit ${amount} success fully");
  }

  void withdraw(double amount) {
    if (balance >=amount) {
      balance -= amount;
      print("withdraw ${amount}");
    } else {
      print("can't withdraw");
    }
  }

  void acinfo() {
    print("Acno = ${Acno}");
    print("Acname = ${Acname}");
    print("current Balance = ${balance}");
  }
}

void main() {
  BankAccount MyAc = BankAccount("suresh", 100, 50000);
  MyAc.deposit(400);
  MyAc.withdraw(200);
  MyAc.acinfo();
}
