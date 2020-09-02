# Project Overview

## Project

Link to completed project [here](https://squilliamp3.herokuapp.com/)

Link to project frontend [here](https://github.com/weilyl/project-3-frontend)

Link to project backend [here](https://github.com/weilyl/project-3-backend)

## Project Schedule

This schedule will be used to keep track of your progress throughout the week and align with our expectations.

You are **responsible** for scheduling time with your squad to seek approval for each deliverable by the end of the corresponding day, excluding `Saturday` and `Sunday`.

| Day   | Deliverable                                                      | Status     |
| ----- | ---------------------------------------------------------------- | ---------- |
| Day 1 | Project Description                                              | Complete   |
| Day 1 | Wireframes / Priority Matrix / Timeline `backend` and `frontend` | Complete   |
| Day 2 | Working RestAPI                                                  | Complete   |
| Day 3 | Frontend: Core Application Structure (HTML, CSS, etc.)           | Complete   |
| Day 4 | MVP & Bug Fixes                                                  | Complete   |
| Day 5 | Final Touches and Present                                        | Complete   |

## Project Description

User Model: 
- username:string
- password:string ("password_digest")

Budget Model
- user:references
- name:string
- amount:bigint

Expense Model
- budget:references
- amount:bigint
- date:date
- category:string

## Wireframes

- [Mobile](https://git.generalassemb.ly/SEIR-629/project-1-portfolio/blob/master/readme-assets/mobile.png)
- [Tablet](https://git.generalassemb.ly/SEIR-629/project-1-portfolio/blob/master/readme-assets/nav-highlight.gif)
- [Desktop](https://git.generalassemb.ly/SEIR-629/project-1-portfolio/blob/master/readme-assets/desktop.png)

## Time/Priority Matrix

[Here](https://res.cloudinary.com/dssciwyew/image/upload/v1598229178/Priority%20Matrix%20Backend%20P3.png) is a full list of features that have been prioritized based on the `Time and Priority` Matix.

### MVP/PostMVP

#### MVP

- JWT Authentication/Authorization
- User model
- User controller and dependencies
- Expense Model
- Expense Controller
- Budget Model
- Budget Controller
- Routes
- Migration
- Deploy and test on Heroku
- Test on Postman

#### PostMVP

- Query for week, month, year
- Google, Facebook sign up/log in

## Functional Components

Based on the initial logic defined in the previous sections try and breakdown the logic further into functional components, and by that we mean functions. Try and capture what logic would need to be defined if the game was broken down into the following categories.

Time frames are also key in the development cycle. You have limited time to code all phases of the game. Your estimates can then be used to evalute game possibilities based on time needed and the actual time you have before game must be submitted. It's always best to pad the time by a few hours so that you account for the unknown so add and additional hour or two to each component to play it safe.

#### MVP

| Component               | Priority | Estimated Time | Time Invested | Actual Time |
| ----------------------- | :------: | :------------: | :------------: | :---------: |
| JWT Authentication/Authorization   |    H     |      1hr       |     2hr        |     1hr     |
| User model                         |    H     |      0.5hr     |      1hr       |     -hr     |
| User controller                    |    M     |      2hr       |      3hr       |     -hr     |
| Expense Controller                 |    H     |      2hr       |      3hr       |     -hr     |
| Expense Model                      |    M     |      1hr       |      2hr       |     -hr     |
| Budget Model                       |    M     |      2hrs      |      1hr       |     -hr     |
| Budget Controller                  |    H     |      2hr       |      3hr       |     -hr     |
| Routes                             |    L     |      1hr       |      2hr       |     -hr     |
| Local Migration                    |    L     |      1hr       |      1hr       |     3hr     |
| Test on Postman                    |    L     |      5hr       |      1hr       |     -hr     |
| Deploy, migrate test on Heroku     |    L     |      10hr      |      1hr       |     3hr     |
| Total                              |    H     |    27.5 hrs    |      20hrs     |    7hrs     |

#### PostMVP

| Component                                        | Priority | Estimated Time | Time Invested  | Actual Time |
| ------------------------------------------------ | :------: | :------------: | :------------: | :---------: |
| Show all budgets                                 |    M     |      3hr       |      -hr       |     -hr     |
| Return all expenses of user by category          |    H     |      2hr       |      2hrs      |     2hrs    |
| Return all expenses of user by date              |    M     |      5hr       |      -hr       |     -hr     |
| Return all expenses of user within date range    |    H     |      5hr       |      -hr       |     -hr     |
|  Google, Facebook sign up/log in                 |    L     |      10hr      |      -hr      |     -hr     |
| Total                                            |    H     |     25hrs      |      2hrs     |    2hrs     |

## Additional Libraries

- Rails-related RubyGems (framework to create RESTful API)
- pg (a PostgreSQL Ruby gem) (local database)

## Code Snippet


```
 def create
    if User.find_by(username: params[:username])
      render json: {error: "Username has been taken"}
    else
      @user = User.create(user_params)
      if @user.valid? &&
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
 end
```

```
 def expenses_by_user
     #@budget = Budget.where({id: params[:budget_id], user: params[:user_id]})
     @user = User.find(params[:user_id])
     @user_expenses = @user.expenses
     render :json => {
       :response => "Here are all your expenses",
       :data => @user_expenses
     }
  end
```

## Issues and Resolutions


**ERROR**: Expenses not returning for user

**RESOLUTION**: `User.find`, not `Expense.find`



**ERROR**: All users able to see the same budget

**RESOLUTION**: Updated `belongs_to`, `has_many through` across all models



**ERROR**: Able to make multiple users with same username

**RESOLUTION**: Added `User.find_by(username: params[:username])` condition in create user controller
