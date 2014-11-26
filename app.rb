require 'sinatra'
require 'slackbotsy'

## configure the bot
bot = Slackbotsy::Bot.new(
  'team'           => 'spree-oss',
  'channel'        => '#general',
  'name'           => 'botsy',
  'incoming_token' => ENV['INCOMING_TOKEN'],
  'outgoing_token' => ENV['OUTGOING_TOKEN'].split(/[\s,]+/)
)

## our working dir
dirname = File.dirname(File.expand_path(__FILE__))

## load helper functions
Dir.glob(File.join(dirname, 'helpers', '**')).each do |helper|
  require helper
end

## load all configs in this dir
bot.eval_scripts(Dir[File.join(dirname, 'scripts', '**', '*.rb')])

## receive from slack
post '/' do
  bot.handle_item(params)
end
