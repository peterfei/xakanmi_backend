#encoding: utf-8
Rake::TaskManager.record_task_metadata = true
namespace :db do 
	desc '建立课程数据'
	task :course => :environment do |task|
		10.times do 
			Admin::Course.create(name:'Lession',category_id:'1',courseid:'1',total:'100',address:'初一三班',coursedate:Date.today,score:10)
		end
	end
end