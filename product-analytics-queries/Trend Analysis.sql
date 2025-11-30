WITH daily_signups AS (
  SELECT
    signup_date,
    COUNT(user_id) AS new_users
  FROM `meditrack-app-479613.meditrack_analytics.users`
  GROUP BY signup_date
)
SELECT
  signup_date,
  new_users,
  -- Calculate average of the current row plus the previous 6 rows
  AVG(new_users) OVER(
    ORDER BY signup_date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS seven_day_rolling_avg
FROM
  daily_signups
ORDER BY
  signup_date DESC;