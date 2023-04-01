Original App Design Project - README
===

# BooksManager

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
With so many books read also comes unused or thrown away bookmarks. Our app BooksManager is an app that will allow for readers to save their space in their books without having so spend so much on tassles or have to produce waste through the use of bookmarks. Also, we plan to also help readers discover new books in an explore section.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Books/Readers
- **Mobile:** This app would primarily be developed for mobile but could also be viable on a computer.
- **Story:** Allows users to log and view information about the books they are reading
- **Market:** Individuals that reads and would like to log or keep track of their books in an app.
- **Habit:** This app can be used however frequently the user wants to keep track of their spot in the book they are reading
- **Scope:** We would first start with keeping track of the books that the users are currently reading then expand to allowing them to search and explore other books.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* As a user, I want to be able to sign up an account for the app.
* As a user, I want to be able to login with my existing account
* As a user, I want to be able to add books into my collection
* As a user, I want to be able to place a book mark in the book I'm reading
* As a user, I would like to be able to view my books in a list
* As a user, I would like to be able to view information about my books
* As a user, I would like to explore books based off of a search that looks at a book's category
* As a user, I would like to see my profile information and books read

**Optional Nice-to-have Stories**

* Animation when user loads access certain resources
* Books suggestions based on current books read
* Edit name/username/password
* Delete account

### 2. Screen Archetypes

* Log in/sign up page
   - [x] As a user, I want to be able to sign up an account for the app.
   - [x] As a user, I want to be able to login with my existing account
* Books CollectionPage
  - [x] As a user, I would like to be able to view my books in a list
* Book Details
  - [x] As a user, I would like to be able to view information about my books
  - [x] As a user, I want to be able to place a book mark in the book I'm reading
  - [x] As a user, I want to be able to add books into my collection
  - [x] User can remove a book from their collection, which will delete all information regarding the book
* Explore page
    - [x] User can search for books on the search bar
    - [x] User can see the results of their search on the explore page
    - [x] User can view a detailed page of the book they select from the result
* Profile/Settings page
   - [x] User can view their info
   - [x] User can see what they've read
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Books view
* Explore page
* Profiles view

**Flow Navigation** (Screen to Screen)

* Log in -> sign up if no log in is available
* Books collection view -> detailed books view -> can add or edit books
* Explore page -> detailed books view -> add books to profile

## Wireframes
<img src="https://i.imgur.com/vSGWOsw.jpg" width=600>





### [BONUS] Digital Wireframes & Mockups
**Log In**

![](https://i.imgur.com/o3EMIF1.png)

**Sign Up**

![](https://i.imgur.com/E7y2VzO.png)

**Book Collection**

![](https://i.imgur.com/u6uNJ9t.png)

**Collection Detail View**

![](https://i.imgur.com/eXQRFbh.png)

**Explore**

![](https://i.imgur.com/WQOC03h.png)

**Explore Detail View**

![](https://i.imgur.com/pCuh3JA.png)

**Profile**

![](https://i.imgur.com/WPGlOtB.png)


### [BONUS] Interactive Prototype

![](https://i.imgur.com/yLrDqyf.gif)

### Progress Update
Login and Signup </br>
![](https://github.com/BooksManager/BookManager/blob/main/loginsignup.gif)


Complete Work in Week 9
[Video Walk Through](https://imgur.com/a/GW79Tzc)
- User can sign up for an account
- If the user key in an invalid credential, Login UI will display a warning message
- User can log in
- User can see their detail in the profile page
- User can see the books they've read in the profile page
- User can search for books in explore UI
- User can see the detail of their search result
- User can add the book to their collection in Explore Detail View
- User can see all the books they've added in books collection UI
- User can clicks onto the book in their collection to see the detail
- User can remove the book from their collection in the Books Detail View
- User can add a book mark to the book in their collection
- The progress bar in the detail view will update according to the book mark
- User can't place a book mark at a page that doesn't exist in the book 


## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]



