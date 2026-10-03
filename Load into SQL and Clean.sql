-- Check for inconsistent fat content labels
SELECT DISTINCT "Item Fat Content" FROM BlinkIT;

-- Standardise: 'LF' and 'low fat' → 'Low Fat', 'reg' → 'Regular'
UPDATE blinkit SET "Item Fat Content" = 'Low Fat'
WHERE "Item Fat Content" IN ('LF', 'low fat');

UPDATE blinkit SET "Item Fat Content" = 'Regular'
WHERE "Item Fat Content" = 'reg';