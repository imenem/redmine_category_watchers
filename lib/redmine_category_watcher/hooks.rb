# frozen_string_literal: true

module RedmineCategoryWatchers
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context)
      auto_watch context[:issue]
    end

    def auto_watch(issue)
      return if issue.category_id.nil?

      cw = CategoryWatcher.where(category_id: issue.category_id).first

      return if cw.nil?

      category_watchers = cw.watchers.split(',').map(&:to_i)
      absent_watchers = category_watchers - issue.watcher_user_ids 

      absent_watchers.each do |id|
        user = User.find(id.to_i)
        issue.add_watcher user
      end
    end
  end
end
