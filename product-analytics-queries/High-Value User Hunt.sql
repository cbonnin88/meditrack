SELECT
  u.acquisition_channel,
  COUNT(DISTINCT u.user_id) AS total_users,
  ROUND(SUM(s.monthly_fee)) AS total_revenue,
  -- ARPU Calculation= Total Revenue / Total Users
  ROUND(SUM(s.monthly_fee) / COUNT(DISTINCT u.user_id),2) AS arpu
FROM `meditrack-app-479613.meditrack_analytics.users` AS u
JOIN `meditrack-app-479613.meditrack_analytics.subscriptions` AS s
        ON u.user_id = s.user_id
GROUP BY
  u.acquisition_channel
ORDER BY
  arpu DESC;