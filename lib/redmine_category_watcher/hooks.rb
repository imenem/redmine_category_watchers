module RedmineCategoryWatchers
  class Hooks < Redmine::Hook::ViewListener
        def controller_issues_new_before_save(context)
      auto_watch context[:issue]
        end
    def auto_watch(issue)
      unless issue.category_id.nil?
        cw = CategoryWatcher.where(category_id:issue.category_id).first
        unless cw.nil?
          watchers = cw.watchers.split ','
            watchers.each do |id|
           user = User.find(id.to_i)
           issue.add_watcher user
          end
        end
      end
    end
  end
end
