-- TRANSACTION 1 (DELETE ALL STUDENT DATA FOR SPECIFIC STUDENT IF THEY DROPOUT FOR EXAMPLE)
BEGIN;

DELETE FROM STUDENT_SESSIONS WHERE stdt_id = (
    SELECT stdt_id 
    FROM STUDENTS
    WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
);

DELETE FROM STUDENT_ATTENDANCE WHERE stdt_id = (
    SELECT stdt_id 
    FROM STUDENTS
    WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
);

DELETE FROM STDT_COURSE WHERE stdt_id = (
    SELECT stdt_id 
    FROM STUDENTS
    WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
);

DELETE FROM STDT_MODULE WHERE stdt_id = (
    SELECT stdt_id 
    FROM STUDENTS
    WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
);

DELETE FROM EMERGENCY_CONTACTS WHERE contact_id = (
    SELECT contact_id
    FROM STDT_EMERGENCY_CONTACTS
    WHERE stdt_id = (
        SELECT stdt_id
        FROM Students
        WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
    )
);

DELETE FROM STDT_EMERGENCY_CONTACTS WHERE stdt_id = (
    SELECT stdt_id 
    FROM STUDENTS
    WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman'
);

DELETE FROM STUDENTS WHERE stdt_first_name = 'Cunégonde' and stdt_last_name = 'Bresman';

COMMIT;

-- TRANSACTION 2 (CREATE A NEW COURSE)
BEGIN;

INSERT INTO COURSES(course_name) VALUES 
    ('Law');

SELECT 
    course_id INTO temp_course_id 
FROM COURSES 
WHERE course_name = 'Law';

INSERT INTO MODULES(course_id, module_name) VALUES
    (temp_course_id, 'Introduction to Law'),
    (temp_course_id, 'Constitutional Law'),
    (temp_course_id, 'Contract Law'),
    (temp_course_id, 'Criminal Law'), 
    (temp_course_id, 'Properety Law');

COMMIT;

-- TRANSACTION 3 (UPDATING STAFF DETAILS)
BEGIN;

UPDATE STAFF
SET staff_city = 'Newcastle'
WHERE staff_id = (
    SELECT staff_id
    FROM STAFF
    WHERE staff_first_name = 'Emily' and staff_last_name = 'Taylor'
);

COMMIT;
