module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    # your_post = link_to 'あなたの投稿', post_path(notification), style:"font-weight: bold;"
    # 通知の一部をリンクにして、下のcase文の中で使用します。

    case notification.action
    when 'post_comment'
      tag.a(notification.visiter.name, href: user_path(@visiter),
                                       style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id),
                                                                                            style: 'font-weight: bold;') + 'にコメントしました'
    when 'favorite'
      tag.a(notification.visiter.name, href: user_path(@visiter),
                                       style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: post_path(notification.post_id),
                                                                                            style: 'font-weight: bold;') + 'にいいねしました'
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end