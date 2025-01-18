-- staff role
CREATE ROLE staff LOGIN;
ALTER USER staff WITH PASSWORD 'StaffPassword123';
GRANT SELECT ON 
    student_data,
    student_module_marks,
    low_enrollment,
    staff_session_breakdown,
    booked_rooms,
    top_5_attendance;



-- student role
CREATE ROLE student LOGIN;
GRANT SELECT ON 
    student_data,
    student_module_marks;


-- database admin role
CREATE ROLE db_admin LOGIN;
ALTER USER db_admin WITH PASSWORD 'AdminPassword123';
GRANT ALL ON database TO db_admin;


