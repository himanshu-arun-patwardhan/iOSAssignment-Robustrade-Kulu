# iOSAssignment-Robustrade-Kulu

# 📱 iOS Assignment – Paginated UITableView with Networking

## 🚀 Objective

Build an iOS application using UIKit that displays a list of products from a paginated API. The app
should fetch data using `NSURLSession`, parse it using `Codable`, and display it in a `UITableView`.
Selecting a product should navigate to a Detail screen.

---

## ✅ API Endpoint

Use the following fake API for data:

https://fakeapi.net/products?page=0&limit=10&category=electronics


### ✅ The API is paginated. Your pagination should:

- Start from page = 0
- Use the nextPage value from the API response to load the next set of data

---

## Requirements

### 📡 Networking

- Use `NSURLSession` to make the API call
- Use `Codable` to parse the JSON response into Swift structs


## 📋 UI with UIKit

- Use a `UITableView` to display the list of products
- Create a custom `UITableViewCell` to render each product's data
- Implement pagination: Load more data as the user scrolls to the bottom
- Tableview cell should have title , description ,category , price and image


## 📄 Detail Screen

- Tapping on a product cell should navigate to a Detail View Controller showing full details of
that product


## ❌ Error Handling

- If there’s no internet connection, show a dedicated error screen with a retry option
- Handle API errors gracefully


## 🔄 Loading State

- Show a loader (spinner) while data is being fetched
- Show a "No Data" view if no products are returned

---

## ➕ Bonus (Nice to Have)

- Use protocols and delegation for separating concerns (e.g., networking, view updates)
- Implement MVVM architecture or similar clean structure
- Use lazy loading for images (if the product has images)

## Output Expectations

- Functional paginated table view
- Smooth scrolling with lazy load
- Responsive error & loading states
- Clean, readable, and modular code
