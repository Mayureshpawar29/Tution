# Course Management API

This API allows you to manage courses and their associated tutors.

## Exposed Endpoints

### Create a Course with Tutors

- **Endpoint:** POST /courses
- **Description:** Create a new course along with its tutors.
- **Request Format:**
  ```json
  {
    "course": {
      "title": "Introduction to Programming",
      "description": "A beginner-friendly course on programming fundamentals.",
      "start_date": "2024-06-01",
      "end_date": "2024-08-01"
    },
    "tutors": [
      { "name": "John Doe", "email": "john.doe@example.com" },
      { "name": "Jane Smith", "email": "jane.smith@example.com" }
    ]
  }


- **Endpoint:** GET /courses
- **Description:** Retrieve a list of all courses along with their associated tutors.
- **Response Format:**
  ```json
  [
    {
      "id": 1,
      "title": "Introduction to Programming",
      "description": "A beginner-friendly course on programming fundamentals.",
      "start_date": "2024-06-01",
      "end_date": "2024-08-01",
      "tutors": [
        { "id": 1, "name": "John Doe", "email": "john.doe@example.com" },
        { "id": 2, "name": "Jane Smith", "email": "jane.smith@example.com" }
      ]
    },
    {
      "id": 2,
      "title": "Another Course Title",
      "description": "Another Course Description",
      "start_date": "YYYY-MM-DD",
      "end_date": "YYYY-MM-DD",
      "tutors": [
        { "id": 3, "name": "Tutor 3", "email": "tutor3@example.com" }
      ]
    }
  ]
