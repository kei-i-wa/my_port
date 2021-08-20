class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    Notification.where("created_at < ?", 30.days.ago.beginning_of_day).delete_all
    p "30日前の通知を全て削除しました"
  end

  def self.data_notice
    NoticeMailer.notice_mail.deliver_now
    p "未読通知をメールしました"
  end
end
