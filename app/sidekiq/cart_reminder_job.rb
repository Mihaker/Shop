class CartReminderJob
  include Sidekiq::Job

  def perform
    CartService.notify
  end
end
