# GetX Project Structure

A practical starter template for Flutter applications leveraging the [GetX](https://github.com/jonataslaw/getx) package for efficient state management, route handling, and dependency injection. This repository demonstrates best practices for organizing Flutter project code with GetX, making your apps scalable and maintainable.

## Features

- **Modular Structure:** Organize your code into modules: controllers, views, models, and services.
- **GetX State Management:** Simplified state management using GetX.
- **Routing & Navigation:** Clean navigation and route management with GetX.
- **Dependency Injection:** Centralized dependency handling.
- **Examples Included:** Starter screens and example flows.

## Project Structure

```
lib/
├── app/
│   ├── modules/
│   │   ├── home/
│   │   │   ├── controllers/
│   │   │   ├── views/
│   │   │   └── models/
│   ├── routes/
│   └── services/
├── main.dart
```

- `modules/`: Feature modules containing views, controllers, and models.
- `routes/`: Application-wide routing setup.
- `services/`: Reusable service classes and utilities.

## Getting Started

1. **Clone the repository**
    ```sh
    git clone https://github.com/nuhan021/getX_project_structure.git
    ```
2. **Install dependencies**
    ```sh
    flutter pub get
    ```
3. **Run the app**
    ```sh
    flutter run
    ```

## License

MIT License. See [LICENSE](LICENSE) for details.

---

Feel free to modify and expand this template for your project needs!