// copied my code from remix here to manually update the repo through github, stuck in the end of 'step 2' right now, need to find the way to compile and deploy in JavaScript VM 

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    // YOUR CODE HERE!

    address payable public accountOne;  // Account 1
    address payable public accountTwo;  // Account 2
    address public lastToWithdraw;  // Last account to withdraw
    uint public lastWithdrawAmount;  // Last amount withdrawn
    uint public contractBalance;  // Current contract balance
    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    */
    function withdraw(uint amount, address payable recipient) public {

        /*
        Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        */
        // `require` statement added to validate recipient
        require(
            recipient == accountOne || recipient == accountTwo,
            "You don't own this account!"
        );
        /*
        Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        */
        // added require to update `lastToWithdraw` - checks for sufficient funds
        require(
            amount <= contractBalance,
            "Insufficient funds!"
        );
        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */
        // check if the `lastToWithdraw` is not equal to (`!=`) to `recipient`
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        // YOUR CODE HERE!
         recipient.transfer(amount);

        // Set  `lastWithdrawAmount` equal to `amount`
        // YOUR CODE HERE!
        lastWithdrawAmount = amount;

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        // YOUR CODE HERE!
        
        contractBalance = address(this).balance;  // Call the `contractBalance` variable and set it equal to the balance of the contract
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {    // Define a `public payable` function named `deposit`

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance`.
        */
        // YOUR CODE HERE!
         contractBalance = address(this).balance;
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public {

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        // YOUR CODE HERE!
        accountOne = account1; // Set the values of `accountOne`
        accountTwo = account2; // Set the values of `accountTwo`
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.


    FIXED THIS ERROR - forgot to add "external"
    joint_savings.sol:106:5: SyntaxError: No visibility specified. Did you intend to add "external"?
    function() payable {
    ^ (Relevant source part starts here and spans across multiple lines).
    
    */
    // YOUR CODE HERE!
    function() external payable {
        // Update contractBalance
        contractBalance = address(this).balance;
    }
}



/* pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    // YOUR CODE HERE!

    address payable public accountOne;  // Account 1
    address payable public accountTwo;  // Account 2
    address public lastToWithdraw;  // Last account to withdraw
    uint public lastWithdrawAmount;  // Last amount withdrawn
    uint public contractBalance;  // Current contract balance
    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    */
    function withdraw(uint amount, address payable recipient) public {

        /*
        Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        */
        // `require` statement added to validate recipient
        require(
            recipient == accountOne || recipient == accountTwo,
            "You don't own this account!"
        );
        /*
        Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        */
        // added require to update `lastToWithdraw` - checks for sufficient funds
        require(
            amount <= contractBalance,
            "Insufficient funds!"
        );
        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */
        // check if the `lastToWithdraw` is not equal to (`!=`) to `recipient`
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        // YOUR CODE HERE!
         recipient.transfer(amount);

        // Set  `lastWithdrawAmount` equal to `amount`
        // YOUR CODE HERE!
        lastWithdrawAmount = amount;

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        // YOUR CODE HERE!
        
        contractBalance = address(this).balance;
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance`.
        */
        // YOUR CODE HERE!
         contractBalance = address(this).balance;
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public {

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        // YOUR CODE HERE!
        accountOne = account1;
        accountTwo = account2;
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    
    joint_savings.sol:106:5: SyntaxError: No visibility specified. Did you intend to add "external"?
    function() payable {
    ^ (Relevant source part starts here and spans across multiple lines).
    
    */
    // YOUR CODE HERE!
    function() external payable {
        // Update contractBalance
        contractBalance = address(this).balance;
    }
}



/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    // YOUR CODE HERE!

    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    */
    function withdraw(uint amount, address payable recipient) public {

        /*
        Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        */
        // YOUR CODE HERE!

        /*
        Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        */
        // YOUR CODE HERE!

        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */
        // YOUR CODE HERE!

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        // YOUR CODE HERE!

        // Set  `lastWithdrawAmount` equal to `amount`
        // YOUR CODE HERE!

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        // YOUR CODE HERE!
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance`.
        */
        // YOUR CODE HERE!
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        // YOUR CODE HERE!
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    */
    // YOUR CODE HERE!
}
*/
