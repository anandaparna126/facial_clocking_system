# Facial Clocking System

This system provides an automated solution for tracking employee attendance using facial recognition technology. It allows employers to efficiently monitor employee clock-in and clock-out times without manual intervention.

## Features

- **Facial Recognition**: Utilizes facial recognition technology to identify employees and record their attendance.
- **Real-time Tracking**: Tracks employee attendance in real-time as they enter and exit the frame.
- **Database Integration**: Integrates with MySQL database for storing employee information and attendance records.
- **Automatic Logging**: Automatically logs clock-in and clock-out times for employees.
- **Attendance Reporting**: Provides reports on employee attendance, including clock-in and clock-out times.

## Requirements

- Python 3.x
- OpenCV
- NumPy
- MySQL Connector
- Face Recognition Library
- Haarcascades (for face detection)

## Installation

1. Clone the repository to your local machine:

    ```
    git clone https://github.com/yourusername/employee-attendance-system.git
    ```

2. Install the required dependencies using pip:

    ```
    pip install -r requirements.txt
    ```

3. Set up the MySQL database with appropriate tables for storing employee information and attendance records.

## Usage

1. Run the main Python script to start the system:

    ```
    python attendance_system.py
    ```

2. The system will capture video from the default camera and perform facial recognition to identify employees.
   
3. Employees' clock-in and clock-out times will be automatically recorded in the database.

4. Press 'q' to exit the application.

## Configuration

- Modify the database connection details in the script to match your MySQL server configuration.
- Adjust the face recognition model and cascade classifier paths as needed.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the system.

## License

This project is licensed under the [MIT License](LICENSE).
