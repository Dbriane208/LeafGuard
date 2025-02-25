# 🌿 LeafGuard

LeafGuard is an AI-powered mobile application designed to help users detect apple plant diseases using image classification. By leveraging machine learning and deep learning, the app provides accurate predictions along with confidence scores and recommended measures for apple plant health management. The supported diseases trained on are Apple Scab, Apple Black rot and Apple Cedar Rust.

---

## 🚀 Features

- 📷 **Image Upload:** Users can upload or capture images of plant leaves for disease detection.
- 🤖 **AI-Powered Predictions:** Uses a trained deep learning model to identify plant diseases.
- 📊 **Confidence Score:** Displays the accuracy level of predictions.
- 💡 **Recommended Measures:** Provides actionable steps to manage and prevent plant diseases.
- 🎮 **User-Friendly UI:** Designed with an intuitive and modern interface using Flutter.

---

## 🧑‍💻 Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** FastAPI (Python)
- **Machine Learning:** TensorFlow Lite (TFLite)
- **Artificial Intelligence:** Google Gemini

---

## 📸 Screenshots

| Home Screen | Prediction Result |
| ----------- | ----------------- |
|             |                   |

---

## 👥 Installation & Setup

### Prerequisites

- Flutter SDK installed ([Download Flutter](https://flutter.dev/docs/get-started/install))
- Python installed ([Download Python](https://www.python.org/downloads/))

### Clone the Repository

```sh
git clone https://github.com/Dbriane208/LeafGuard.git
cd LeafGuard/leafguard
```

### Install Dependencies

```sh
flutter pub get
```

### Run the App

```sh
flutter run
```

For backend setup:
To get the backend project follow this (.[link](https://github.com/Dbriane208/LeafGuard-Model.git))

```sh
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```

---

## 🔬 Model & API Integration

LeafGuard utilizes a deep learning model optimized for mobile using TensorFlow Lite. The backend API processes image uploads and returns predictions in JSON format:

```json
{
  "predictedClass": "Apple Black Rot",
  "confidence": 92.5,
  "symptoms": "Brown spots with yellow halos",
  "measures": "Use fungicides and remove affected leaves"
}
```

---

## 🔒 Environment Variables

Create a `.env` file in the backend directory and add:

```
API_KEY=your_api_key_here
```

---

## 📝 License

This project is licensed under the **MIT License**.

---

## 🤝 Contributing

We welcome contributions! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a Pull Request.

---

## 📩 Contact

For inquiries, reach out via email:
📧 **db9755949@gmail.com**

Or connect on LinkedIn: [Daniel Brian Gatuhu](https://www.linkedin.com/in/danielbriangatuhu/)

---

🌟 If you like this project, don't forget to give it a star on GitHub! 🌟

