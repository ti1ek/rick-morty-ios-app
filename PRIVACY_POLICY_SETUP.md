# Privacy Policy Setup для Rick and Morty App

## 🎯 Цель
Создать публичный URL для Privacy Policy, который можно использовать в App Store Connect.

## 📋 Пошаговая инструкция

### Шаг 1: Создание репозитория для Privacy Policy

1. **Откройте GitHub** в браузере
2. **Нажмите "New repository"**
3. **Заполните:**
   - **Repository name:** `rick-morty-privacy-policy`
   - **Description:** "Privacy Policy for Rick and Morty iOS App"
   - **Public** ✅
   - **Add a README file** ❌
4. **Нажмите "Create repository"**

### Шаг 2: Загрузка файла Privacy Policy

1. **В новом репозитории нажмите "uploading an existing file"**
2. **Перетащите файл `privacy-policy.html`** в репозиторий
3. **Введите commit message:** "Add privacy policy"
4. **Нажмите "Commit changes"**

### Шаг 3: Настройка GitHub Pages

1. **В репозитории перейдите в "Settings"**
2. **Прокрутите вниз до "Pages"**
3. **В разделе "Source" выберите "Deploy from a branch"**
4. **Выберите "main" branch**
5. **Нажмите "Save"**

### Шаг 4: Получение URL

1. **Дождитесь активации GitHub Pages** (1-2 минуты)
2. **Ваш URL будет:** `https://YOUR_USERNAME.github.io/rick-morty-privacy-policy/privacy-policy.html`
3. **Замените YOUR_USERNAME на ваш GitHub username**

### Шаг 5: Использование в App Store Connect

1. **В App Store Connect в поле "Privacy Policy URL" введите:**
   ```
   https://YOUR_USERNAME.github.io/rick-morty-privacy-policy/privacy-policy.html
   ```
2. **Нажмите "Save"**

## ✅ Результат

После выполнения всех шагов у вас будет:
- ✅ Публичный URL для Privacy Policy
- ✅ Готовый файл для App Store Connect
- ✅ Соответствие требованиям Apple

## 🔗 Пример URL

Если ваш GitHub username `ti1ek`, то URL будет:
```
https://ti1ek.github.io/rick-morty-privacy-policy/privacy-policy.html
```

## ⚠️ Важно

- Замените `YOUR_USERNAME` на ваш реальный GitHub username
- Убедитесь, что репозиторий публичный
- Дождитесь активации GitHub Pages
