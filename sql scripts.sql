create database employeeAttendance;
use employeeAttendance;

CREATE TABLE Employee (
    empid INT AUTO_INCREMENT PRIMARY KEY,
    empname VARCHAR(255) NOT NULL,
    imgpath VARCHAR(255) NOT NULL
);
CREATE TABLE records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    empid INT,
    empname VARCHAR(255),
    date DATE,
    clockin TIME,
    clockout TIME
);
CREATE TABLE attendemp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empid INT,
    empname VARCHAR(255),
    date DATE,
    timein TIME,
    timeout TIME,
    status ENUM('Present', 'Absent')
);

-- INSERT INTO attendemp (empid, empname, date, timein, timeout, status)
-- SELECT empid,
--        empname,
--        date,
--        MIN(clockin) AS timein,
--        MAX(clockout) AS timeout,
--        CASE WHEN COUNT(clockin) > 0 THEN 'Present' ELSE 'Absent' END AS status
-- FROM records
-- GROUP BY empid, empname, date;

-- INSERT INTO attendemp (empid, empname, date, timein, timeout, status)
-- SELECT empid,
--        empname,
--        date,
--        MIN(clockin) AS timein,
--        MAX(clockout) AS timeout,
--        CASE WHEN COUNT(clockin) > 0 THEN 'Present' ELSE 'Absent' END AS status
-- FROM records
-- GROUP BY empid, empname, date
-- ON DUPLICATE KEY UPDATE
--     timein = VALUES(timein),
--     timeout = VALUES(timeout),
--     status = VALUES(status);

-- INSERT INTO attendemp (empid, empname, date, timein, timeout, status)
-- SELECT empid,
--        empname,
--        date,
--        MIN(clockin) AS timein,
--        MAX(clockout) AS timeout,
--        CASE WHEN COUNT(clockin) > 0 THEN 'Present' ELSE 'Absent' END AS status
-- FROM records
-- GROUP BY empid, empname, date
-- ON DUPLICATE KEY UPDATE
--     timeout = VALUES(timeout),
--     status = VALUES(status);

-- INSERT INTO attendemp (empid, empname, date, timein, timeout, status)
-- SELECT r.empid,
--        r.empname,
--        r.date,
--        MIN(r.clockin) AS timein,
--        MAX(r.clockout) AS timeout,
--        CASE WHEN COUNT(r.clockin) > 0 THEN 'Present' ELSE 'Absent' END AS status
-- FROM records r
-- LEFT JOIN attendemp a ON r.empid = a.empid AND r.date = a.date
-- GROUP BY r.empid, r.empname, r.date
-- ON DUPLICATE KEY UPDATE
--     timeout = VALUES(timeout),
--     status = VALUES(status);

INSERT INTO attendemp (empid, empname, date, timein, timeout, status)
SELECT r.empid,
       r.empname,
       r.date,
       MIN(r.clockin) AS timein,
       MAX(r.clockout) AS timeout,
       CASE WHEN COUNT(r.clockin) > 0 THEN 'Present' ELSE 'Absent' END AS status
FROM records r
LEFT JOIN attendemp a ON r.empid = a.empid AND r.date = a.date
WHERE a.empid IS NULL
GROUP BY r.empid, r.empname, r.date;

UPDATE attendemp a
JOIN (
    SELECT empid, date, MAX(clockout) AS latest_clockout
    FROM records
    GROUP BY empid, date
) AS r ON a.empid = r.empid AND a.date = r.date
SET a.timeout = r.latest_clockout, a.status = 'Present';

select * from records;
select * from attendemp;
select * from employee;

delete from records;
delete from attendemp;
delete from employee;

ALTER TABLE records AUTO_INCREMENT = 1;
ALTER TABLE attendemp AUTO_INCREMENT = 1;
ALTER TABLE employee AUTO_INCREMENT = 1;


