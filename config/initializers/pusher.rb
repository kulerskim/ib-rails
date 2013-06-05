require 'pusher'

Pusher.app_id = 45754
Pusher.key = '1bf22438f25509d64e77'
Pusher.secret = '08ee99dba06b9ebcfa2d'
Pusher.logger = Rails.logger

Pusher.http_proxy = 'http://linproxy.emea.group.local:80/'