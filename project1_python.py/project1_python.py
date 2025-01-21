class BankAccount:
    def __init__(self, account_number, account_holder, balance=0):
        self.account_number = account_number
        self.account_holder = account_holder
        self.balance = balance

    def display_balance(self):
        print(f"Account Holder: {self.account_holder}")
        print(f"Account Number: {self.account_number}")
        print(f"Balance: ${self.balance}")

# Creating an object of BankAccount class
account1 = BankAccount("12345", "Alice", 1000)

# Calling a method
account1.display_balance()
# Assuming BankAccount class is already defined

class SavingsAccount(BankAccount):
    def __init__(self, account_number, account_holder, balance=0, interest_rate=0.02):
        # Call the parent constructor
        super().__init__(account_number, account_holder, balance)
        self.interest_rate = interest_rate
    
    def apply_interest(self):
        # Calculate and apply interest
        interest = self.balance * self.interest_rate
        self.balance += interest
        print(f"Interest applied: ${interest}")
        # Call the display_balance method from the parent class
        self.display_balance()

# Creating an object of SavingsAccount class
savings_acc = SavingsAccount("67890", "Bob", 1000)

# Apply interest and display balance
savings_acc.apply_interest()
# Assuming BankAccount and SavingsAccount classes are already defined

class CurrentAccount(BankAccount):
    def display_balance(self):
        print(f"Current Account - {self.account_holder}: ${self.balance}")

# Polymorphic behavior
accounts = [
    BankAccount("12345", "Alice", 1000),
    SavingsAccount("67890", "Bob", 1500),
    CurrentAccount("99999", "Charlie", 500)
]

# Iterate over the accounts list and display balances
for acc in accounts:
    acc.display_balance()  # Corrected: closing parenthesis
    
def create_account(account_number, holder_name, balance=0):
    print(f"Account Number: {account_number}")
    print(f"Holder Name: {holder_name}")
    print(f"Initial Balance: ${balance}")

# Call with and without default balance
create_account("12345", "Alice")  # Uses default balance of 0
create_account("67890", "Bob", 500)  # Uses provided balance of 500

