class ScheduledProcessingMailer < ApplicationMailer
    
    def check_notice_mail

    users_with_unckecked_notices = User.all.select do |user|
      user.passive_notifications.where(visited_id: user.id, checked: false).count >= 5
    end

    users_with_unckecked_notices_mails = users_with_unckecked_notices.pluck(:email)

    mail(subject: "未読の通知が5件以上あります ※通知は３日で自動削除されます", bcc: users_with_unckecked_notices_mails)
    end
end

