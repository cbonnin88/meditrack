WITH first_bookings AS (
  SELECT
    u.user_id,
    u.signup_date,
    MIN(e.event_timestamp) AS first_booking_date
  FROM
    `meditrack-app-479613.meditrack_analytics.users` AS u
  JOIN
    `meditrack-app-479613.meditrack_analytics.events` AS e
      ON u.user_id = e.user_id
  WHERE
    e.event_name = 'book_apt'
  GROUP BY
    u.user_id,
    u.signup_date
)
SELECT
  CASE
    WHEN DATE_DIFF(first_booking_date, signup_date, DAY) = 0 THEN '1. Instant (Same Day)'
    WHEN DATE_DIFF(first_booking_date, signup_date, DAY) BETWEEN 1 AND 7 THEN '2. First Week'
    ELSE '3. Slow (>7 Days)'
  END AS speed_category,
  COUNT(user_id) AS user_count
FROM
  first_bookings
GROUP BY speed_category
ORDER BY speed_category;