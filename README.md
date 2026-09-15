# ORIA 🧠

**ORIA** is an AI-powered personal productivity platform built with **Ruby on Rails**.

It brings together a collection of intelligent tools designed to help users organize their work, reduce procrastination, improve focus, manage routines, study more effectively, understand their habits, and simplify everyday tasks.

The application combines traditional productivity features with AI-assisted workflows in a single, authenticated dashboard.

---

## ✨ Features

ORIA provides a collection of AI-powered productivity tools:

### 🧠 Task Breakdown

Turn complex tasks into smaller, actionable steps.

Instead of facing a large task as a single block, ORIA helps break it down into a practical sequence of steps.

### ⏱️ Anti-Procrastination

Get help identifying the first action needed to start a task and overcome the initial friction.

### 📅 Smart Planner

Organize your day and structure tasks into a more manageable plan.

### 🍅 Pomodoro

Use focused work sessions based on the Pomodoro technique to encourage concentration and intentional breaks.

### 📖 Text Simplifier

Transform complex or lengthy text into shorter, easier-to-understand content.

### 🎯 Priority Manager

Identify what should be addressed first and bring more structure to your workload.

### 💬 Message Assistant

Generate and improve emails and everyday messages.

### 📚 Study Helper

Support learning with study-oriented features such as summaries and flashcards.

### 🔔 Routines

Create and manage daily routines and habits.

### 💰 Expenses

Organize and classify personal expenses.

### 😴 Sleep Tracker

Track sleep-related habits and use the collected information to better understand routines.

### 🎉 Rewards

Create a positive feedback loop by celebrating completed goals and achievements.

### 🧘 Personal Coach

A productivity and wellbeing-oriented assistant designed to help with stress, overload, and maintaining balance.

---

## 🖥️ Application

After authentication, users access a central dashboard containing the available ORIA tools.

The application is designed around a simple idea:

> **One place to think, organize, focus and improve.**

Each tool is accessible independently while sharing the same authenticated user context.

---

## 🏗️ Architecture

ORIA follows a conventional Rails architecture with dedicated controllers, models and service objects.

```text
                    ┌─────────────────────┐
                    │      ORIA Web App    │
                    │     Rails + Hotwire │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │     Dashboard       │
                    │   Productivity UI   │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              ▼                ▼                ▼
        Task Management    AI Tools       Personal Data
              │                │                │
              ▼                ▼                ▼
           Models          Services        PostgreSQL
              │                │
              └────────┬───────┘
                       ▼
                  AI Integration
```

The application uses Rails controllers for the different productivity workflows, while domain-specific functionality is separated into AI services where appropriate.

For example, task breakdowns are processed through `Ai::TaskBreakdownService`, keeping the AI workflow separate from the controller layer.

---

## 🛠️ Tech Stack

### Backend

* Ruby
* Ruby on Rails 8.1
* PostgreSQL
* Puma
* Devise
* Active Record

### Frontend

* HTML
* Tailwind CSS
* Hotwire
* Turbo
* Stimulus
* Importmap

### AI & integrations

* AI-powered service objects
* HTTP integrations with Faraday
* Redcarpet for Markdown processing

### Development & quality

* RSpec
* RuboCop
* RuboCop Rails
* Brakeman
* Bundler Audit
* Capybara
* Selenium
* Debug

The current Gemfile confirms Rails 8.1, PostgreSQL, Devise, RSpec, Tailwind CSS Rails, Faraday and the security/development tooling listed above.

---

## 🔐 Authentication

ORIA uses **Devise** for user authentication.

Authenticated users are redirected to the productivity dashboard, while unauthenticated users are redirected to the sign-in page.

Each user has their own productivity data, including:

* Tasks
* Routines
* Expenses
* Study notes
* Sleep logs
* Rewards
* Message drafts
* Procrastination records

This data is associated directly with the authenticated user.

---

## 📂 Project Structure

```text
oria/
├── app/
│   ├── controllers/
│   │   ├── ai/
│   │   └── dashboard_controller.rb
│   ├── models/
│   ├── services/
│   ├── views/
│   └── javascript/
│
├── config/
│   ├── routes.rb
│   ├── database.yml
│   └── ...
│
├── db/
│   ├── migrate/
│   └── schema.rb
│
├── test/
│
├── Gemfile
└── README.md
```

The AI functionality is organized under the `Ai` namespace, while the dashboard acts as the central entry point to the productivity tools.

---

## 🚀 Getting Started

### Requirements

Before running ORIA locally, make sure you have:

* Ruby
* Bundler
* PostgreSQL
* Node.js, if required by your local frontend tooling
* Git

---

### 1. Clone the repository

```bash
git clone https://github.com/aotalwork/oria.git
cd oria
```

---

### 2. Install dependencies
