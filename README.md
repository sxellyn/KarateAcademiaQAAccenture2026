# Karate Academia QA Accenture 2026

This repository was created to store the Karate DSL challenge from Accenture QA Academy 2026.

## Requirements

Before running the tests, make sure you have installed:

- **Java 11 or higher** (or compatible version)
- **Maven 3.x**
- **IDE** (optional, but recommended: IntelliJ IDEA or VSCode)

If you don't have the dependencies installed checkout the [Installing Dependencies](#installing-dependencies) section.

## Getting Started

First, clone the repository to your local machine:

```bash
git clone https://github.com/sxellyn/KarateAcademiaQAAccenture2026.git
cd KarateAcademiaQAAccenture2026
```

## How to Run the Tests

### Option 1: Run via CMD

Run all tests using Maven:

```bash
mvn test
```

### Option 2: Run via IDE

1. Open the project in your IDE
2. Navigate to the `KarateTest.java` class located at `src/test/java/features/KarateTest.java`
3. Run the class as a JUnit test

## View Reports

After running the tests, reports will be available at:

```
target/karate-reports/karate-summary.html
```

Open this file in your browser to view detailed test results.
<img width="1024" height="419" alt="image" src="https://github.com/user-attachments/assets/bdef8189-9587-49db-8236-10bf26854847" />

## Test Structure

Tests are organized in the following categories:

- **Account** (`features/account/`): Tests related to user creation and deletion
- **Authentication** (`features/authentication/`): Authentication and token retrieval tests
- **Bookstore** (`features/bookstore/`): Tests related to book operations (add, list, update, search)

### Schema Validation

The `schemas/` folder contains JSON schema files used for response validation.

- **Account schemas** (`schemas/account/`)
- **Authentication schemas** (`schemas/authentication/`)
- **Books schemas** (`schemas/books/`)
- **Common schemas** (`schemas/common/`): Shared schemas like error responses

Schemas used in tests through `match response == schema` to validate that API responses has the expected structure.

### Test Data

The data folders contain JSON files with test data used as request payloads in the tests:

- **User data** (`account/userdata/`): Contains user credentials and account information used in account and authentication tests:

  - `user-credentials.json` - Template for user credentials (with dynamic username generation)
  - `fixed-user-credentials.json` - Fixed user credentials for specific test scenarios
  - `invalid-user-credentials.json` - Invalid credentials for negative test cases

- **Book data** (`bookstore/bookdata/`): Contains book-related data used in bookstore tests:
  - `book-data.json` - Book data for adding books to the collection
  - `update-book.json` - Book data for updating book information

## Configuration

The API base URL is configured in `src/test/java/karate-config.js`:

- **Base URL**: `https://bookstore.demoqa.com`

To change the environment, you can modify the `baseUrl` variable in the configuration file.

## Test Tags

Tests are executed with the following tags:

- `@user` - User tests
- `@token` - Authentication tests
- `@books` - Book tests

## Installing Dependencies

This project uses Karate DSL with Maven and requires **Java (JDK)**, **Maven**, and **Git** to be installed on Windows.

---

## Install Java (JDK 11 or higher)

Karate requires **Java Development Kit (JDK) version 11 or higher**.

Follow the steps below to install Java using the official Java website.

### 1. Download the JDK

1. Go to the official Java website:  
   https://www.oracle.com/java/technologies/downloads/

2. Scroll down to the **Java SE** section.

3. Select **JDK 11** or any newer version (JDK 17, JDK 21, etc.).

4. Download the installer for your operating system:
   - **Windows**: `.exe`
   - **macOS**: `.dmg`
   - **Linux**: `.tar.gz` or package installer

### 2. Install the JDK

- Run the downloaded installer.
- Follow the installation steps using the default options.

### 3. Verify the Installation

### If needed, set the JAVA_HOME environment variable to the JDK installation path.

1. Open the Start menu
2. Search for Edit System Environment Variables
3. Go to Advanced > Click on Environment Variables... in the bottom right corner
4. On the System variables add a new one called `JAVA_HOME` with your JDK path, for example: `C:\Program Files\Java\jdk-25`
5. Then open the Path variable in System variables
6. And add this variable `%JAVA_HOME%\bin`

After the installation, open a terminal or command prompt and run:

```bat
java -version
```

You should see something like

```bat
java version "25.0.1" 2025-10-21 LTS
Java(TM) SE Runtime Environment (build 25.0.1+8-LTS-27)
Java HotSpot(TM) 64-Bit Server VM (build 25.0.1+8-LTS-27, mixed mode, sharing)
```

## Install Apache Maven

Follow the steps below to install Maven using the official Apache website.

### 1. Download Maven

1. Go to the official Maven website:  
   https://maven.apache.org/download.cgi

2. Download the **Binary zip archive**  
   (for example: `apache-maven-3.x.x-bin.zip`).

### 2. Install Maven

1. Extract the downloaded `.zip` file.
2. Move the extracted folder to a permanent location, for example: `C:\Program Files\Apache\maven`

### set the MAVEN_HOME environment variable.

1. Open the Start menu
2. Search for Edit System Environment Variables
3. Go to Advanced > Click on Environment Variables... in the bottom right corner
4. On the System variables add a new one called MAVEN_HOME with your Maven path, for example: `C:\Program Files\Apache\maven`
5. Then open the Path variable in System variables
6. And add this variable: `%MAVEN_HOME%\bin`

After the installation, open a terminal or command prompt and run:

```bat
mvn -version
```

You should see something like

```bat
Apache Maven 3.9.12 (848fbb4bf2d427b72bdb2471c22fced7ebd9a7a1)
Maven home: C:\apache-maven-3.9.12
Java version: 25.0.1, vendor: Oracle Corporation, runtime: C:\Program Files\Java\jdk-25
Default locale: en_AU, platform encoding: UTF-8
OS name: "windows 11", version: "10.0", arch: "amd64", family: "windows"
```

## Install Git on Windows

Karate requires **Git** to clone repositories and manage source code.

Follow the steps below to install Git on Windows using the official Git website.

### 1. Download Git

1. Go to the official Git website:  
   https://git-scm.com/downloads

2. Click on **Windows**.
3. The installer will start downloading automatically (`.exe` file).

### 2. Install Git

1. Run the downloaded installer.
2. Click **Next** through the installation steps.
3. Keep the default options unless you have specific preferences.
4. Make sure the option **“Git from the command line and also from 3rd-party software”** is selected.
5. Finish the installation.

### 3. Verify the Installation

After the installation, open a terminal or command prompt and run:

```bat
git --version
```
