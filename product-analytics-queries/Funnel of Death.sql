WITH funnel_counts AS (
  SELECT
  -- Count unique user who performed each action
    COUNT(DISTINCT CASE WHEN event_name = 'app_open' THEN user_id END) AS step_1_open,
    COUNT(DISTINCT CASE WHEN event_name = 'view_doctor' THEN user_id END) AS step_2_view_doc,
    COUNT(DISTINCT CASE WHEN event_name = 'video_call' THEN user_id END) AS step_3_call
  FROM
    `meditrack-app-479613.meditrack_analytics.events`
)
SELECT
  step_1_open,
  step_2_view_doc,
  step_3_call,
  -- Calculate Drop-off between step 1 and step 2
  ROUND(((step_1_open - step_2_view_doc) / step_1_open) *100,2) AS dropoff_pct_step2_to_2,
  -- Calculate Final Conversion Rate
  ROUND((step_3_call / step_1_open)* 100,2) AS total_conversion_rate
FROM
  funnel_counts;