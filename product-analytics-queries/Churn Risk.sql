SELECT
  b.user_id,
  b.event_timestamp AS booking_time,
  c.event_timestamp AS cancel_time,
  b.platform
FROM
  `meditrack-app-479613.meditrack_analytics.events` AS b
JOIN
  `meditrack-app-479613.meditrack_analytics.events` AS c
    ON b.user_id = c.user_id
WHERE
  b.event_name = 'book_apt'
  AND c.event_name = 'cancel_appt'
  AND b.event_timestamp = c.event_timestamp
ORDER BY
  b.event_timestamp;