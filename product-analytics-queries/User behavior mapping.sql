SELECT
  event_name,
  COUNT(*) AS frequency
FROM (
  SELECT
    user_id,
    event_name,
    event_timestamp,
    -- Rank events by time for each user. 1 = First thing they did, 2. Second thing...
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_timestamp ASC) AS event_rank
  FROM
    `meditrack-app-479613.meditrack_analytics.events`
)  
WHERE event_rank = 2 -- We only want the 2nd action
GROUP BY event_name
ORDER BY frequency DESC;