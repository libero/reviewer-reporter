#!/bin/sh

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This script is based on elife-xpub/scripts/prod-status.sh
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# These are the manuscript ids to ignore (these have been dealt with)
IGNORE="( \
  'e3464363-cb42-4d6f-83db-4db7c6c9da1d', \
  'a9fc13af-4c94-44a0-ae51-34ab58b666d5', \
  'ab6f9b83-69a7-44a6-83c3-9f501d0f9071', \
  'c74774c2-1cb4-4981-98dd-0459a499903e', \
  'c3a28481-23a9-4e2c-a546-ff78c25f5c3f', \
  '2e465c20-2957-4698-b693-476b92a2f604', \
  '428a6b06-1120-4970-a0dc-3c48102d46ad', \
  '785b63b5-2565-4994-b290-696e10125af3', \
  '186c16a6-fe8f-4ca2-bba9-f5725072bbb7', \
  'dd77c28a-4b35-49d0-9f73-5c647c2d55f8', \
  '28348cde-ed78-4a6b-86ab-a73624636df5', \
  'e52f80a3-dee5-461d-ba2f-1f79a1be1cc3', \
  '7a2532cd-ae92-49d0-aa30-d88c0fa1b090', \
  '0fcab2d8-ec36-4f8d-9fbe-53ffab658202', \
  '3df43115-89d2-4a05-ab56-f4deafaa9c7a', \
  '115843bc-7ce8-4fa3-9511-f1fa42ac08fa', \
  'b4c2d3cf-46cd-49e9-b4e2-c623a15df13f', \
  'e0765d6c-0562-45ac-adc1-cbc6c7456d95', \
  'b4035b37-8446-464b-a8d6-47324d2ec371', \
  '0eb33f21-a072-4dd3-827d-877c1ad719fe', \
  'c1e484ca-28ce-4d63-bd29-d0b55243a135', \
  '4e51c0ba-ffde-4478-8308-08791cd7ca39', \
  'e9cb825a-d09b-401f-b30c-df14bc9a6feb', \
  'd8ed08ab-b3b8-4f50-b443-9a5c4ed25495', \
  '9503f387-c9a3-491e-b0d0-36e15a2b384d', \
  'd3caa46a-b198-4a2b-bab6-28abdbfe303e', \
  '6917fc24-e3cf-4223-af78-d5aa56faffb0', \
  '9727fa44-0dde-44ee-82d2-d867a082848d', \
  '23eb0d6c-5c03-4575-ab00-ad57b004412b', \
  '98bd5fb5-cdb1-41ce-8537-fed10706dda3', \
  'c5c5609f-8e2c-42e7-83e0-015832146b24', \
  'c25c4cb0-4731-429d-9942-c8681cf9bcc7', \
  'dbd7d31f-b9a0-4d19-83a0-8272d2c0d90a', \
  '1b37f229-2390-4480-a5bf-df56549c0e43', \
  'b525d2f4-b6c9-4ffe-b14d-234f0d0b4f04', \
  '09262d92-58de-4df5-bd06-b5fbfc73bf2f', \
  'b0f606ea-3d5b-48a9-8cf5-261240df6e96', \
  'be77e6ff-f877-4dd8-9346-fd7330f2e41d', \
  '77c4ac29-98a5-40b0-b96a-1ab8db68bbc8', \
  'a5b70ebb-1daa-47ea-8833-850c4f6931d3', \
  '1e544e9e-c211-4182-a204-8c2e0c74912a', \
  'f45ac05d-0682-46fd-83e1-63b869997e53', \
  'ff75b755-085b-442d-b692-a2009f11ea95', \
  'c9edaccf-e944-4479-ac0e-fddde796870a', \
  'ef9b536b-8027-4dfb-a690-79766bfa15ac' \
)"

NO_TRUC_COLS="updated, meta->'title' as title, id "
COLS="updated, substring((meta->'title')::text, 1, 30) as title, id "

CMD="psql -c"
CMDX="psql -x -c"

# Commands to execute
SQL_STATUS="SELECT status, count(*) as num FROM manuscript WHERE id NOT IN ${IGNORE} GROUP BY status ORDER BY status"
SQL_PENDING="SELECT ${COLS} FROM manuscript WHERE id NOT IN ${IGNORE} AND status='MECA_EXPORT_PENDING' ORDER BY updated"
SQL_SUCCEEDED="SELECT ${COLS} FROM manuscript WHERE id NOT IN ${IGNORE} AND status='MECA_EXPORT_SUCCEEDED' ORDER BY updated"
SQL_FAILED="SELECT ${COLS} FROM manuscript WHERE id NOT IN ${IGNORE} AND status='MECA_IMPORT_FAILED' ORDER BY updated"
SQL_SURVEY="select m.count as complete, t.count as total, concat(100 * m.count / t.count, '%') as response_rate from (select count(*) from survey_response where JSONB(response->'answers'->>0)->'answer' <> '\"\"' ) as m, (select count(*) from survey_response) as t ; "

echo
echo "<h2>Survey</h2>"
echo
echo "<pre>" ; ${CMD} "${SQL_SURVEY}"; echo "</pre>"

echo
echo "<h2>Status Summary</h2>"
echo
echo "<pre>" ; ${CMD} "${SQL_STATUS}"; echo "</pre>"

echo
echo "<h2>Submissions Pending</h2>"
echo
echo "<pre>" ; ${CMD} "${SQL_PENDING}"; echo "</pre>"

echo
echo "<h2>Submissions Export Succeeded</h2>"
echo
echo "<pre>" ; ${CMD} "${SQL_SUCCEEDED}"; echo "</pre>"

echo
echo "<h2>Submissions Failed</h2>"
echo
echo "<pre>" ; ${CMD} "${SQL_FAILED}"; echo "</pre>"

echo "<hr>Generated from $(hostname)"

