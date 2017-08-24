#!/bin/sh

APP_NAME=transportationServices
APP_NAME_04=transportationServices-2004
APP_NAME_15=transportationServices-2015
HOST=transportationservices
DOMAIN=apps.homedepot.com

cf t -o logisticsIT-drill -s prod
yes | cf delete-orphaned-routes

# unmapping 2015 routes
cf unmap-route ${APP_NAME_15} ${DOMAIN} --hostname ${HOST}
cf unmap-route ${APP_NAME_15} ${DOMAIN} --hostname ${HOST} --path /api/5643

# unmapping 2004 routes
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST}
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5023
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5024
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5030
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5034
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5084
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5085
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5086
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5087
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5088
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5089
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5120
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5221
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5520
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5639
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5641
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5642
cf unmap-route ${APP_NAME_04} ${DOMAIN} --hostname ${HOST} --path /api/5851

yes | cf delete-orphaned-routes

cf t -o logisticsIT -s prod

cf map-route ${APP_NAME} ${DOMAIN} --hostname ${HOST}
