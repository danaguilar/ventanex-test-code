# Test
1. Commit code to your repository at start
    
    > This commit represents the changes necessary to setup this project
    > locally. This includes the following
    > 
    > - The `.ruby-version` was set to version 2.2.2 while the `Gemfile` ruby
    > version was set to 2.3.0. Since 2.2.2 uses an insecure version of
    > openssl the `.ruby-version` was updated.
    > 
    > - Ruby version 2.3.0 allows the use of Bundler 2.0 with very minimal
    > changes to the project's current gem versions. Only minitest and rake
    > needed to be updated.
    > 
    > - `database.yml` was changed to `database.yml.example` so that it could
    > still be shared as a template. And `config/database.yml` was added to
    > the `.gitignore` file so that the local database setup doesn't get added
    > to the repository
    
    
2. Make the create button work and shows a form that allows a user to enter nickname, account number, and account type

    > Added ability for users to create new pay account
    > 
    > In order for users to have the ability to create new pay accounts, the
    > following was added.
    > 
    > - Updates to the `create` and `new` pay_acount_controller actions. The
    > new controller action supplies an empty pay_account model for use in
    > associated view's form. The create action takes a filtered version of
    > the parameters returned by that form (known as "strong params"), uses
    > them to create a new pay_account object, and saves that object to the
    > database. It then redirects back to the index action so the user can
    > view their new pay_account with all the others
    > 
    > - Creation of a pay_account `new` view along with some minor css to size
    > it properly.
    > 
    > - Updates to the pay_account `index` view to link the create button to
    > the new view.

3. Implement Account Class to read xml file(assets/xml/loan.xml) and find the loan number and borrower name in the xml to be displayed in pay_accounts/index.html.erb(can be placed anywhere in the index file)

    > Create Account Class and display xml in index.html
    > 
    > The Account Class was created to read an xml file located in the
    > `app/assets/xml/` directory and provide a way to access the requested data
    > with it. The class makes the following assumptions about how the xml
    > data is formatted
    > 
    > 1) There is at least one node named "clientID"
    > 2) Any attribute requested of the account class will have a
    > corresponding node that's is a sibling of the "clientID" node
    > 3) All siblings of the "clientID" node are related to a single entity
    > 
    > The account class has a basic test class associated with it and was
    > added to the `pay_accounts_controller` for use in the
    > `pay_accounts/index.html.erb`
  
  
4. Use javascript/jQuery to connect the hide button. The button should replace the all the characters except the last 4, with *.
Example: 4111111111111111 -> ************1111

    > Added ability to sanitize account numbers on index
    > 
    > Added `number-hider.js` in order to sanitize account numbers on the
    > index page with a button press.

# Extra Credit(but not required)
1. Create a new migration for a user

    > Generated User migration
    > 
    > Generated User migration with devise. Since devise is considered
    > industry standard for User logins, it's generally much more secure to
    > use devise's User setup than craft your own.
    
2. Write some tests for pay_accounts

    > Added validations to PayAccount model
    > 
    > Added validations to ensure all PayAccounts have a nickname and a
    > properly formatted account number. Added a unit test to test those
    > validations and created a presenter to show those error messages when
    > the user incorrectly adds that data.

3. Build a navigation bar

    > Added navbar
    > 
    > There's not a lot to show for a navbar so I added a dropdown that shows
    > the last five accounts added. Creates a scope for that as well on the
    > PayAccount model

4. Feel free to add anything you might feel adds to the project

    > Added show and delete actions
    > 
    > Since the initial app came with Show and Delete buttons I figured it was
    > a good idea to add a show page and a delete action.
