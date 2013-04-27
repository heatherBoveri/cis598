require File.expand_path('../../boot',        __FILE__)
require File.expand_path('../../environment', __FILE__)
require 'clockwork'

include Clockwork

every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue TvShow.parseIMDB }
every(1.day, 'Queueing scheduled job', :at => '14:17') { Delayed::Job.enqueue TvShow.parseIMDB }