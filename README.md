# E-commerce Website

> A Ruby on Rails-based e-commerce platform allowing users to browse products, add items to cart, apply coupons, and complete a secure checkout process. This application is designed to handle various aspects of online shopping, including product categorization, user reviews, order management, and payments.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Deployment](#deployment)
- [Additional Gems and Their Purpose](#additional-gems-and-their-purpose)
- [Contributing](#contributing)

## Requirements

- **Ruby version**: 3.0.2
- **Rails version**: 6.1.4.1
- **Bundler**: 2.2.22

## Installation

1. Clone the repository:
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
2. Install dependencies:
   bundle install

## Configuration

- Modify settings in the `config/` directory as needed.
- Update `config/database.yml` to configure database connections.

## Database Setup

1. Create the database:
   rails db:create
2. Migrate the database:
   rails db:migrate
3. (Optional) Seed the database with initial data:
   rails db:seed

## Running the App

- Start the server with the following command:
  ```bash
  rails server
  ```
- By default, the app will be accessible at http://localhost:3000.

## Testing

- Run the test suite with the following command:
  rails test

## Deployment

Before deploying the application, ensure the following steps are completed:

### 1. Environment Variables

Set up the necessary environment variables, such as:

- Database credentials
- API keys

### 2. Asset Precompilation

Precompile assets by running:

- rails assets:precompile

### 3. Server Configuration

Ensure your server is configured to use a Rack-based web server like Puma. The config.ru file is already set up to start the app.

## Additional Gems and Their Purpose

### 1. **Devise**

- Provides user authentication features, allowing users to sign up, log in, and manage their accounts.

### 2. **Pagy**

- Adds pagination for handling large datasets in views, like lists of products.

### 3. **Puma**

- A high-performance concurrent web server used to run the Rails app in production.

### 4. **Webpacker**

- Manages JavaScript and CSS assets, providing modern front-end tooling for Rails.

### 5. **Turbolinks**

- Enhances navigation speed by only loading new page content rather than a full page reload.

### 6. **Capybara**

- A tool for integration testing, helping simulate user interactions in tests.

### 7. **Image Processing**

- Handles image uploading and processing for features like product images.

### 8. **Stripe**

- Integrates payment functionality, enabling users to make secure purchases.

### 9. **Rack Mini Profiler**

- Provides performance insights, profiling database queries and rendering times in development.

### 10. **Sass-Rails**

- Enables SCSS (Sassy CSS) styling, allowing for more expressive and maintainable CSS.

### 11. **Web Console**

- A debugging tool that provides an interactive console within the browser in development.

### 12. **Webdrivers**

- Manages browser drivers for system tests, automatically updating them when needed.

### 13. **ActiveStorage**

- Used for handling file uploads, such as user-uploaded images or documents.

### 14. **FriendlyId**

- Adds human-readable URLs for products and categories, enhancing SEO and user experience.

### 15. **Rails Admin**

- Provides an admin dashboard to manage resources like products, categories, and orders in a user-friendly way.

## Contributing

1. Fork the repository.
2. Create a new feature branch.
3. Submit a pull request for review.
