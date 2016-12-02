class Admin::DashboardController < Admin::BaseController
  def index
    load_data
    load_chart_data
  end

  private
  def load_data
    @users = User.all
    @category = Category.all
    @request = Request.all
    @books = Book.all
  end

  def load_chart_data
    @start_date = Date.today - Settings.number_day_of_chart
    @end_date = Date.today
    load_user_new_in_day
    load_review_new_in_day
    load_request_new_in_day
  end

  def load_user_new_in_day
    @user_new_chart_data = {}
    @users = User.created_between @start_date, @end_date
    @user_new_chart_data = get_data @users, @user_new_chart_data
  end

  def load_review_new_in_day
    @review_new_chart_data = {}
    @reviews = Review.created_between @start_date, @end_date
    @review_new_chart_data = get_data @reviews, @review_new_chart_data
  end

  def load_request_new_in_day
    @request_new_chart_data = {}
    @requests = Request.created_between @start_date, @end_date
    @request_new_chart_data = get_data @requests, @request_new_chart_data
  end

  def get_data datas, hash
    (@start_date..@end_date).each do |date|
      datas.each do |data|
        if data.created_at.to_date == date && hash[date]
          hash[date] += 1
        elsif data.created_at.to_date == date
          hash[date] = 1
        elsif hash[date].nil?
          hash[date] = 0
        end
      end
    end
    hash = hash.map {|key, value| [key.to_s, value]}
  end
end
